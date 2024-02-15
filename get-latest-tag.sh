#!/bin/sh

# - GH_TOKEN is mandatory
# - set ORG to the organization name in the curl URL
# run like this: 
# source ./get-latest-tag.sh url_encoded_package_name FOO_BAR

# check if the required variables are set
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <package> <tag>"
  exit 1
fi

# get the package and tag from the command line arguments
package=$1
tag=$2

response=$(curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer ${GH_TOKEN}" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/orgs/ORG/packages/container/$package/versions)
is_array_of_objects=$(echo "$response" | jq 'if type=="array" then all(.[]; type=="object") else false end')

if [ "$is_array_of_objects" = "true" ]; then
  latest_tag=$(echo "$response" | jq -r '.[] | select(.metadata.container.tags[] | contains("latest")) | .metadata.container.tags[] | select(startswith("release_"))')

  export "$tag"="$latest_tag"
  export BAZ=123456

  echo $tag
  echo $latest_tag
else
  echo "The response is not valid"
  echo $response
fi
