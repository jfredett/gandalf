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

# Switch to that user
USER gandalf
ENV USER gandalf
WORKDIR /home/gandalf

# Run the installer
RUN .gandalf/install.sh
