# Packages for the best terminal

{ config, pkgs, ... }: {
  config = {
    programs = {
      command-not-found = {
        enable = true;
      };
      neovim = {
        enable = true;
      };
    };
    environment.systemPackages = with pkgs; [
      agedu
      alacritty
      btop
      cmatrix
      cool-retro-term
      duf
      eza
      figlet
      htop
      hyfetch
      kitty
      lsd
      mapscii
      mc #Midnight Commander
      neofetch
      nushell
      pfetch-rs
      progress
      radeontop
      ranger
      starship
      tiv #Terminal Image Viewer
      wget
    ];
  };
}