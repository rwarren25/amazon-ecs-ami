locals {
  ami_name_al2 = "hardened-ecs-container-instance-unverified-al2-image-${formatdate("YYYY-MM-DD", timestamp())}"
  motd_files = [
    "29-ecs-banner-begin",
    "31-ecs-banner-finish",
    "69-available-updates-begin",
    "71-available-updates-finish"
  ]
  default_tags = {
    os_version          = "Amazon Linux 2"
    source_image_name   = "{{ .SourceAMIName }}"
    ecs_runtime_version = "Docker version ${var.docker_version}"
    ecs_agent_version   = "${var.ecs_agent_version}"
    ami_type            = "al2"
    ami_version         = "2.0.${var.ami_version_al2}"
  }
  merged_tags = merge("${local.default_tags}", "${var.tags}")
}

source "amazon-ebs" "al2" {
  ami_name        = "${local.ami_name_al2}"
  ami_description = "Latest CIS Hardened Amazon Linux 2 Benchmark - Level 1"
  instance_type   = var.general_purpose_instance_types[0]
  launch_block_device_mappings {
    volume_size           = var.block_device_size_gb
    delete_on_termination = true
    volume_type           = "gp3"
    device_name           = "/dev/xvda"
    encrypted             = true
  }
  region = var.region
  source_ami_filter {
    filters = {
      name = "${var.source_ami_al2}"
      architecture = "x86_64"
    }
    owners = ["679593333241"]
    most_recent = true
  }
  ami_ou_arns   = "${var.ami_ou_arns}"
  ami_org_arns  = "${var.ami_org_arns}"
  ami_users     = "${var.ami_users}"
  ssh_interface = "public_dns"
  ssh_username  = "ec2-user"
  tags = {
    os_version              = "Amazon Linux 2"
    source_image_name       = "{{ .SourceAMIName }}"
    source_image_createdate = "{{ .SourceAMICreationDate }}"
    ecs_runtime_version     = "Docker version ${var.docker_version}"
    ecs_agent_version       = "${var.ecs_agent_version}"
    ami_type                = "al2"
    ami_version             = "2.0.${var.ami_version_al2}"
  }
  profile         = var.profile
  vpc_id          = var.vpc_id
  subnet_id       = var.subnet_id
}

build {
  sources = [
    "source.amazon-ebs.al2",
    "source.amazon-ebs.al2arm",
    "source.amazon-ebs.al2gpu",
    "source.amazon-ebs.al2keplergpu",
    "source.amazon-ebs.al2inf",
    "source.amazon-ebs.al2kernel5dot10",
    "source.amazon-ebs.al2kernel5dot10arm",
    "source.amazon-ebs.al2kernel5dot10gpu",
    "source.amazon-ebs.al2kernel5dot10inf"
  ]

  provisioner "file" {
    source      = "files/90_ecs.cfg.amzn2"
    destination = "/tmp/90_ecs.cfg"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    inline_shebang = "/bin/sh -ex"
    inline = [
      "sudo mv /tmp/90_ecs.cfg /etc/cloud/cloud.cfg.d/90_ecs.cfg",
      "sudo chown root:root /etc/cloud/cloud.cfg.d/90_ecs.cfg"
    ]
  }

  dynamic "provisioner" {
    for_each = local.motd_files
    labels   = ["file"]
    content {
      source      = "files/${provisioner.value}.sh.amzn2"
      destination = "/tmp/${provisioner.value}"
    }
  }

  dynamic "provisioner" {
    for_each = local.motd_files
    labels   = ["shell"]
    content {
      execute_command = "{{.Vars}} bash '{{.Path}}'"
      inline_shebang = "/bin/sh -ex"
      inline = [
        "sudo mv /tmp/${provisioner.value} /etc/update-motd.d/${provisioner.value}",
        "sudo chmod 755 /etc/update-motd.d/${provisioner.value}"
      ]
    }
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    inline_shebang = "/bin/sh -ex"
    inline = [
      "mkdir /tmp/additional-packages"
    ]
  }

  provisioner "file" {
    source      = "additional-packages/"
    destination = "/tmp/additional-packages"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/falcon-al2-download.sh"
    environment_vars = [
      "CLIENT_ID=${var.cs_falcon_client_id}",
      "CLIENT_SECRET=${var.cs_falcon_client_secret}",
      "FILENAME=${var.cs_falcon_filename}",
      "CID=${var.cs_falcon_cid}",
      "EXE=${var.cs_falcon_exe}",
      "BASEURL=${var.cs_falcon_baseurl}"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    inline_shebang = "/bin/sh -ex"
    inline = [
      "sudo yum install -y ${local.packages_al2}"
    ]
  }

  provisioner "shell" {
    script = "scripts/setup-ecs-config-dir.sh"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/setup-ecs-config-dir.sh"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    inline_shebang = "/bin/sh -ex"
    inline = [
      "sudo nft flush ruleset",
      "sudo systemctl disable nftables",
      "sudo yum install iptables-services -y"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/install-docker.sh"
    environment_vars = [
      "DOCKER_VERSION=${var.docker_version}",
      "CONTAINERD_VERSION=${var.containerd_version}",
      "RUNC_VERSION=${var.runc_version}",
      "AIR_GAPPED=${var.air_gapped}"
    ]
  }

  # the ordering matters here, this repo is installed after docker is installed
  # so that the docker extras repo is overwritten in the final AMI.
  provisioner "file" {
    source      = "files/repos/amzn2-extras.repo"
    destination = "/tmp/amzn2-extras.repo"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    inline_shebang = "/bin/sh -ex"
    inline = [
      "sudo mv /tmp/amzn2-extras.repo /etc/yum.repos.d/amzn2-extras.repo",
      "sudo chown root:root /etc/yum.repos.d/amzn2-extras.repo"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/install-ecs-init.sh"
    environment_vars = [
      "REGION=${var.region}",
      "AGENT_VERSION=${var.ecs_agent_version}",
      "INIT_REV=${var.ecs_init_rev}",
      "AL_NAME=amzn2",
      "AIR_GAPPED=${var.air_gapped}",
      "ECS_INIT_URL=${var.ecs_init_url_al2}",
      "ECS_INIT_LOCAL_OVERRIDE=${var.ecs_init_local_override}"
    ]
  }

  provisioner "shell" {
    script = "scripts/install-managed-daemons.sh"
    environment_vars = [
      "REGION=${var.region}",
      "AGENT_VERSION=${var.ecs_agent_version}",
      "EBS_CSI_DRIVER_VERSION=${var.ebs_csi_driver_version}",
      "AIR_GAPPED=${var.air_gapped}",
      "MANAGED_DAEMON_BASE_URL=${var.managed_daemon_base_url}"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/install-managed-daemons.sh"
    environment_vars = [
      "REGION=${var.region}",
      "AGENT_VERSION=${var.ecs_agent_version}",
      "EBS_CSI_DRIVER_VERSION=${var.ebs_csi_driver_version}",
      "AIR_GAPPED=${var.air_gapped}",
      "MANAGED_DAEMON_BASE_URL=${var.managed_daemon_base_url}"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/install-additional-packages.sh"
  }

  provisioner "file" {
    source      = "files/amazon-ssm-agent.gpg"
    destination = "/tmp/amazon-ssm-agent.gpg"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    environment_vars = [
      "CID=${var.cs_falcon_cid}",
      "EXE=${var.cs_falcon_exe}"
    ]
    inline_shebang = "/bin/sh -ex"
    inline = [
      "echo \"Setting Falcon sensor settings\"",
      "sudo $EXE -s -f --cid=$CID",
      "sudo $EXE -d -f --aid",
      "sudo $EXE -s --billing=metered",
      "sudo systemctl disable --now falcon-sensor",
      "echo \"Falcon sensor settings complete\""
    ]
  }

  provisioner "file" {
    source      = "files/amazon-ssm-agent.gpg"
    destination = "/tmp/amazon-ssm-agent.gpg"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/install-exec-dependencies.sh"
    environment_vars = [
      "REGION=${var.region}",
      "EXEC_SSM_VERSION=${var.exec_ssm_version}",
      "AIR_GAPPED=${var.air_gapped}"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/append-efs-client-info.sh"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    environment_vars = ["AMI_TYPE=${source.name}"]
    script           = "scripts/al2/install-kernel5dot10.sh"
  }

  ### If necessary, reboot worker instance to install kernel update for enable-ecs-agent-inferentia-support or
  ### enable-ecs-agent-gpu-support scripts that factor in kernel version.
  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    environment_vars  = ["AMI_TYPE=${source.name}"]
    expect_disconnect = "true"
    script            = "scripts/al2/reboot-for-kernel-upgrade.sh"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    environment_vars = ["AMI_TYPE=${source.name}"]
    pause_before     = "10s" # pause for starting the reboot
    script           = "scripts/enable-ecs-agent-inferentia-support.sh"
  }

  provisioner "shell" {
    environment_vars = ["AMI_TYPE=${source.name}"]
    pause_before     = "10s" # pause for starting the reboot
    script           = "scripts/enable-ecs-agent-inferentia-support.sh"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    environment_vars = [
      "AMI_TYPE=${source.name}",
      "AIR_GAPPED=${var.air_gapped}"
    ]
    script = "scripts/enable-ecs-agent-gpu-support.sh"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    inline_shebang = "/bin/sh -ex"
    inline = [
      "sudo usermod -a -G docker ec2-user"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/enable-services.sh"
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/install-service-connect-appnet.sh"
  }

  provisioner "shell" {
    inline_shebang = "/bin/sh -ex"
    inline = [
      "sudo yum update -y --security --sec-severity=critical --exclude=nvidia*,docker*,cuda*,containerd*,runc*"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    inline_shebang = "/bin/sh -ex"
    inline = [
      "sudo yum update -y --sec-severity=critical,important,medium --exclude=nvidia*,docker*,cuda*,containerd*,runc*"
    ]
  }

  provisioner "shell" {
    execute_command = "{{.Vars}} bash '{{.Path}}'"
    script = "scripts/cleanup.sh"
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }
}
