FROM ubuntu:16.04

ADD . /app
WORKDIR /app

ARG INSTALL_DIR=/opt/intel/computer_vision_sdk

RUN apt-get update && apt-get -y upgrade && apt-get autoremove

RUN apt-get install -y --no-install-recommends \
        build-essential \
        cpio \
        curl \
        lsb-release \
        pciutils \
        python3.5 \
        python3-pip

RUN pip3 --no-cache-dir install  opencv-contrib-python

# installing OpenVINO dependencies
RUN cd /app/l_openvino_toolkit* && \
    ./install_cv_sdk_dependencies.sh

## installing OpenVINO itself
RUN cd /app/l_openvino_toolkit* && \
    sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh --silent silent.cfg

RUN /bin/bash -c "source $INSTALL_DIR/bin/setupvars.sh"

CMD ["/bin/bash"]
