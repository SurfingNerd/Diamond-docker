#!/bin/sh

git pull && ./build-from-source.sh && ./diamond-node -c=rpcnode.toml