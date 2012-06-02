#!/sbin/busybox sh
# Lionheart tweaks for conservative gov
# thx to GM & netarchy

/sbin/busybox echo "conservative" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
/sbin/busybox echo "60" > /sys/devices/system/cpu/cpufreq/conservative/up_threshold
/sbin/busybox echo "30" > /sys/devices/system/cpu/cpufreq/conservative/down_threshold
/sbin/busybox echo "5" > /sys/devices/system/cpu/cpufreq/conservative/freq_step
#just set it to the lowest possible
/sbin/busybox echo "100000" > /sys/devices/system/cpu/cpufreq/conservative/sampling_rate
/sbin/busybox echo "80000" > /sys/devices/system/cpu/cpufreq/conservative/sampling_rate
/sbin/busybox echo "60000" > /sys/devices/system/cpu/cpufreq/conservative/sampling_rate
/sbin/busybox echo "50000" > /sys/devices/system/cpu/cpufreq/conservative/sampling_rate
/sbin/busybox echo "20000" > /sys/devices/system/cpu/cpufreq/conservative/sampling_rate
/sbin/busybox echo "10000" > /sys/devices/system/cpu/cpufreq/conservative/sampling_rate
