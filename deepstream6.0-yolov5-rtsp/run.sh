#!/bin/bash -e

SCRIPT_DIR=$(dirname "$(readlink -f ".")")
ENVIRONMENT=$(env | cut -f1 -d= | grep -E '_(proxy)$' | sed 's/^/-e / ' | tr '\n' ' ')
ENVIRONMENT="-e DISPLAY "

#docker run -it --gpus all --privileged --net=host --ipc=host --pid=host -v ${SCRIPT_DIR}:/home/app/ nvcr.io/nvidia/deepstream:6.0-base bash

#docker run -itd --gpus all --privileged --net=host --ipc=host --pid=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ${SCRIPT_DIR}:/home/app/ deepstream-yolov5:6.0 bash

APP_DIR=/home/media/workspace/nvidia/home-deepstream/ 
docker run -itd --gpus all --privileged --net=host --ipc=host --pid=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ${APP_DIR}:/home/app/ deepstream-yolov5:6.0-dev bash
