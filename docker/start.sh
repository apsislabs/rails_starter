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

# Run Setup
bin/setup

# Delete the pidfile and start rails
rm -f tmp/pids/server.pid 2>/dev/null
bin/rails s -b 0.0.0.0
