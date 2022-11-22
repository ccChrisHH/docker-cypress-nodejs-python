FROM cypress/browsers:node18.6.0-chrome105-ff104

RUN apt-get update && \
    apt-get install -y build-essential python3-pip gnupg dirmngr && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    node -p "process.arch === 'arm64' ? 'Not downloading Edge since we are on arm64: https://techcommunity.microsoft.com/t5/discussions/edge-for-linux-arm64/m-p/1532272' : process.exit(1)" || \
    (curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list' && \
    rm microsoft.gpg && \
    ## Install Edge
    apt-get update && \
    apt-get install -y microsoft-edge-dev && \
    ## Add a link to the browser that allows Cypress to find it
    ln -s /usr/bin/microsoft-edge /usr/bin/edge) && \
    wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz && \
    tar -xf Python-3.10.*.tgz && \
    cd Python-3.10.*/ && \
    ./configure --enable-optimizations && \
    make -j 4 && \
    make altinstall && \
    cd / && \
    rm Python-3.10.*.tgz && rm -rf Python-3.10.0 && \
    apt-get purge -y build-essential && apt-get autoremove -y

CMD ["sh", "-c", "tail -f /dev/null"]