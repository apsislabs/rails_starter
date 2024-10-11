#! /bin/bash

# Wait for PostgreSQL
until curl postgres:5432 2>&1 | grep '52'; do
  echo 'Waiting for PostgreSQL...'
  sleep 1
done
echo "PostgreSQL is up and running"

# Bundle Check
bundle check || bundle install

# Start Sidekiq
bin/jobs
