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
    ./modules/roosevelt.nix
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-78a4aa4f-3aa8-46df-9f3d-a1000e165776".device = "/dev/disk/by-uuid/78a4aa4f-3aa8-46df-9f3d-a1000e165776";
  networking.hostName = "roosevelt"; # Define your hostname.
  networking.networkmanager.enable = true;

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

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      mozc
      anthy
    ];
  };

  nix.gc = {
    automatic = true;
    dates = [
      "weekly"
    ];
  };

  programs.systemtap.enable = true;
  programs.bash.completion.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  networking.nameservers = ["9.9.9.9" "149.112.112.112" "100.100.100.100" "8.8.8.8" "1.1.1.1"];
  networking.search = ["example.ts.net"];

  programs.steam = {
    enable = true;
  };
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "riscv64-linux"
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443 8080];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
  };
  networking.firewall.allowedUDPPorts = [41641]; # Or add 41641 to your existing list
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11"; # Did you read the comment?
}
