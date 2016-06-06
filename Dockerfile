FROM nefrock/docker-ai-base-gpu:latest
MAINTAINER siwazaki@nefrock.com

RUN pip install sklearn
ENV PATH $PATH:/usr/local/nvidia/bin
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib64:$LD_LIBRARY_PATH

RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.9.0rc0-cp27-none-linux_x86_64.whl

RUN ln -s /usr/local/nvidia/lib64/libcuda.so.352.63 /usr/local/nvidia/lib64/libcuda.so

RUN apt-get update && apt-get install -y emacs zsh






