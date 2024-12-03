#!/bin/sh

set -e
export NODE_OPTIONS=--openssl-legacy-provider
bundle config unset without
bundle install
bundle exec rails db:migrate || bundle exec rails db:create db:migrate db:seed || echo "skipping dump error"
rm -f tmp/pids/server.pid
bin/rails assets:precompile
bin/rails webpacker:compile
./bin/webpack
bundle exec rails s -b 0.0.0.0