docker inspect --format='{{json .State.Health}}' mydock|jq
