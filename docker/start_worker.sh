#! /bin/bash

# Wait for PostgreSQL
until curl postgres:5432 2>&1 | grep '52'; do
  echo 'Waiting for PostgreSQL...'
  sleep 1
done
echo "PostgreSQL is up and running"

# SWITCH MySQL: Disable Postgres above enable MySQL below
# # Wait for MySQL
# until nc -z -v -w30 mysql 3306
# do
#   echo "Waiting for MySQL..."
#   sleep 1
# done
#
# echo "MySQL is up and running"

# Bundle Check
bundle check || bundle install

# Start Sidekiq
bundle exec sidekiq
