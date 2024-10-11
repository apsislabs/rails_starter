#!/usr/bin/env bash

UPDATE_FILENAME=$(realpath $(dirname $(dirname $0)))/docker/.apkcache

date > $UPDATE_FILENAME

echo "Date Updated: $(cat $UPDATE_FILENAME)"