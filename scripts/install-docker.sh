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
mkdir -p /usr/local/lib/docker/cli-plugins
curl -SL "https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64" \
 -o "/usr/local/lib/docker/cli-plugins/docker-compose"
sudo chmod +x "/usr/local/lib/docker/cli-plugins/docker-compose"