#!/bin/bash

json_value() {
    KEY=$1
    num=$2
    awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'"$KEY"'\042/){print $(i+1)}}}' | tr -d '"' | sed -n "${num}p"
}

token_result=$(curl -X POST -s -L "https://$BASEURL/oauth2/token" \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=utf-8' \
  -d "client_id=${CLIENT_ID}&client_secret=$CLIENT_SECRET")

token=$(echo "$token_result" | json_value "access_token" | sed 's/ *$//g' | sed 's/^ *//g')

installer_query=$(
  curl -s -L -G "https://$BASEURL/sensors/combined/installers/v1" \
    --data-urlencode "offset=0" \
    --data-urlencode "limit=1" \
    --data-urlencode "sort=version|desc" \
    --data-urlencode "filter=os:\"Amazon Linux\"+os_version:\"2023\"" \
    -H "Authorization: Bearer $token"
  )

installer_sha=$(echo "$installer_query" | json_value "sha256" \
  | sed 's/ *$//g' | sed 's/^ *//g')

echo "Downloading latest version of falcon-sensor"
curl -s -L "https://$BASEURL/sensors/entities/download-installer/v1?id=$installer_sha" \
 -H "accept: application/json" -H "authorization: Bearer $token" -o "/tmp/additional-packages/$FILENAME"