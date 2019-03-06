FROM ubuntu:18.04

LABEL maintainer="Greg Cullen <greg@joltedthoughts.com>"


#Anaconda Install
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

#Neural-MMO Install
ENV PROJECTHOME=$HOME/projekt
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y build-essential python3-dev python3-pip \
    && apt-get clean
RUN echo "alias alias python=python3" >> ~/.bash_profile
RUN echo "alias alias pip=pip3" >> ~/.bash_profile
RUN pip install --upgrade setuptools
RUN pip install numpy ray matplotlib scipy Pillow psutil opensimplex pygame autobahn
RUN mkdir $PROJECTHOME
WORKDIR $PROJECTHOME
RUN git clone https://github.com/jsuarez5341/neural-mmo-client
WORKDIR $PROJECTHOME/neural-mmo-client
RUN bash setup.sh
WORKDIR $PROJECTHOME
RUN git clone https://github.com/openai/neural-mmo
WORKDIR $PROJECTHOME/neural-mmo
RUN bash scripts/setup/setup.sh
RUN python setup.py

#Tensorflow
RUN pip install --user --upgrade tensorflow

EXPOSE 80
EXPOSE 8080

#CMD [ ]