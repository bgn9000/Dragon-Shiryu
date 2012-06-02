#!/sbin/busybox sh
# All-in-one script for NEAK Options
# Only compatible with NEAK app/cwm
# by Simone201

/sbin/busybox mount -o remount,rw /data

# Check if our folder is there...again
if [ ! -d /data/neak ]; then
	/sbin/busybox echo "creating /data/neak folder"
	/sbin/busybox mkdir /data/neak
else
	/sbin/busybox echo "neak data folder already exists...again"
fi;

# Conservative Module
if [ -e /data/neak/conservative ]; then
	/sbin/busybox echo "conservative module enabled"
	#/sbin/busybox insmod /lib/modules/cpufreq_conservative.ko
fi;

# Lionheart Tweaks
if [ -e /data/neak/lionheart ]; then
	/sbin/busybox echo "lionheart tweaks enabled"
	./sbin/near/lionheart.sh
fi;

# Lazy Governor
if [ -e /data/neak/lazy ]; then
	/sbin/busybox echo "lazy module enabled"
	#/sbin/busybox insmod /lib/modules/cpufreq_lazy.ko
fi;

# SCHED_MC Feature
if [ -e /data/neak/schedmc ]; then
	/sbin/busybox echo "schedmc enabled"
	/sbin/busybox echo "1" > /sys/devices/system/cpu/sched_mc_power_savings
else
	/sbin/busybox echo "schedmc disabled"
	/sbin/busybox echo "0" > /sys/devices/system/cpu/sched_mc_power_savings
fi;

# AFTR Idle Mode
if [ -e /data/neak/aftridle ]; then
	/sbin/busybox echo "aftr idle mode enabled"
	/sbin/busybox echo "3" > /sys/module/cpuidle_exynos4/parameters/enable_mask
fi;

# EXT4 Speed Tweaks
if [ -e /data/neak/ext4boost ]; then
	/sbin/busybox echo "ext4 boost tweaks enabled"
	/sbin/busybox mount -o noatime,remount,rw,discard,barrier=0,commit=60,noauto_da_alloc,delalloc /cache /cache;
	/sbin/busybox mount -o noatime,remount,rw,discard,barrier=0,commit=60,noauto_da_alloc,delalloc /data /data;
fi;
