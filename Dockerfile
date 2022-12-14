FROM ubuntu:latest

ENV PYTHON_VERSION 3.7.1
ENV HOME /root
ENV PYTHON_ROOT $HOME/local/python-$PYTHON_VERSION
ENV PATH $PYTHON_ROOT/bin:$PATH
ENV PYENV_ROOT $HOME/.pyenv

# タイムゾーン
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt update
RUN apt install -y libopencv-dev
RUN apt install -y python3 python3-pip
RUN pip install --upgrade pip

WORKDIR /usr/src/app
COPY ./ /usr/src/app

RUN pip install opencv-python click 


COPY ./imageproc /imageproc
WORKDIR /imageproc
CMD python3 main.py
