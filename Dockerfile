FROM ruby:3.1.3-bullseye AS deps

ENV DEBIAN_FRONTEND=noninteractive
ENV BUNDLE_BUILD__SASSC=--disable-march-tune-native

RUN apt update -qq \
    && apt install -qy \
    build-essential \
    ca-certificates \
    curl \
    gnupg \
    # libmariadb-dev \ # SWITCH MYSQL: install mariadb, and remove postgresql
    # mariadb-client \
    postgresql-client-13 \
    postgresql-contrib-13 \
    && rm -rf /var/lib/apt/lists/*


# Install Node. Requires curl, ca-certificates, gnupg from above
ENV NODE_MAJOR=18
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs && \
    rm -rf /etc/apt/keyrings/nodesource.gpg /etc/apt/sources.list.d/nodesource.list

ENV BUNDLE_JOBS=5 \
    BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle


RUN gem update --system
RUN gem install bundler

RUN bundle config set force_ruby_platform true

ENV PATH="${BUNDLE_BIN}:${PATH}"

ENV APP_HOME /app
WORKDIR $APP_HOME


FROM deps as dev

CMD ["tail", "-f", "/dev/null"]

FROM deps as runner

COPY Gemfile Gemfile.lock $APP_HOME/
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile

RUN bundle check || bundle install

COPY . $APP_HOME/

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
