FROM ubuntu:latest

# config settings
RUN mkdir -p /config
ADD requirements.txt /config

### setup python3.6 & opencv
RUN set -x \
&& apt-get update \
&& apt-get install -y python3-pip python3-dev \
&& apt-get install -y libsm6 libxrender1 libfontconfig1 libxext6 \
&& cd /usr/local/bin \
&& ln -s /usr/bin/python3 python \
&& pip3 install --upgrade pip

RUN set -x \
&& pip3 install opencv-python \
&& pip3 install opencv-contrib-python \
&& pip3 install -r /config/requirements.txt

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
