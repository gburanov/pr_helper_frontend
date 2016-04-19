#!/bin/bash
set -x #echo on

# Start redis
/etc/init.d/redis-server start

bundle exec rails server
