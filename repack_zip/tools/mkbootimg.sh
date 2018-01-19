#!/sbin/sh
#
# mkboot script helper
# Base of Anykernel by osm0sis (https://github.com/osm0sis).
# rainforce279 @ 17-12-2017

cmdline=`cat /tmp/boot.img-cmdline`;
board=`cat /tmp/boot.img-board`;
base=`cat /tmp/boot.img-base`;
pagesize=`cat /tmp/boot.img-pagesize`;
kerneloff=`cat /tmp/boot.img-kerneloff`;
ramdiskoff=`cat /tmp/boot.img-ramdiskoff`;
tagsoff=`cat /tmp/boot.img-tagsoff`;
secondoff=`cat /tmp/boot.img-secondoff`;

if [ -f /tmp/boot.img-hash ]; then
	hashfck=`cat /tmp/boot.img-hash`;
else
	hashfck=sha1;
fi;

/tmp/mkbootimg --kernel /tmp/zImage --ramdisk /tmp/boot.img-ramdisk.gz --cmdline "$cmdline" --board "$board" --base $base --pagesize $pagesize --kernel_offset $kerneloff --ramdisk_offset $ramdiskoff --second_offset $secondoff --tags_offset "$tagsoff" --hash "$hashfck" --output /tmp/newboot.img;

