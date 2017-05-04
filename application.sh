#!/bin/bash

APIGEE_TOKEN=$(get_token)

# New Application
curl -H "Authorization: Bearer $APIGEE_TOKEN" -XPOST  \
-F "runtime=node" \
-F "runtimeVersion=6" \
-F "application=node-env" \
-F "file=@app.tar" https://apigee-interlude-gcpprod.e2e.apigee.net/turbo/organizations/jbowen3/apps?stream=true
