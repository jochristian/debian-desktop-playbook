#!/usr/bin/env bash

echo "[INFO] Installing Ansible"
su -c "apt install ansible sshpass -y"

echo "[INFO] Running Playbook"
export ANSIBLE_HOST_KEY_CHECKING=False
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
ansible-playbook main.yml
