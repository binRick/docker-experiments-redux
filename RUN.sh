#!/bin/bash
docker image ls |grep '^dockovpn'|tr -s ' '|cut -d' ' -f3| xargs -I % echo \
    docker run --name mydock --privileged -p 5005:5005 --rm -it -t % bash \
        > .w
cat .w
. .w
