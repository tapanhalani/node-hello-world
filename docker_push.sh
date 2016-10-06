#!/bin/bash

curl -v  --unix-socket /var/run/docker.sock -H 'X-Registry-Auth: eyB1c2VybmFtZTogdGFwYW5oYWxhbmksIHBhc3N3b3JkOiAyOG1hcmNoMTk5NCwgZW1haWw6IHRhcGFuaGFsYW5pMjMxQGdtYWlsLmNvbSB9Cg' -X POST http:/images/tapanhalani/node-hello-world/push?tag=latest
