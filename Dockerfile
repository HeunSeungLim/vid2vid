FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
#devel-ubuntu16.04

FROM nvcr.io/nvidia/pytorch:19.01-py3

RUN apt-get update && apt-get install -y rsync htop git openssh-server
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip install --upgrade pip
RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test
RUN sudo apt-get update
RUN sudo apt-get install gcc-8
RUN apt-get update && apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
        build-essential \
        cmake \
        git \
        curl \
        vim \
        tmux \
        wget \
        bzip2 \
        unzip \
        g++ \
        ca-certificates \
        ffmpeg \
        libx264-dev \
        imagemagick
# RUN apt-get install gcc
#RUN pip install torch==1.4.0+cu92 torchvision==0.5.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html


#Torch and dependencies:
#RUN pip install torch==1.10.0


#RUN pip install torchvision
#RUN pip install numpy
#RUN pip install cffi tensorboardX
#RUN pip install tqdm scipy scikit-image colorama==0.3.7 
#RUN pip install setproctitle pytz ipython

#vid2vid dependencies
#RUN apt-get install libglib2.0-0 libsm6 libxrender1 -y
#RUN pip install dominate requests opencv-python 

#pix2pixHD, required for initializing training
RUN git clone https://github.com/NVIDIA/pix2pixHD /pix2pixHD

#vid2vid install
RUN git clone https://github.com/NVIDIA/vid2vid /vid2vid
#WORKDIR /vid2vid
#download flownet2 model dependencies
#WARNING: we had an instance where these scripts needed to be re-run after the docker instance was launched
#RUN python scripts/download_flownet2.py
#RUN python scripts/download_models_flownet2.py
#RUN python scripts/download_datasets.py
#RUN pip install dlib
#RUN python data/face_landmark_detection.py train
#RUN python data/face_landmark_detection.py test

