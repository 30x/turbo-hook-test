#!/bin/bash

# Get Repo
curl -L https://api.github.com/repos/30x/node-test-app/tarball > temp.tar

# Get the zip in the right setup
tar -xf temp.tar
cd 30x-node-test-app-0cd84c1
tar -cf ../app.tar .

cd ..

# Cleanup
rm -rf 30x-node-test-app-0cd84c1
rm -f temp.tar

# New Application
APIGEE_TOKEN=$(get_token)
curl -H "Authorization: Bearer $APIGEE_TOKEN" -XPOST  \
-F "runtime=node" \
-F "runtimeVersion=6" \
-F "application=node-env" \
-F "file=@app.tar" https://apigee-interlude-gcpprod.e2e.apigee.net/turbo/organizations/jbowen3/apps?stream=true

# Update Deployment
APIGEE_TOKEN=$(get_token)
curl -H "Authorization: Bearer $APIGEE_TOKEN" -XPATCH \
  https://apigee-interlude-gcpprod.e2e.apigee.net/turbo/environments/jbowen3:test/deployments/node-env \
  -H 'content-type: application/json' \
  -d '{
	"application": "node-env",
	"revision": "12"
}'