FROM ubuntu:18.04

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
      ffmpeg && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD . /app/

EXPOSE 5554 8090

CMD ["bash","stream_video.sh"]

