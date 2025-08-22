FROM public.ecr.aws/docker/library/ruby:3.4-alpine3.22 AS runner

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

# Update Gems first...only re-do this when bundler version changes.
# If we need to force a gem update we'll have to `--no-cache` or add a file we can copy in
RUN gem update --system && gem install bundler:2.5.21

COPY ./docker/.apkcache .
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
    nodejs \
    npm \
    libpq-dev \
    postgresql16-dev \
    vips-dev \
    yaml-dev \
    && rm ./.apkcache

COPY ./docker/confs/minimagick-policy.xml /etc/ImageMagick-6/
COPY ./Gemfile ./Gemfile.lock ./
RUN bundle install && rm ./Gemfile ./Gemfile.lock

COPY . $APP_HOME/

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
