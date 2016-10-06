#!/bin/bash

tar zcf node-hello-world.tar.gz .
curl -v  --unix-socket /var/run/docker.sock -H 'Content-Type: application/tar' --data-binary @node-hello-world.tar.gz  -X POST http:/build?t=tapanhalani/node-hello-world:latest
