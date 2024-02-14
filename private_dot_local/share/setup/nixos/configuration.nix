{ config, pkgs, ... }:

{
  imports =
  [
  ./hardware-configuration.nix
  ]

  boot.loader.grub {
      enable = true;
      useOSProber = true;
      device = "/dev/vda";
    }

    networking {
        networkmanager.enable = true;
        hostname = "nixos";
      }

  environment.systemPackages = with pkgs; [
    pkgs {
        sway
        waybar
      }
  ];
}
