#!/bin/bash

APIGEE_TOKEN=$(cat valid_token.dat)

# Update Deployment
curl -H "Authorization: Bearer $APIGEE_TOKEN" -XPATCH \
  https://apigee-interlude-gcpprod.e2e.apigee.net/turbo/environments/jbowen3:test/deployments/node-env \
  -H 'content-type: application/json' \
  -d '{
	"application": "node-env",
	"revision": "3"
}'