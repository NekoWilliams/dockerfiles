FROM ubuntu:22.04

COPY src/ /src
RUN chmod +x /start.sh

RUN apt-get update
RUN apt-get install -y iproute2 wget make git iputils-ping inetutils-traceroute bc

# Install Go
RUN wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
RUN rm go1.22.2.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# Validate Go installation
RUN go version

# Install Kubo (formerly IPFS)
RUN wget https://dist.ipfs.tech/kubo/v0.28.0/kubo_v0.28.0_linux-amd64.tar.gz
RUN tar -xvzf kubo_v0.28.0_linux-amd64.tar.gz
RUN cd kubo && bash install.sh
RUN rm -rf kubo kubo_v0.28.0_linux-amd64.tar.gz

# Validate Kubo (IPFS) installation
RUN ipfs --version

# Set the entry point
ENTRYPOINT ["/bin/sh", "/src/start.sh"]
