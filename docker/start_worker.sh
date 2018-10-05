#! /bin/bash

# Bundle Check
bundle check || bundle install

# Start Sidekiq
bundle exec sidekiq
