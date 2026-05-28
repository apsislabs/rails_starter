# Multi-stage build for better caching and smaller images
FROM node:24-alpine AS node

FROM public.ecr.aws/docker/library/ruby:4.0-alpine3.22 AS base

ENV APP_HOME="/app"
ENV BUNDLE_BIN="/bundle/bin"
ENV DEBIAN_FRONTEND="noninteractive"
ENV BUNDLE_BUILD__SASSC="--disable-march-tune-native"
ENV BUNDLE_JOBS="5"
ENV BUNDLE_PATH="/bundle"
ENV GEM_HOME="/bundle"
ENV BUNDLE_GEMFILE="$APP_HOME/Gemfile"
ENV PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR $APP_HOME

# System packages - rarely change, good for caching
RUN apk add --update --no-cache \
    alpine-sdk \
    build-base \
    ca-certificates \
    curl \
    bash \
    fontconfig \
    graphviz \
    gcompat \
    imagemagick \
    imagemagick-jpeg \
    imagemagick-pdf \
    msttcorefonts-installer \
    libpq-dev \
    postgresql16-dev \
    postgresql16-client \
    vips-dev \
    yaml-dev \
    && rm -rf /var/cache/apk/*

# Gems and bundler - only changes when versions change
RUN gem update --system && gem install bundler:2.7.2

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

# Development stage
FROM base AS development

# Copy dependency files first for better caching
COPY ./Gemfile ./Gemfile.lock ./
RUN bundle install --with development test

# Copy package.json for Node dependencies
COPY ./package.json ./package-lock.json ./
RUN npm ci

# Copy configuration files
COPY ./docker/confs/minimagick-policy.xml /etc/ImageMagick-6/

# Copy application code last (changes most frequently)
COPY . $APP_HOME/

EXPOSE 3000
CMD ["bin/rails", "s", "-b", "0.0.0.0"]

# Production stage
FROM base AS production

# Copy dependency files first
COPY ./Gemfile ./Gemfile.lock ./
RUN bundle config set --local without 'development test' && \
    bundle install && \
    bundle clean --force && \
    rm -rf /bundle/cache/*.gem

# Copy package.json and install production dependencies only
COPY ./package.json ./package-lock.json ./
RUN npm ci --omit=dev && npm cache clean --force

# Copy configuration files
COPY ./docker/confs/minimagick-policy.xml /etc/ImageMagick-6/

# Copy application code
COPY . $APP_HOME/

# Precompile assets
RUN SECRET_KEY_BASE=abc RAILS_ENV=production bundle exec rails assets:precompile

# Create non-root user for security
RUN addgroup -g 1001 -S rails && \
    adduser -S -D -H -u 1001 -h $APP_HOME -s /sbin/nologin -G rails -g rails rails && \
    chown -R rails:rails $APP_HOME /bundle

USER rails

EXPOSE 3000
CMD ["docker/start.sh"]
