FROM ruby:2.5-alpine
MAINTAINER wyatt@apsis.io

RUN apk add --no-cache --update \
    alpine-sdk \
    postgresql-dev \
    nodejs

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=5 \
    BUNDLE_PATH=/bundle

RUN bundle check || bundle install

COPY . $APP_HOME/

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "s", "-b", "0.0.0.0"]
