#! /bin/bash

# Bundle Check
bundle check || bundle install

# Start Sidekiq
bin/vite dev
