FROM ubuntu:16.04

ADD . /app
WORKDIR /app

RUN apt-get update && apt-get -y upgrade && apt-get autoremove

RUN apt-get install -y --no-install-recommends\
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    yasm \
    libgtk2.0-dev \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    python3.5-dev \
    python3-pip \
    && apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install  opencv-contrib-python 
RUN pip3 install --upgrade pip
RUN pip3 install numpy 

ENV OPENCV_VERSION="4.0.0"

RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
        && unzip ${OPENCV_VERSION}.zip \
        && mkdir /opencv-${OPENCV_VERSION}/cmake_binary \
        && cd /opencv-${OPENCV_VERSION}/cmake_binary \
        && cmake \
        -DBUILD_DOCS=NO \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_opencv_java=OFF \
        -DBUILD_opencv_python2=ON \
        -DBUILD_opencv_python3=NO \
        -DBUILD_TESTS=OFF \
        -DBUILD_TIFF=ON \
        -DBUILD_PERF_TESTS=OFF \
        -DENABLE_AVX=ON \
        -DENABLE_AVX2=ON \
        -DENABLE_PRECOMPILED_HEADERS=ON \
        -DENABLE_SSE41=ON \
        -DENABLE_SSE42=ON \
        -DENABLE_SSSE3=ON \
        -DENABLE_CXX11=ON \
        -DINSTALL_PYTHON_EXAMPLES=OFF \
        -DINSTALL_C_EXAMPLES=OFF \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") \
        -DOPENCV_ENABLE_NONFREE=OFF \
        -DPYTHON_EXECUTABLE=$(which python3) \
        -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -DPYTHON_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
        -DWITH_CUDA=OFF \
        -DWITH_CUBLAS=OFF \
        -DWITH_CUFFT=OFF \
        -DWITH_EIGEN=ON \
        -DWITH_FFMPEG=ON \
        -DWITH_GSTREAMER=ON \
        -DWITH_GTK=ON \
        -DWITH_INF_ENGINE=ON \
        -DWITH_INTELPERC=OFF \
        -DWITH_IPP=ON \
        -DWITH_JPEG=ON \
        -DWITH_OPENGL=ON \
        -DWITH_OPENCL=OFF \
        -DWITH_OPENCL_SVM=OFF \
        -DWITH_PNG=ON \
        -DWITH_QT=OFF \
        -DWITH_TBB=ON \
        -DWITH_TIFF=ON \
        -DWITH_V4L=ON \
        -DWITH_WEBP=ON \
        .. \
        && make -j$(nproc) \
        && make install \
        && rm /${OPENCV_VERSION}.zip \
        && rm -r /opencv-${OPENCV_VERSION} 


#RUN ln -s \
#/usr/local/python/cv2/python-3.7/cv2.cpython-37m-x86_64-linux-gnu.so \
#/usr/local/lib/python3.7/site-packages/cv2.so

CMD ["/bin/bash"]
