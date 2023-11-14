{ ... }:

{
  # CKB-Next

  hardware.ckb-next.enable = true;

  # Bluetooth

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # ddcutil / i2c
  hardware.i2c.enable = true;
}