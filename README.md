# mojo-experiments

I have an FPGA development board. The development tool for the FPGA (Xilinx ISE) does not work on MacOS, so I spun up a Ubuntu guest. From the VirtualBox GUI, defined a USB device filter for the specific USB device. Fired up the VM, installed the development tools, and was able to program the device! I was impressed.

* Device:
  * Mojo V3 with a Xilinx Spartan 6 XC6SLX9 FPGA and ATmega32U4 microcontroller.
* Host:
  * MacOS (latest version)
* Guest:
  * Ubuntu (latest version)

Some time later, could not program the board. The USB device had disappeared from the guest.

Do a soft-reboot of the guest (reboot guest unknown to the host), and the device came back! For ... a while. Then went away. Reboot. Back. Then gone...

To a first approximation (as far as I can tell) the host status of the USB device has not changed. The device still exists, and is claimed by VirtualBox. The guest seems to known nothing about the device, when it is missing.

Read the post on USB troubleshooting:
https://forums.virtualbox.org/viewtopic.php?f=35&t=82639

And wrote a scripts to capture host and guest state. Captured (and checked in) logs.

Working the problem. :)
