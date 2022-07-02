#!/bin/bash -e

SCRIPT_DIR=$(dirname "$(readlink -f ".")")
ENVIRONMENT=$(env | cut -f1 -d= | grep -E '_(proxy)$' | sed 's/^/-e / ' | tr '\n' ' ')
ENVIRONMENT+="-e DISPLAY "

docker run -it --gpus all --privileged --net=host --ipc=host --pid=host -v ${SCRIPT_DIR}:/home/app/ nvcr.io/nvidia/deepstream:6.0-base bash
