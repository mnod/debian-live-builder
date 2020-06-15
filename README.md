# debian-live-builder

debian-live-builder intends to create a live image for recovery, investigate, test and so on.
and to be built on a AWS ec2 instance.

If you'd like to build it on your own machine, then please edit Makefile and replace lines of apt repository.

Please see [Debian Live Manual](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html) for detail of Debian Live

## how to use

git clone this project to any direcotory like /tmp/debianlive,
then execute below:

	cd /tmp/debianlive/files
	make init
	sudo make config
	sudo make build

If the build finished successfully, there would be a image file live-image-amd64.hybrid.iso.
Write the image file to your USB stick by below command.
(*sdz is only a place holder. please replace it to your correct value*)

	sudo dd if=live-image-amd64.hybrid.iso of=/dev/sdz bs=1M

