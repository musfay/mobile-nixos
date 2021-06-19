{ mobile-nixos, fetchFromGitHub, ... }:

mobile-nixos.kernel-builder-gcc49 {
  version = "3.18.120";
  configfile = ./config.aarch64;

  src = fetchFromGitHub {
    owner = "brsgk";
    repo = "kernel_GM_GM8";
    rev = "32fd735c1285dd6198dcc15bc3dc8dd31238009f";
    sha256 = "05khzdyk5dlm5zjarjfc5lqzb480g62skp83cira81lgnyrav8cc";
  };

  patches = [
    ./0003-arch-arm64-Add-config-option-to-fix-bootloader-cmdli.patch
  ];

  isImageGzDtb = true;
  isModular = false;
}