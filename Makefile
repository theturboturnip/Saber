all: ondemand
.PHONY: performance ondemand

ifneq ($(shell id -u),0)
performance:
	@echo "You must be root to perform this action."
ondemand:
	@echo "You must be root to perform this action."
else
performance:
	@echo "Setting to maximum performance"
	# Set to 1 = Prefer Maximum Performance
	nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1'
	# Set frequency governor to performance
	echo -n performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

ondemand:
	@echo "Setting to ondemand performance"
	# Set to 2 = Auto-select
	nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=2'
	# Set frequency governor to ondemand
	echo -n ondemand | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
endif
