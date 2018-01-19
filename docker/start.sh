#! /bin/bash

# Wait for PostgreSQL
until curl postgres:5432 2>&1 | grep '52'; do
  echo 'Waiting for PostgreSQL...'
  sleep 1
done
echo "PostgreSQL is up and running"

# Bundle Check
bundle check || bundle install

# If database exists, migrate. Otherweise create and seed
bin/rails db:migrate 2>/dev/null || bundle exec rake db:setup db:seed

bin/rails s -b 0.0.0.0
