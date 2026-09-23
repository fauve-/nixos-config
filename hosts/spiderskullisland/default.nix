{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_6_18;

  # Enable networking  networking.hostName = "spiderskull-island"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;
  networking.hostName = "spiderskull-island";

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
  };

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.fauve = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    firefox
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Keep the value generated for your installation.
  system.stateVersion = "26.05";

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    # Appropriate for most RTX 20xx+ GPUs.
    # Older GPUs may need false.
    open = true;
    modesetting.enable = true;
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:101@0:0:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };

  programs.zsh.enable = true;

  users.users.fauve.shell = pkgs.zsh;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
