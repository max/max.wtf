#!/usr/bin/env sh

set -e

NOW=$(date +%s)

docker create --name extract_$NOW max/max.wtf
docker container cp extract_$NOW:/public /github/workspace
docker container rm extract_$NOW
