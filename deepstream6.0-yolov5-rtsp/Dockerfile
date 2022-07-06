
FROM nvcr.io/nvidia/deepstream:6.0-base

ARG DEBIAN_FRONTEND=noninteractive
RUN echo "deb https://developer.download.nvidia.com.cn/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list
RUN apt-get update -q && apt-get install -y -q python3-pip python3-ply && rm -rf /var/lib/apt/lists/*
RUN apt-get update -q && apt-get install -y -q python3-gi libgl1 libglib2.0-dev libglib2.0-dev-bin  python-gi-dev python3-dev python3-gst-1.0 libgstrtspserver-1.0-0 gstreamer1.0-rtsp libgirepository1.0-dev gobject-introspection gir1.2-gst-rtsp-server-1.0 && rm -rf /var/lib/apt/lists/*

COPY . /home/app/
RUN echo "/usr/local/lib" >> /etc/ld.so.conf.d/all-libs.conf && ldconfig
RUN pip3 install /home/app/pyds-1.1.0-py3-none*.whl && rm -f /home/app/pyds-1.1.0-py3-none

RUN cd /home/app && \
    rm -f build.sh run.sh Dockerfile pyds-1.1.0-py3-none*.whl gen_wts*.py

ENV GST_LIBS="-lgstreamer-1.0 -lgobject-2.0 -lglib-2.0"
ENV GST_CFLAGS="-pthread -I/usr/include/gstreamer-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include"

WORKDIR /home

##
ARG  USER=docker
ARG  GROUP=docker
ARG  UID
ARG  GID
## must use ; here to ignore user exist status code
RUN  [ ${GID} -gt 0 ] && groupadd -f -g ${GID} ${GROUP}; \
     [ ${UID} -gt 0 ] && useradd -d /home -M -g ${GID} -K UID_MAX=${UID} -K UID_MIN=${UID} ${USER}; \
     touch /var/run/nginx.pid && \
     mkdir -p /var/log/nginx /var/lib/nginx && \
     chown ${UID}:${GID} $(find /home -maxdepth 2 -type d -print) /var/run/nginx.pid && \
     chown -R ${UID}:${GID} /var/log/nginx /var/lib/nginx
USER ${UID}


