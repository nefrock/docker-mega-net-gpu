FROM nefrock/docker-ai-base-gpu:latest
MAINTAINER siwazaki@nefrock.com
RUN pip install sklearn
RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.9.0rc0-cp27-none-linux_x86_64.whl

RUN apt-get update && apt-get install -y emacs zsh

ENV PATH $PATH:/usr/local/nvidia/bin
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib64:$LD_LIBRARY_PATH





