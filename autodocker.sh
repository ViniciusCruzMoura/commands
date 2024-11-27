#!/bin/sh

#set -xe

case $1 in
    -b|-build|--build|build)
        docker build --network=host -t $(basename $PWD) .
        exit 0
        ;;
    -d|-dev|--dev|dev)
        if docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "^$(basename $PWD):latest$"; then
            echo
        else
            docker build --network=host -t $(basename $PWD) .
        fi
        docker run -it --rm --network=host --env-file .env --name $(basename $PWD) -v "$PWD":/"$(basename $PWD)" -w /"$(basename $PWD)" $(basename $PWD) bash
        exit 0
        ;;
    -rmi|--rmi|rmi)
        docker rmi $(basename $PWD) --force
        exit 0
        ;;
    -h|-help|--help|help|*)
        echo "These are common commands used in various situations:"
        echo 
        echo "Uso:"
        echo "  autodocker COMMAND"
        echo
        echo "Commands:"
        echo "  help            Display this help information."
        echo "  build           Build a new Docker image."
        echo "  dev             Run the Docker image if it exists; otherwise, build the image and then run it."
        echo "  rmi             Remove the Docker image by untagging it."
        echo 
        echo "autodocker COMMAND --help to get help on each command"
        echo		
        exit 0
        ;;
esac
