#!/bin/bash
set -x #echo on

docker run \
  -p 80:3000 \
  -e AWS_PRIVATE_ACCESS_KEY_ID=$AWS_PRIVATE_ACCESS_KEY_ID \
  -e AWS_PRIVATE_SECRET_ACCESS_KEY=$AWS_PRIVATE_SECRET_ACCESS_KEY \
  pr_helper_frontend:latest
