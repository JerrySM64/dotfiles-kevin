{ config, pkgs, ... }: {

  config = {  
    boot = {
      blacklistedKernelModules = [
        "xpad"
      ];
    };
    programs = {
      steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      };
    };

    # Enable the Hardware
    hardware = {
      steam-hardware = {
        enable = true;
        };
      };
    
    services = {
      udev = {
        extraRules = ''
          # Xbox Controllers
          SUBSYSTEMS=="usb", ATTRS{idVendor}=="045e", GROUP="users", TAG+="uaccess"
        '';
      };
    };
  
    # Gaming-specific packages
    environment.systemPackages = with pkgs; [
      bottles
      cartridges
      dolphin-emu
      duckstation
      gamemode
      #heroic (I use Flatpak)
      lutris
      mangohud
      mgba
      minecraft
      osu-lazer-bin
      pcsx2
      #retroarch (I use Flatpak)
      superTuxKart
      wiiuse
      winePackages.stableFull
      winetricks
      xboxdrv
      xemu
    ];
  };
}