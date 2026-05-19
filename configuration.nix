{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/neovim.nix
    ./modules/packages.nix
    ./modules/services.nix
    ./hosts/roosevelt.nix
    ./modules/nvidia.nix
    ./modules/networking.nix
    ./modules/fcitx.nix
    ./modules/stylix.nix
    ./modules/ai.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = "install algif_aead /bin/false";

  networking.hostName = "roosevelt"; # Define your hostname.

  time.timeZone = "America/Los_Angeles";

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
  networking.firewall.checkReversePath = "loose";
  networking.wireless.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sam = {
    isNormalUser = true;
    description = "sam";
    extraGroups = ["networkmanager" "wheel"];
    packages = [
    ];
  };
  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  programs.steam = {
    enable = true;
  };
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "riscv64-linux"
  ];
  networking.firewall.allowedUDPPorts = [41641]; # Or add 41641 to your existing list
  nix = {
    gc = {
      automatic = true;
      dates = [
        "daily"
      ];
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };
  system.stateVersion = "25.11"; # Did you read the comment?
}
