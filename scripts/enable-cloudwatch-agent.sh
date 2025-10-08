#!/usr/bin/env bash
set -ex

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
    -a fetch-config \
    -m ec2 \
    -c ssm:AmazonCloudWatch-al2023 \
    -s
sudo systemctl enable amazon-cloudwatch-agent