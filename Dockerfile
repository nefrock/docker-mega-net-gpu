FROM nefrock/docker-ai-base-gpu:latest
MAINTAINER siwazaki@nefrock.com
RUN apt-get update && apt-get install -y emacs zsh libmysqlclient-dev vim
RUN pip2 install --force-reinstall --upgrade pip
RUN pip3 install --force-reinstall --upgrade pip
RUN pip2 install -U setuptools
RUN pip3 install -U setuptools

RUN pip2 install \
  moviepy \
  sklearn \
  chainer \
  msgpack-python \
  seaborn \
  tqdm \
  wget \
  sh \
  colorama \
  pillow \
  wheel

RUN pip3 install \
  moviepy \
  sklearn \
  chainer \
  msgpack-python \
  seaborn \
  tqdm \
  wget \
  sh \
  colorama \
  pillow \
  wheel


ENV PATH $PATH:/usr/local/nvidia/bin
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:/usr/local/nvidia/lib64:$LD_LIBRARY_PATH

RUN pip2 install --upgrade --no-deps git+git://github.com/Theano/Theano.git
RUN pip3 install --upgrade --no-deps git+git://github.com/Theano/Theano.git
RUN echo "[global]\ndevice=gpu\nfloatX=float32\noptimizer_including=cudnn\n[nvcc]\nfastmath=True" > /root/.theanorc

RUN pip2 install https://ci.tensorflow.org/view/Nightly/job/nightly-matrix-linux-gpu/TF_BUILD_IS_OPT=OPT,TF_BUILD_IS_PIP=PIP,TF_BUILD_PYTHON_VERSION=PYTHON2,label=gpu-linux/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow_gpu-1.1.0-cp27-none-linux_x86_64.whl
RUN pip3 --no-cache-dir install https://ci.tensorflow.org/view/Nightly/job/nightly-matrix-linux-gpu/TF_BUILD_IS_OPT=OPT,TF_BUILD_IS_PIP=PIP,TF_BUILD_PYTHON_VERSION=PYTHON3.5,label=gpu-linux/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow_gpu-1.1.0-cp35-cp35m-linux_x86_64.whl
RUN pip2 install pyzmq --install-option="--zmq=bundled"
RUN pip3 install pyzmq --install-option="--zmq=bundled"
RUN pip2 install msgpack-python seaborn tqdm wget sh colorama
RUN pip3 install msgpack-python seaborn tqdm wget sh colorama
RUN pip2 install chainer==1.23.0
RUN pip3 install chainer==1.23.0
RUN pip2 install keras==2.0.4
RUN pip3 install keras==2.0.4
