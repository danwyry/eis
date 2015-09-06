#!/usr/bin/env sh
set -e

cd ejemplo_banco
bundle install
bundle exec rake

cd ..

cd kata1
bundle install
bundle exec rake