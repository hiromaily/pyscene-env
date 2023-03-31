FROM python:3.9.16-slim

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN pip install --upgrade pip && \
  pip install opencv-python numpy Click tqdm appdirs scenedetect


WORKDIR /workspace

