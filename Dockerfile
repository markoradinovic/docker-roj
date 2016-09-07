FROM schmunk42/docker-toolbox:latest

# Install system packages
ENV TERM linux
RUN apt-get update && \
    apt-get install -y \
        git \
        expect && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install boilr
#RUN curl -sSL https://raw.githubusercontent.com/tmrts/boilr/master/install | bash
#ENV PATH /root/bin:${PATH}
#RUN boilr init

RUN mkdir /roj
WORKDIR /roj

ENV MACHINE_STORAGE_PATH /roj/config/machine
ENV DOCKER_CONFIG /roj/config

RUN rm /opt/local/bin/docker
RUN ln -s /opt/local/bin/docker-1.12.1-experimental /opt/local/bin/docker

COPY ./src /

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD bash