
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./sway.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "chambersite";

  time.timeZone = "Europe/Moscow";

  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.quad = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
  };

  environment.systemPackages = with pkgs; [
    vim
    termite
    bemenu
    drill
    htop
    glances
    ghc
    firefox
    docker
    mc
    zsh
    oh-my-zsh
    ansible
    tdesktop
    emacs
    monoid
    feh
    waybar
    neofetch
    font-awesome-ttf
    git
  z];

  services.openssh.enable = true;
  
  system.stateVersion = "20.09";

}

