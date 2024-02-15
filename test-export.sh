#!/bin/sh

# - GH_TOKEN is mandatory
# - set ORG to the organization name in the curl URL
# run like this: 
# source ./get-latest-tag.sh url_encoded_package_name FOO_BAR

# check if the required variables are set
if [ -z "$1" ]; then
  echo "Usage: $0 <tag> 
  exit 1
fi

tag=$1

"$tag"="foobar"

echo "$tag=$SERVICE_XY_TAG" >> $GITHUB_ENV
