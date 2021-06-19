{ pkgs, ... }:

{
  mobile.device.name = "general-mobile-gm8";
  mobile.device.identity = {
    name = "GM8";
    manufacturer = "General Mobile";
  };

  mobile.hardware = {
    soc = "qualcomm-msm8937";
    ram = 1024 * 3;
    screen = {
      width = 720; height = 1440;
    };
  };

  mobile.boot.stage-1 = {
    kernel.package = pkgs.callPackage ./kernel { };
  };

  mobile.system.android.device_name = "gm8_sprout";
  mobile.system.android = {
    ab_partitions = true;
    bootimg.flash = {
      offset_base = "0x80000000";
      offset_kernel = "0x00008000";
      offset_ramdisk = "0x01000000";
      offset_second = "0x00f00000";
      offset_tags = "0x00000100";
      pagesize = "2048";
    };
  };

  boot.kernelParams = [
    "console=ttyHSL0,115200,n8"
      "androidboot.console=ttyHSL0"
      "androidboot.hardware=qcom"
      "androidboot.fastboot=1"
      "msm_rtb.filter=0x237"
      "ehci-hcd.park=3"
      "lpm_levels.sleep_disabled=1"
      "androidboot.bootdevice=7824900.sdhci"
      "earlycon=msm_hsl_uart,0x78B0000"
      "firmware_class.path=/vendor/firmware_mnt/image"
      "loop.max_part=7"
      "buildvariant=eng"
      "veritykeyid=id::7e4333f9bba00adfe0ede979e28ed1920492b40f"
  ];

  mobile.system.type = "android";

  mobile.usb.mode = "android_usb";
  mobile.usb.idVendor = "04E8"; 
  mobile.usb.idProduct = "6860"; 
}