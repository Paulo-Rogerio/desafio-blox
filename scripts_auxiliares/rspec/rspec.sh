#!/usr/bin/env bash
set -e
cd $(dirname $0)
sh stop.sh
sh start.sh
sleep 5 
export PGPASSWORD=123456; psql -d postgres -U postgres -h localhost -p 5433 < database.sql
cd -
alias cp=cp
RAILS_ENV=test bundle exec rake db:migrate
RAILS_ENV=test bundle exec rspec

