#!/bin/bash -eu
docker ps -a | grep nullab | awk '{print $1}' | xargs docker rm
docker volume ls | grep nullab | awk '{print $2}' | xargs docker volume rm
docker image ls | grep nullab | awk '{print $1}' | xargs docker image rm
