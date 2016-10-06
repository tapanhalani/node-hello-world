#!/bin/bash

ENCODED_OBJ=`base64 docker_hub_auth.txt`
FINAL_OBJ="$(echo -e "${ENCODED_OBJ}" | tr -d '[[:space:]]')"
echo -e "FINAL_OBJ='${FINAL_OBJ}'"
curl -v  --unix-socket /var/run/docker.sock -H "X-Registry-Auth:$FINAL_OBJ" -X POST http:/images/tapanhalani/node-hello-world/push?tag=latest
