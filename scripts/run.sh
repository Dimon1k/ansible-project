#!/usr/bin/env bash
set -e

case "$1" in
  docker)
    ansible-playbook -i inventories/docker/hosts.yml playbooks/site.yml
    ;;
  vm)
    ansible-playbook -i inventories/vm/hosts.yml playbooks/site.yml
    ;;
  *)
    echo "Usage: $0 {docker|vm}"
    exit 1
    ;;
esac
