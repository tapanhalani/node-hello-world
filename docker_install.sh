echo "hello tapan"

curl --unix-socket /var/run/docker.sock http:/containers/json

tar zcf node-hello-world.tar.gz .

curl -v  --unix-socket /var/run/docker.sock -H 'Content-Type: application/tar' --data-binary @node-hello-world.tar.gz  -X POST http:/build?t=tapanhalani/node-hello-world:latest

curl -v  --unix-socket /var/run/docker.sock -H 'X-Registry-Auth: { "username": "tapanhalani", "password": "28march1994", "email": "tapanhalani231@gmail.com" }' -X POST http:/images/tapanhalani/node-hello-world/push?tag=latest
