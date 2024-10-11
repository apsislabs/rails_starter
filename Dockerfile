FROM public.ecr.aws/docker/library/ruby:3.2-alpine3.19 AS runner

ENV APP_HOME="/app"
ENV BUNDLE_BIN="/bundle/bin"
ENV DEBIAN_FRONTEND="noninteractive"
ENV BUNDLE_BUILD__SASSC="--disable-march-tune-native"
ENV BUNDLE_JOBS="5"
ENV BUNDLE_PATH="/bundle"
ENV GEM_HOME="/bundle"
ENV BUNDLE_GEMFILE="$APP_HOME/Gemfile"
ENV CHROME_BIN="/usr/bin/chromium"
ENV CHROME_PATH="/usr/lib/chromium/"
ENV PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR $APP_HOME

# Update Gems first...only re-do this when bundler version changes.
# If we need to force a gem update we'll have to `--no-cache` or add a file we can copy in
RUN gem update --system && gem install bundler:2.3.25

COPY ./server/apk-updated-date.txt .
RUN apk add --update --no-cache \
    alpine-sdk \
    ca-certificates \
    curl \
    bash \
    chromium \
    fontconfig \
    graphviz \
    gcompat \
    imagemagick \
    imagemagick-jpeg \
    imagemagick-pdf \
    msttcorefonts-installer \
    nodejs \
    npm \
    pandoc \
    libpq-dev \
    postgresql13-dev \
    vips-dev \
    && rm ./apk-updated-date.txt \
    && npm install -g pm2@4.5.6

COPY ./server/Gemfile ./server/Gemfile.lock ./
RUN bundle install && rm ./Gemfile ./Gemfile.lock

COPY ./server/deploy/minimagick/policy.xml /etc/ImageMagick-6/
COPY ./server $APP_HOME/

# copy all font files to the font install directory, so chromium can use these fonts directly
# this way we don't have to embed fonts in the HTML
RUN find lib/assets/fonts -name '*.ttf' -exec ln '{}' /usr/share/fonts/ \;

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
