docker image ls|grep REPO -v|tr -s ' '|cut -d' ' -f3|xargs -I % docker image rm %
