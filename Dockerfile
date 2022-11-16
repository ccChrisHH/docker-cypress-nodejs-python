FROM cypress/browsers:node18.6.0-chrome105-ff104

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

RUN wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz && \
    tar -xf Python-3.10.*.tgz && \
    cd Python-3.10.*/ && \
    ./configure --enable-optimizations && \
    make -j 4 && \
    make altinstall

RUN apt-get install -y python3-pip
