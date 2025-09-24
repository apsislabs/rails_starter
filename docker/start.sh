#! /bin/bash

# Wait for PostgreSQL
until curl ${POSTGRES_URL:-postgres}:5432 2>&1 | grep '52'; do
  echo 'Waiting for PostgreSQL...'
  sleep 1
done
echo "PostgreSQL is up and running"

# Run migrations and build assets in production
if [ "$RAILS_ENV" = "production" ]; then
  echo "Running production setup..."
  bin/rails db:migrate
fi

# Precompile assets
echo "Precompiling Assets..."
bundle exec rails assets:precompile

# Delete the pidfile and start rails
echo "Stating Rails..."
rm -f tmp/pids/server.pid 2>/dev/null
bin/rails s -b 0.0.0.0
