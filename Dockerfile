FROM nvidia/cuda:8.0-cudnn6-runtime

# config settings
RUN mkdir -p /config
ADD requirements.txt /config

### setup python2.7 & opencv
RUN set -x \
&& apt-get update \
&& apt-get install -y python-pip python-dev \
&& apt-get install -y libsm6 libxrender1 libfontconfig1 libxext6 libglib2.0-0\
&& apt-get install -y vim \
&& cd /usr/local/bin \
&& ln -s /usr/bin/python python \
&& pip install --upgrade pip

RUN set -x \
&& pip install -r /config/requirements.txt

### setup ubuntu-desktop
#RUN apt-get install ubuntu-desktop

### Add user
# RUN apt-get install -y passwd sudo \
# && useradd owner \
# && mkdir -p /home/owner \
# && chown owner:owner /home/owner \
# && echo "owner ALL=(ALL) ALL" >> /etc/sudoers.d/owner
# USER owner
# ENV HOME /home/owner

# homedir ( last )
RUN mkdir -p /workspace
ENV HOME /workspace
