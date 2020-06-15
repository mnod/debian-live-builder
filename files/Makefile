init:
	lb config
	rm -r config/package-lists/*chroot
	cp packages.list.chroot config/package-lists/
clean:
	lb clean
config:
	lb config \
	--parent-distribution buster \
	--distribution buster \
	--parent-archive-areas "main contrib non-free" \
	--archive-areas "main contrib non-free" \
	--parent-mirror-bootstrap "http://cdn-aws.deb.debian.org/debian/" \
	--parent-mirror-binary "http://cdn-aws.deb.debian.org/debian/" \
	--mirror-bootstrap "http://cdn-aws.deb.debian.org/debian/" \
	--mirror-binary "http://cdn-aws.deb.debian.org/debian/" \
	--mirror-chroot "http://cdn-aws.deb.debian.org/debian/" \
	--bootappend-live \
	"boot=live config persistence noeject live-config.utc=no \
	live-config.locales=ja_JP.UTF-8 \
	live-config.keyboard-model=jp106 \
	live-config.keyboard-layouts=jp"
build:
	lb build
