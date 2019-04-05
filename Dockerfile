FROM ruby:2.5.1-alpine3.7
MAINTAINER wyatt@apsis.io

RUN apk add --no-cache --update \
    bash \
    alpine-sdk \
    postgresql-dev \
    # mariadb-client\ # SWITCH MYSQL: install mariadb, and remove postgresql
    # mariadb-dev\
    nodejs

RUN gem install bundler:1.17.2 rails

ENV APP_HOME /app
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=5 \
    BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN bundle check || bundle install

COPY . $APP_HOME/

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
