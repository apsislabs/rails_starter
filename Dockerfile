FROM ruby:2.7.2-alpine3.12

RUN apk add --no-cache --update \
    bash \
    alpine-sdk \
    postgresql-dev \
    # mariadb-client\ # SWITCH MYSQL: install mariadb, and remove postgresql
    # mariadb-dev\
    nodejs

ENV BUNDLE_JOBS=5 \
    BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

RUN gem install bundler

ENV APP_HOME /app
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN bundle check || bundle install

COPY . $APP_HOME/

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
