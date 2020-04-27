# Using Packer to Automate AMI Creation in AWS

### Download Packer
[Packer Download - Windows-64](https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_windows_amd64.zip)
[Packer Download - Linux-64  ](https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip)
### Create build.json file and run the following command
[build.json]
```
  packer build build.json
```


[template.json]
# packer build -var-file=vars.json template.json
