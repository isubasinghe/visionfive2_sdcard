# VisionFive2 microSD card setup

This repository holds a very niche purpose. It contains a script (`build_image.sh`)
that attempts to build a flashable image for the VisionFive2 SBC. This image
contains U-Boot SPL, OpenSBI, and a full U-Boot. It *does not* contain Linux.

It does not contain Linux as the purpose is for those who are using TFTP to boot
or are trying to run something other than Linux! 

## Dependenices
Just use the provided nix flake. 
Run `nix develop`.

## Making the image

```sh
$ git clone --recursive https://github.com/isubasinghe/visionfive2_sdcard.git
$ cd 
$ ./build_image.sh
$ ls images
sdcard.img
```

You can then flash the image onto your microSD card using either
[balenaEtcher](https://www.balena.io/etcher) or the `dd` utility.

## Credit

Thanks to Fishwaldo for the port of [U-Boot to the Pine64](https://github.com/Fishwaldo/u-boot).
At the time of writing mainline U-Boot is yet to have support for the Pine64, which is why
Fishwaldo's fork of U-Boot is used.

Thanks for Ivan Velickovic for the inital repo for the [Star64](https://github.com/Ivan-Velickovic/star64_sdcard). 

