function dockerClean
    docker rm $(docker ps -qa --no-trunc --filter "status=exited")
    docker volume rm $(docker volume ls -qf dangling=true)
    docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
end  