FROM cypress/browsers:node16.18.0-chrome107-ff106-edge

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y build-essential python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz && \
    tar -xf Python-3.10.*.tgz && \
    cd Python-3.10.*/ && \
    ./configure --enable-optimizations && \
    make -j 4 && \
    make altinstall && \
    cd / && \
    rm Python-3.10.*.tgz && rm -rf Python-3.10.0 && \
    apt-get purge -y build-essential && apt-get autoremove -y