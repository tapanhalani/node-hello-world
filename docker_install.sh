echo "hello tapan"

curl --unix-socket /var/run/docker.sock http:/containers/json

tar zcf node-hello-world.tar.gz .

curl -v  --unix-socket /var/run/docker.sock -H 'Content-Type: application/tar' --data-binary @node-hello-world.tar.gz  -X POST http:/build?t=tapanhalani/node-hello-world:latest

curl -v  --unix-socket /var/run/docker.sock -H 'X-Registry-Auth: eyAidXNlcm5hbWUiOiAidGFwYW5oYWxhbmkiLCAicGFzc3dvcmQiOiAiMjhtYXJjaDE5OTQiLCAiZW1haWwiOiAidGFwYW5oYWxhbmkyMzFAZ21haWwuY29tIiB9' -X POST http:/images/tapanhalani/node-hello-world/push?tag=latest
