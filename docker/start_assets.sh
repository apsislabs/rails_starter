#! /bin/bash

# Bundle Check
bundle check || bundle install

# Start assets
npm install
bin/vite dev
