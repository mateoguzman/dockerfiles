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

WORKDIR /

# OpenCV installation
# Intel CPU Options
ARG AVX=ON
ARG AVX2=ON
ARG SSE41=ON
ARG SSE42=ON
ARG SSSE3=ON
ARG TBB=ON

ARG IPP=ON
# Include NVidia Cuda Runtime support
ARG CUDA=OFF
# Include NVidia Cuda Fast Fourier Transform (FFT) library support
ARG CUFFT=OFF
# Include NVidia Cuda Basic Linear Algebra Subprograms (BLAS) library support
ARG CUBLAS=OFF
# Include OpenCL Runtime support
ARG OPENCL=OFF
# Include OpenCL Shared Virtual Memory support" OFF ) experimental
ARG OPENCL_SVM=OFF
ARG OPENGL=ON
ARG GSTREAMER=ON
ARG FFMPEG=ON
ARG GTK=ON
ARG QT=OFF
ARG NONFREE=OFF
# Include Intel Perceptual Computing SDK
ARG INTELPERC=OFF
ARG PREFIX=/usr/local
ARG VERSION=master
ARG PYTHON_BIN=/usr/bin/python
ARG PYTHON_LIB=/usr/lib/x86_64-linux-gnu/libpython2.7.so

ARG OPENCV_VERSION="4.0.0"

RUN git clone --depth 1 -b $OPENCV_VERSION https://github.com/opencv/opencv.git opencv-$OPENCV_VERSION

RUN mkdir /opencv-$OPENCV_VERSION/cmake_binary \
    && cd /opencv-$OPENCV_VERSION/cmake_binary \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DOPENCV_ENABLE_NONFREE=$NONFREE \
        -DBUILD_opencv_java=OFF \
        -DWITH_CUDA=$CUDA \
        -DWITH_CUBLAS=$CUBLAS \
        -DWITH_CUFFT=$CUFFT \
        -DENABLE_AVX=$AVX \
        -DENABLE_AVX2=$AVX2 \
        -DENABLE_SSE41=$SSE41 \
        -DENABLE_SSE42=$SSE42 \
        -DENABLE_SSSE3=$SSSE3 \
        -DWITH_OPENGL=$OPENGL \
        -DWITH_GTK=$GTK \
        -DWITH_GSTREAMER=$GSTREAMER \
        -DWITH_OPENCL=$OPENCL \
        -DWITH_OPENCL_SVM=$OPENCL_SVM \
        -DWITH_TBB=$TBB \
        -DWITH_JPEG=ON \
        -DWITH_WEBP=ON \
        -DWITH_TIFF=ON \
        -DWITH_PNG=ON \
        -DWITH_QT=$QT \
        -DWITH_IPP=$IPP \
        -DWITH_EIGEN=ON \
        -DWITH_V4L=ON \
        # Inference Engine
        -DWITH_INF_ENGINE=ON \
        -DENABLE_CXX11=ON \
        -DWITH_INTELPERC=$INTELPERC \
        -DWITH_FFMPEG=$FFMPEG \
        -DENABLE_PRECOMPILED_HEADERS=ON \
        -DBUILD_opencv_python2=ON \
        -DBUILD_opencv_python3=NO \
        -DPYTHON2_EXECUTABLE=$PYTHON_BIN \
        -DPYTHON2_LIBRARIES=$PYTHON_LIB \
        -DPYTHON_LIBRARIES=$PYTHON_LIB \
        -DPYTHON2_INCLUDE_DIR=$($PYTHON_BIN -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -DPYTHON2_PACKAGES_PATH=$($PYTHON_BIN -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
        -DBUILD_DOCS=NO \
        -DBUILD_PERF_TESTS=OFF \
        -DBUILD_TESTS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DINSTALL_PYTHON_EXAMPLES=OFF \
        -DINSTALL_C_EXAMPLES=OFF \
    && make -j$(nproc) \
    && make install \
    && rm -rf /opencv-$OPENCV_VERSION
########OPENCV END

CMD ["/bin/bash"]
