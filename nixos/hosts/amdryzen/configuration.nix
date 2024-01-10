# amdryzen specific config
{ config, pkgs, inputs, ... }: {
  
  imports = [
    # ../../awesomewm.nix
    ../../dev-pkgs.nix
    ../../gaming.nix
    ../../gnome-games.nix
    # ../../hyprland.nix
    ../../kde.nix
    ../../kde-games.nix
    # ../../starship.nix
    ../../terminal.nix
    # ../../wayfire.nix
    # ../../xfce.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_zen;
  };

  networking = {
    hostName = "AMDNix2312-X";
  };
  
  hardware = {
    bluetooth = {
      enable = true;
    };
  };

  services = {
    blueman = {
      enable = true;
    };
    
    pipewire = {
      jack = {
        enable = false;
      };
    };

    printing = {
      enable = true;
      #drivers = with pkgs; [
      #  epson-escpr2  # Add drivers for Epson WF-7710 printer support
      #];
    };

    spice-autorandr = {
      enable = true;
    };

    spice-vdagentd = {
      enable = true;
    };

    spice-webdavd = {
      enable = true;
    };

    udev = {
      extraRules = ''
        # Stream Deck MK.2
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="0fd9", GROUP="users", TAG+="uaccess"

        # Bluetooth Adapter
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="0a5c", GROUP="users", TAG+="uaccess"
      '';
    };
  };

  virtualisation = {
    
    libvirtd = {
      enable = true;
      
      qemu = {
	      runAsRoot = true;

        swtpm = {
          enable = true;
        };

	      ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };
      };

      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
    
    waydroid = {
      enable = true;
    };
  };

  programs = {
    ausweisapp = {
      enable = true;
    };

    fish = {
      enable = true;
      };

    geary = {
      enable = true;
    };

    thunar = {
      enable = true;
    };

    virt-manager = {
      enable = true;
    };

    zsh = {
      enable = true;
      autosuggestions = {
        enable = true;
        async = true;
        strategy = ["completion"];
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };

  users = {
    users = {
      derbetakevin = {
        extraGroups = ["libvirt" "kvm"];
        shell = pkgs.fish;
      };
    };

    groups = {
      libvirtd = {
        members = ["root" "derbetakevin"];
      };
    };
  };

  environment = {
    sessionVariables = {
      LIBVIRT_DEFAULT_URI = ["qemu:///system"];
    };

    systemPackages = with pkgs; [
      inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
      inputs.nix-software-center.packages.${system}.nix-software-center
      chatterino2
      clementine
      distrobox
      element-desktop
      espanso-wayland
      filezilla
      fluent-reader
      gimp
      google-chrome
      inkscape
      kdenlive
      librewolf
      mcfly
      microsoft-edge
      obs-studio
      onedrivegui
      putty
      realvnc-vnc-viewer
      resources
      revolt-desktop
      rpi-imager
      skypeforlinux
      signal-desktop
      slack
      spice
      teamspeak_client
      teamspeak5_client
      ted
      tor-browser
      vivaldi
      win-virtio
    ];
  };
}
