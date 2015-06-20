FROM debian:jessie

# Dependencies
RUN apt-get update -y && \
    apt-get install -y git

# Create Gandalf user
RUN useradd                         \
      --create-home                 \
      --shell /bin/bash             \
      gandalf

# copy code
ADD . /home/gandalf/.gandalf
RUN chown -R gandalf /home/gandalf/.gandalf
RUN chgrp -R gandalf /home/gandalf/.gandalf

# install dependencies
RUN apt-get install -y wget build-essential
WORKDIR /tmp
RUN wget -O chruby-0.3.9.tar.gz                                           \
            https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz && \
    tar -xzvf chruby-0.3.9.tar.gz                                      && \
    cd chruby-0.3.9                                                    && \
    make install

# Switch to that user
USER gandalf
ENV USER gandalf
WORKDIR /home/gandalf

# Run the installer
RUN .gandalf/install.sh
