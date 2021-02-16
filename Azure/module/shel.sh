#!/bin/bash

>/var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
echo "[webservers]" >> /var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
echo $(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /var/lib/jenkins/scripts/tfcvpc/azure/module/terraform.tfstate | grep -v 198* | uniq | head -1) >> /var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
echo "[appservers]" >> /var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
echo $(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /var/lib/jenkins/scripts/tfcvpc/azure/module/terraform.tfstate | grep -v 198* | uniq | tail -1) >> /var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
echo "[webservers:vars]" >> /var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
echo "ansible_user=azureuser" >> /var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
echo "[appservers:vars]" >> /var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
echo "ansible_user=azureuser" >> /var/lib/jenkins/scripts/tfcvpc/azure/module/hosts
