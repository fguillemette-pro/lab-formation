#!/bin/bash
#
# Florent GUILLEMETTE
# florent.guillemette.pro@gmail.com
# v1.0.0
#
# HOW-TO : ./init_lab.sh <csv_file_user> <target>
#
echo "### Initialiation du lab pour Formation"
echo "### Test OS"
OS_DETECT=$(cat /etc/os-release | grep ID | cut -f 2 -d =)
if [[ $OS_DETECT =! "debian"]]
  then
    echo "Error: non-debian OS detected."
    exit 1
fi
if [[ $user =! "root" ]]
  then
    echo "Error: root require."
    exit 1
fi
echo "### Install ansible"
apt update -y
apt install ansible -y 
echo "### Ansible installed"
echo "### Check input"
if [[ ! -f $1 ]]
  then
    echo "Error: missing CSV file"
    exit 1
fi
if [[ -z ${$2+x} ]]
  then
    echo "Error: missing target"
    exit 1
fi
echo "### Ready to build your lab"
echo "### Login needed:"
read $login_ssh
echo "### Password needed:"
read -s password_ssh
anisble-playbook playbook.yml $2 -u $login_ssh -k $password_ssh