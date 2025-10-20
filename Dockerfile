# Use Debian as base image
FROM debian:trixie-slim

# Set working directory
WORKDIR /app

# Install git and other dependencies
RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Clone the Diamond repository
RUN git clone https://github.com/DMDcoin/Diamond.git

# Set working directory to the cloned repository
WORKDIR /app/Diamond

RUN ./setup-build-from-source.sh 

COPY docker-content/docker-entrypoint.sh /app/docker-entrypoint.sh

RUN chmod +x /app/docker-entrypoint.sh

EXPOSE 54100

# Default command
# CMD ["/app/diamond-node -c=rpcnode.toml"]
ENTRYPOINT ["/app/docker-entrypoint.sh"]