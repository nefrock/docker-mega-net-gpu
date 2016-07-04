FROM nefrock/docker-ai-base-gpu:latest
MAINTAINER siwazaki@nefrock.com

RUN pip install sklearn
ENV PATH $PATH:/usr/local/nvidia/bin
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib64:$LD_LIBRARY_PATH

RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.9.0rc0-cp27-none-linux_x86_64.whl

RUN pip install pyzmq --install-option="--zmq=bundled"
RUN pip install chainer
RUN pip install msgpack-python
RUN pip install seaborn tqdm wget sh colorama
RUN apt-get -y install libmysqlclient-dev
RUN pip install mysql-python
RUN apt-get update && apt-get install -y emacs zsh






