#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 <tag>" 
  exit 1
fi

tag=$1
value="baz"

echo "$tag=$value" | tee -a $GITHUB_ENV
