#!/usr/bin/env bash
set -ex

if [ -n "$AIR_GAPPED" ]; then
    echo "Air-gapped region, assuming docker and dependencies will be in additional-packages/ directory"
    exit 0
fi

if command -v amazon-linux-extras; then
    # enable docker "extras" repo when available
    sudo amazon-linux-extras enable docker
fi

sudo yum install -y "docker-$DOCKER_VERSION" "containerd-$CONTAINERD_VERSION"
sudo mkdir -m 755 "/usr/local/lib/docker"
sudo mkdir -m 755 "/usr/local/lib/docker/cli-plugins"
sudo curl -SL "https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64" \
 -o "/usr/local/lib/docker/cli-plugins/docker-compose"
sudo chmod 755 "/usr/local/lib/docker/cli-plugins/docker-compose"