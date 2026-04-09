#!/usr/bin/env bash

set -e

case "$1" in
  vms)
    echo "Running Ansible for VMs..."
    ansible-playbook -i vm-inventory.ini vm-playbook.yml --ask-become-pass
    ;;

  docker)
    echo "Running Ansible for Docker containers..."
    ansible-playbook -i docker-inventory.ini docker-playbook.yml
    ;;

  *)
    echo "Usage: $0 {vms|docker}"
    exit 1
    ;;
esac
