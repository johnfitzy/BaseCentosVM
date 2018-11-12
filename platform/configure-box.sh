#!/usr/bin/env bash
set -e

#only set proxy if at jq (delete file if not at jq)
#file=/vagrant/jq
#
#echo "Here -> ${jq}"
#
#if [ -f "$file" ];then
#echo "---------------------------------------"
#echo "    HERE    "
#if ! grep -q "proxy" /etc/yum.conf; then
#    echo proxy=http://jos-repo-server.datacom.co.nz:3128 >> /etc/yum.conf
#fi
#
#export http_proxy=http://jos-repo-server.datacom.co.nz:3128
#export https_proxy=http://jos-repo-server.datacom.co.nz:3128
#export no_proxy=localhost,127.0.0.1
#
#echo "---------------------------------------"
#fi

#echo "Enabling epel repo"
#yum --enablerepo=extras install -y epel-release
#
#echo "Installing ansible"
#yum install -y ansible

sudo sh -c  "echo export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64/jre >> /etc/environment"

echo "Configuring network"
sudo nmcli con del enp0s8 | true
sudo nmcli con add type ethernet ifname enp0s8 con-name enp0s8
sudo nmcli con mod enp0s8 ipv4.addresses '10.128.250.2,10.128.250.3,10.128.250.4,10.128.250.5,10.128.250.6' ipv4.method manual ipv4.routes 10.0.0.0/16
sudo systemctl restart network
