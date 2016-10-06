#!/bin/bash

ENCODED_OBJ=`base64 docker_hub_auth.txt`
echo $ENCODED_OBJ
curl -v  --unix-socket /var/run/docker.sock -H 'X-Registry-Auth: $ENCODED_OBJ' -X POST http:/images/tapanhalani/node-hello-world/push?tag=latest