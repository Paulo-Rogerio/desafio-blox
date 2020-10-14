#!/usr/bin/env bash
cd $(dirname $0) 
export PGPASSWORD=123456; psql -d postgres -U postgres -h localhost < database.sql
