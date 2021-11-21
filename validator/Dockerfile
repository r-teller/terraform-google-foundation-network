FROM ubuntu:20.04

RUN apt-get update && apt-get install -y locales curl vim jq git

RUN apt-get install python3-pip -y
RUN pip3 install json-schema-for-humans

RUN curl -sL https://deb.nodesource.com/setup_14.x -o setup_14.sh
RUN sh ./setup_14.sh
RUN apt-get install -y nodejs \
    && npm install -g ajv-cli

RUN rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8


# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

CMD ["bash"]