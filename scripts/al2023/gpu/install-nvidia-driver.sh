#!/usr/bin/env bash
set -ex

# Only proceed for AL2023 GPU AMIs
if [[ $AMI_TYPE != "al2023"*"gpu" ]]; then
    exit 0
fi

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
# Set executable permissions and move kmod utils to /usr/bin
# kmod utilities are copied to /tmp by Packer
sudo chmod +x "/tmp/kmod-util"
sudo mv "/tmp/kmod-util" /usr/bin/
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)

# Configure DKMS for parallel compilation to reduce NVIDIA driver build time
# This optimization enables multi-threaded compilation using all available CPU cores,
sudo mkdir -p /etc/dkms
echo "MAKE[0]=\"'make' -j$(nproc --all) modules\"" | sudo tee /etc/dkms/nvidia.conf

### Base System Preparation ###
# Install kernel development packages for current running kernel
RUNNING_KERNEL=$(uname -r)
sudo dnf install -y \
  "dnf-command(versionlock)" \
  "kernel-devel-${RUNNING_KERNEL}" \
  "kernel-headers-${RUNNING_KERNEL}" \
  "kernel-modules-extra-${RUNNING_KERNEL}" \
  "kernel-modules-extra-common-${RUNNING_KERNEL}" \
  dkms

# Lock kernel version to prevent automatic updates that could break DKMS modules
sudo dnf versionlock 'kernel*'
=======
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
### Install GPU Drivers and Required Packages ###
# NVIDIA installation doc: https://docs.nvidia.com/datacenter/tesla/driver-installation-guide/index.html#amazon-installation
# Amazon Linux 2023 repost: https://repost.aws/articles/ARwfQMxiC-QMOgWykD9mco1w/install-nvidia-gpu-driver-cuda-toolkit-nvidia-container-toolkit-on-amazon-ec2-instances-running-amazon-linux-2023-al2023

# Install base requirements
sudo dnf install -y dkms kernel-modules-extra-$(uname -r) kernel-devel-$(uname -r)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======

=======

>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======

>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
# Configure DKMS for parallel compilation to reduce NVIDIA driver build time
# This optimization enables multi-threaded compilation using all available CPU cores,
sudo mkdir -p /etc/dkms
echo "MAKE[0]=\"'make' -j$(nproc --all) modules\"" | sudo tee /etc/dkms/nvidia.conf

### Base System Preparation ###
# Install kernel development packages for current running kernel
RUNNING_KERNEL=$(uname -r)
sudo dnf install -y \
  "dnf-command(versionlock)" \
  "kernel-devel-${RUNNING_KERNEL}" \
  "kernel-headers-${RUNNING_KERNEL}" \
  "kernel-modules-extra-${RUNNING_KERNEL}" \
  "kernel-modules-extra-common-${RUNNING_KERNEL}" \
  dkms

# Lock kernel version to prevent automatic updates that could break DKMS modules
sudo dnf versionlock 'kernel*'
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 2d4bc5e (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
>>>>>>> 2d4bc5e (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 71921fa (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======

=======

>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
# Configure DKMS for parallel compilation to reduce NVIDIA driver build time
# This optimization enables multi-threaded compilation using all available CPU cores,
sudo mkdir -p /etc/dkms
echo "MAKE[0]=\"'make' -j$(nproc --all) modules\"" | sudo tee /etc/dkms/nvidia.conf

### Base System Preparation ###
# Install kernel development packages for current running kernel
RUNNING_KERNEL=$(uname -r)
sudo dnf install -y \
  "dnf-command(versionlock)" \
  "kernel-devel-${RUNNING_KERNEL}" \
  "kernel-headers-${RUNNING_KERNEL}" \
  "kernel-modules-extra-${RUNNING_KERNEL}" \
  "kernel-modules-extra-common-${RUNNING_KERNEL}" \
  dkms

# Lock kernel version to prevent automatic updates that could break DKMS modules
sudo dnf versionlock 'kernel*'
<<<<<<< HEAD
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 9953864 (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
=======
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> 71921fa (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 30f6783 (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)

# Enable DKMS service
sudo systemctl enable --now dkms

# nvidia-release creates an nvidia repo file at /etc/yum.repos.d/amazonlinux-nvidia.repo
sudo dnf install -y nvidia-release

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
# Temporary fix: ISO regions cannot use dualstack URLs, remove them from the repo file
if [ -n "$AIR_GAPPED" ]; then
    echo "ISO regions cannot use dualstack URLs, removing from nvidia repo"
    sudo sed -i 's/\$dualstack//g' /etc/yum.repos.d/amazonlinux-nvidia.repo
fi

<<<<<<< HEAD
>>>>>>> d4b4655 (fix(gpu): Remove dualstack URLs from nvidia repo for ISO regions)
=======
### Determine NVIDIA driver version ###
# This script builds and archives three NVIDIA kernel module variants (proprietary,
# open, and GRID) in /var/lib/dkms-archive. All three must be on the same driver
# version to ensure proper functionality. The GRID kmod comes from the EC2 GRID
# .run file in S3, while proprietary and open come from the AL2023 nvidia repo.
# If the repo and S3 versions differ, we use the lower of the two to ensure both
# sources can provide it.
EC2_GRID_DRIVER_S3_BUCKET="ec2-linux-nvidia-drivers"

LATEST_GRID_DRIVER_VERSION=$(aws s3 ls --recursive s3://${EC2_GRID_DRIVER_S3_BUCKET}/ --no-sign-request \
  | grep -Eo "(NVIDIA-Linux-x86_64-)[0-9]+\.[0-9]+\.[0-9]+(-grid-aws\.run)" \
  | cut -d'-' -f4 \
  | sort -V \
  | tail -1)

if [[ -z "$LATEST_GRID_DRIVER_VERSION" ]]; then
  echo "ERROR: Could not determine NVIDIA GRID driver version from S3"
  exit 1
fi
echo "Latest GRID .run version in S3: ${LATEST_GRID_DRIVER_VERSION}"

LATEST_OPEN_MODULE_VERSION=$(dnf repoquery --latest=1 --arch=noarch --queryformat "%{version}" "kmod-nvidia-open-dkms" 2>/dev/null | sort -V | tail -1)

if [[ -z "$LATEST_OPEN_MODULE_VERSION" ]]; then
  echo "ERROR: Could not determine NVIDIA open module version from repo"
  exit 1
fi
echo "Latest open kmod version in repo: ${LATEST_OPEN_MODULE_VERSION}"

# Use the lower version to ensure both sources can provide it
NVIDIA_DRIVER_FULL_VERSION=$(printf '%s\n%s\n' "$LATEST_GRID_DRIVER_VERSION" "$LATEST_OPEN_MODULE_VERSION" | sort -V | head -1)

echo "Selected NVIDIA driver version: ${NVIDIA_DRIVER_FULL_VERSION}"

>>>>>>> 927c5e8 (bugfix: install GRID driver from .run file to include nvidia-gridd for g6f vGPU licensing)
### Kernel Module Archive Functions ###
# These functions pre-compile and archive different NVIDIA driver variants
# This allows runtime switching between proprietary, open-source, and GRID drivers
# without rebuilding modules each time

# Build and archive proprietary NVIDIA driver
function archive-proprietary-kmod() {
  sudo dnf -y install "kmod-nvidia-latest-dkms-${NVIDIA_DRIVER_FULL_VERSION}"

  NVIDIA_PROPRIETARY_VERSION=$(kmod-util module-version nvidia)
  sudo dkms remove "nvidia/$NVIDIA_PROPRIETARY_VERSION" --all

  # Rename to avoid conflicts with other driver variants
  sudo sed -i 's/PACKAGE_NAME="nvidia"/PACKAGE_NAME="nvidia-proprietary"/' /usr/src/nvidia-$NVIDIA_PROPRIETARY_VERSION/dkms.conf
  sudo mv /usr/src/nvidia-$NVIDIA_PROPRIETARY_VERSION /usr/src/nvidia-proprietary-$NVIDIA_PROPRIETARY_VERSION

  # Build and install the renamed module
  sudo dkms add -m nvidia-proprietary -v $NVIDIA_PROPRIETARY_VERSION
  sudo dkms build -m nvidia-proprietary -v $NVIDIA_PROPRIETARY_VERSION
  sudo dkms install -m nvidia-proprietary -v $NVIDIA_PROPRIETARY_VERSION

  # Archive for later use and clean up
  sudo kmod-util archive nvidia-proprietary
  sudo kmod-util remove nvidia-proprietary
  sudo rm -rf /usr/src/nvidia-proprietary*
  sudo dnf -y remove --all "kmod-nvidia-latest-dkms*"
}

# Build and archive open-source NVIDIA driver
function archive-open-kmod() {
  sudo dnf -y install "kmod-nvidia-open-dkms-${NVIDIA_DRIVER_FULL_VERSION}"

  NVIDIA_OPEN_VERSION=$(kmod-util module-version nvidia)
  sudo kmod-util archive nvidia
  sudo kmod-util remove nvidia
  sudo rm -rf /usr/src/nvidia*
}

# Build and archive GRID driver from EC2 .run file
function archive-grid-kmod() {
  local GRID_INSTALLATION_TEMP_DIR
  local EXTRACT_DIR
  local NVIDIA_GRID_RUNFILE_KEY
  local GRID_RUNFILE_NAME

  GRID_INSTALLATION_TEMP_DIR=$(mktemp -d)
  EXTRACT_DIR="${GRID_INSTALLATION_TEMP_DIR}/NVIDIA-GRID-extract"

  echo "Archiving NVIDIA GRID kernel modules (version ${NVIDIA_DRIVER_FULL_VERSION})"

  NVIDIA_GRID_RUNFILE_KEY=$(aws s3 ls --recursive s3://${EC2_GRID_DRIVER_S3_BUCKET}/ --no-sign-request \
    | grep "NVIDIA-Linux-x86_64-${NVIDIA_DRIVER_FULL_VERSION}" \
    | sort -k1,2 \
    | tail -1 \
    | awk '{print $4}')

  if [[ -z "$NVIDIA_GRID_RUNFILE_KEY" ]]; then
    echo "ERROR: No GRID driver found for version ${NVIDIA_DRIVER_FULL_VERSION} in S3"
    exit 1
  fi

  echo "Found GRID runfile: ${NVIDIA_GRID_RUNFILE_KEY}"
  GRID_RUNFILE_NAME=$(basename "${NVIDIA_GRID_RUNFILE_KEY}")

  echo "Downloading GRID driver runfile..."
  aws s3 cp "s3://${EC2_GRID_DRIVER_S3_BUCKET}/${NVIDIA_GRID_RUNFILE_KEY}" "${GRID_INSTALLATION_TEMP_DIR}/${GRID_RUNFILE_NAME}" --no-sign-request
  chmod +x "${GRID_INSTALLATION_TEMP_DIR}/${GRID_RUNFILE_NAME}"

  echo "Extracting NVIDIA GRID driver runfile..."
  sudo "${GRID_INSTALLATION_TEMP_DIR}/${GRID_RUNFILE_NAME}" --extract-only --target "${EXTRACT_DIR}"

  pushd "${EXTRACT_DIR}"

  # Install GRID kernel modules via nvidia-installer
  echo "Installing NVIDIA GRID kernel modules..."
  sudo ./nvidia-installer \
    --dkms \
    --kernel-module-type open \
    --silent

  # Rename DKMS package to nvidia-grid to avoid conflicts with other variants
  sudo dkms remove "nvidia/$NVIDIA_DRIVER_FULL_VERSION" --all
  sudo sed -i 's/PACKAGE_NAME="nvidia"/PACKAGE_NAME="nvidia-grid"/' /usr/src/nvidia-$NVIDIA_DRIVER_FULL_VERSION/dkms.conf
  sudo mv /usr/src/nvidia-$NVIDIA_DRIVER_FULL_VERSION /usr/src/nvidia-grid-$NVIDIA_DRIVER_FULL_VERSION
  sudo dkms add -m nvidia-grid -v $NVIDIA_DRIVER_FULL_VERSION
  sudo dkms build -m nvidia-grid -v $NVIDIA_DRIVER_FULL_VERSION
  sudo dkms install -m nvidia-grid -v $NVIDIA_DRIVER_FULL_VERSION

  sudo kmod-util archive nvidia-grid
  sudo kmod-util remove nvidia-grid
  sudo rm -rf /usr/src/nvidia-grid*

  popd
  sudo rm -rf "${GRID_INSTALLATION_TEMP_DIR}"
}

### Build All Driver Variants ###
archive-grid-kmod
archive-proprietary-kmod
archive-open-kmod

### Install GPU Drivers and Required Packages ###
# NVIDIA installation doc: https://docs.nvidia.com/datacenter/tesla/driver-installation-guide/amazon-linux.html
# Amazon Linux 2023 repost: https://repost.aws/articles/ARwfQMxiC-QMOgWykD9mco1w/install-nvidia-gpu-driver-cuda-toolkit-nvidia-container-toolkit-on-amazon-ec2-instances-running-amazon-linux-2023-al2023
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# Install NVIDIA drivers and tools
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
# Install NVIDIA drivers and tools
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
# Install NVIDIA drivers and tools
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
# Install NVIDIA drivers and tools
<<<<<<< HEAD
>>>>>>> 2d4bc5e (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 9953864 (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
=======
=======
# Install NVIDIA drivers and tools
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> 71921fa (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 30f6783 (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
# Install NVIDIA drivers and tools
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
sudo dnf install -y nvidia-open \
    nvidia-fabric-manager \
    pciutils \
    xorg-x11-server-Xorg \
    nvidia-container-toolkit \
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 95bd20b (Switch AL2023 GPU AMI from legacy OCI hooks to CDI (#541))
    nvidia-persistenced
=======
sudo dnf install -y \
    "nvidia-driver-${NVIDIA_DRIVER_FULL_VERSION}" \
    "nvidia-driver-cuda-${NVIDIA_DRIVER_FULL_VERSION}" \
    "libnvidia-fbc-${NVIDIA_DRIVER_FULL_VERSION}" \
    "nvidia-libXNVCtrl-${NVIDIA_DRIVER_FULL_VERSION}" \
    "nvidia-settings-${NVIDIA_DRIVER_FULL_VERSION}" \
    "nvidia-fabricmanager-${NVIDIA_DRIVER_FULL_VERSION}" \
    "nvidia-persistenced-${NVIDIA_DRIVER_FULL_VERSION}" \
    pciutils \
    xorg-x11-server-Xorg \
    nvidia-container-toolkit
>>>>>>> 927c5e8 (bugfix: install GRID driver from .run file to include nvidia-gridd for g6f vGPU licensing)

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 36fecac (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
# Lock NVIDIA packages to prevent automatic updates
# Updates can break compatibility between driver and kernel modules
sudo dnf versionlock 'nvidia*' 'kmod*' 'libnvidia*'

# Ensure gridd.conf exists for the nvidia-gridd service when it starts up
sudo mkdir -p /etc/nvidia
echo "EnableUI=FALSE" | sudo tee /etc/nvidia/gridd.conf

### P6 Instance Support ###
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
### Package installation and setup to support P6 instances
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
### Package installation and setup to support P6 instances
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
### Package installation and setup to support P6 instances
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
    oci-add-hooks \
    nvidia-persistenced

<<<<<<< HEAD
### Package installation and setup to support P6 instances
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 2d4bc5e (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 9953864 (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
=======
=======
### Package installation and setup to support P6 instances
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> 71921fa (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 30f6783 (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
# Lock NVIDIA packages to prevent automatic updates
# Updates can break compatibility between driver and kernel modules
sudo dnf versionlock 'nvidia*' 'kmod*' 'libnvidia*'

### P6 Instance Support ###
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
# Install base requirements
sudo dnf install -y libibumad infiniband-diags nvlsm

# Load the User Mode API driver for InfiniBand
sudo modprobe ib_umad

# Ensure the ib_umad module is loaded at boot
echo ib_umad | sudo tee /etc/modules-load.d/ib_umad.conf

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)

### Dynamic Driver Loading Setup ###
# Install boot-time service that detects GPU hardware and loads the right driver
# This service runs early in boot to ensure the correct driver is loaded before applications start
sudo mv /tmp/nvidia-kmod-load.sh /etc/ecs/
sudo mv /tmp/nvidia-kmod-load.service /etc/systemd/system/nvidia-kmod-load.service

### GPU Clock Pinning Setup ###
# Pin GPU memory and graphics clocks to max at boot for consistent, predictable performance.
# Disables dynamic GPU Boost to eliminate clock fluctuation and reduce tail latency jitter.
# see: https://developer.nvidia.com/blog/advanced-api-performance-setstablepowerstate/
sudo chmod +x /tmp/set-nvidia-clocks
sudo mv /tmp/set-nvidia-clocks /usr/bin/set-nvidia-clocks
sudo mv /tmp/set-nvidia-clocks.service /etc/systemd/system/set-nvidia-clocks.service

sudo systemctl daemon-reload
sudo systemctl enable nvidia-kmod-load.service
sudo systemctl enable set-nvidia-clocks.service

### NVIDIA Service Configuration ###
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
### Configure NVIDIA Services
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
### Configure NVIDIA Services
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
### Configure NVIDIA Services
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
### Configure NVIDIA Services
<<<<<<< HEAD
>>>>>>> 2d4bc5e (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 9953864 (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
=======
=======
### Configure NVIDIA Services
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> 71921fa (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 30f6783 (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
### Configure NVIDIA Services
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
# The Fabric Manager service needs to be started and enabled on EC2 P4d instances
# in order to configure NVLinks and NVSwitches
sudo systemctl enable nvidia-fabricmanager

# NVIDIA Persistence Daemon needs to be started and enabled on P5 instances
# to maintain persistent software state in the NVIDIA driver.
sudo systemctl enable nvidia-persistenced
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)

### Cleanup Build-Time Configuration ###
# Remove the hardcoded DKMS configuration to prevent it from being baked into the AMI
sudo rm -f /etc/dkms/nvidia.conf
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
<<<<<<< HEAD
>>>>>>> 2d4bc5e (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> bc3f6bb (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 9953864 (Enable dynamic NVIDIA driver selection)
<<<<<<< HEAD
>>>>>>> 96c0923 (Enable dynamic NVIDIA driver selection)
=======
=======
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> 71921fa (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
<<<<<<< HEAD
>>>>>>> ad8403a (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
=======
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
>>>>>>> 30f6783 (Enable dynamic NVIDIA driver selection)
>>>>>>> bb1886c (Enable dynamic NVIDIA driver selection)
=======
>>>>>>> 15f3eb5 (Refactor NVIDIA driver installation on AL2023 GPU AMIs)
=======
>>>>>>> 79c2f7f (Enable dynamic NVIDIA driver selection)
