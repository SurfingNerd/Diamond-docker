#!/bin/sh

cd Diamond

# this updates the config files, for example chainspec 
git pull

# this updates the diamond-node if a new version is available.
./build-from-source.sh 

# finally start the node with the rpc config
./diamond-node -c=rpcnode.toml