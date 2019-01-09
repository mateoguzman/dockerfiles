FROM ubuntu:16.04

ADD . /app
WORKDIR /app

RUN apt-get update && apt-get -y upgrade && apt-get autoremove

RUN apt-get install -y --no-install-recommends\
    pkg-config \
    python3.5 \
    python3-pip \
    && apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install  opencv-contrib-python 

CMD ["/bin/bash"]
