# Stream RTSP from a video file.

Uses fmpeg and ffserver to input an mp4 file and stream it to an rtsp server

## Instruction

1. Build the docker image

```sh
docker build -t ffserver . 
```

2. Place your streaming video in the root folder and name it video.mp4

3. Run the container

```sh
docker run -ti --network="host" -v "$(pwd)/video/":/app/video ffserver
```

Note that we use the host networking option to expose the RTSP stream in the host machine.

4. You can reproduce your stream using VLC or ffplay using the following url:

```sh
rtsp://<host-ip>:5554/live
```

## TODO

The running script could automatically detect videos in the ./video folder


