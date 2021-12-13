FROM nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04

FROM nvcr.io/nvidia/pytorch:20.08-py3

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

#vid2vid dependencies
RUN apt-get install libglib2.0-0 libsm6 libxrender1 -y
RUN pip install dominate requests opencv-python 

#vid2vid install
RUN git clone https://github.com/NVIDIA/vid2vid /vid2vid
WORKDIR /vid2vid
#download flownet2 model dependencies
#WARNING: we had an instance where these scripts needed to be re-run after the docker instance was launched
RUN python scripts/download_flownet2.py
RUN python scripts/download_models_flownet2.py
RUN python scripts/download_datasets.py
RUN sh models/flownet2pytorch/install.sh
RUN pip install dlib
RUN python scripts/face/download_models.py
#RUN python data/face_landmark_detection.py train
#RUN python data/face_landmark_detection.py test

RUN git clone https://github.com/HeunSeungLim/ml4a.git

