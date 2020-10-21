> power management:
> https://wiki.ubuntu.com/Kernel/PowerManagement/PowerSavingTweaks
> https://www.pcsuggest.com/disable-nmi-watchdog-linux/ 


# Kernel Parameters

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" 
```
to 
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i915.i915_enable_fbc=1 i915.lvds_downclock=1 drm.vblankoffdelay=1 i915.disable_power_well=1 i915.enable_cmd_parser=1 i915.enable_ppgtt=1 i915.fastboot=1 i915.i915_enable_rc6=1 i915.lvds_use_ssc=0 i915.modeset=1 i915.powersave=1 i915.reset=0 i915.semaphores=1 i915.use_mmio_flip=1 vblank_mode=0  nmi_watchdog=0"

sudo update-grub
```

