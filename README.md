# debian-live-builder

debian-live-builder intends to create a live image for rescue, recovery, investigate, test and so on.
and to be built on a AWS ec2 instance.

If you'd like to build it on your own machine, you only need files under files directory.
Please edit Makefile and replace lines of apt repository to your nearest one.

Please see [Debian Live Manual](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html) for detail of Debian Live

## how to use

1. install ansible

	pip install ansible

2. clone this project

clone this project to any direcotory for example /tmp/debian-live-builder,

3. edit some files

rename extra_vars.json.template to extra_vars.json and edit it

	{
	  "ImageId": "ami-025e5dec754f6ddbd", # AMI id of EC2 instance
	  "InstanceType": "t3.small",         # Instance type of EC2 instance 
	  "KeyName": "yourkeyname",           # Key name for EC2 instance. It needs to be created before.
	  "OperationServer": "your.global.ip.address/32", # Your global IP address which will be allowed by Security Group
	  "DownloadDirectory":"/path/to/directory/" # Directory where the live image will be downloaded
	}

edit debianlive.playbook and write path of your ssh private key as value of ansible_ssh_private_key_file
or copy ssh private key to /tmp/debian-live-builder/id_rsa

4. download  EC2 external inventory script

	cd /tmp/debian-live-builder
	wget https://raw.githubusercontent.com/ansible/ansible/stable-2.9/contrib/inventory/ec2.py
	wget https://raw.githubusercontent.com/ansible/ansible/stable-2.9/contrib/inventory/ec2.ini

5. build

	cd /tmp/debian-live-builder
	make stack-create
	make build-debianlive
	make stack-terminate

When it shows ssh key fingerprint, then please accept it.

6. write image to a usb stick

If the build finished successfully, there would be a image file live-image-amd64.hybrid.iso in "DownloadDirectory" you specified.
Write the image file to your USB stick by below command.
(*sdz is only a place holder. Please replace it to your correct value*, otherwise your hdd would be overwritten at worst)

	sudo dd if=live-image-amd64.hybrid.iso of=/dev/sdz bs=1M

