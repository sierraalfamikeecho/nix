{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# System wide apps
environment.systemPackages = with pkgs; [
  tailscale-systray
  pywal
wget
valgrind-light
typst
quickemu
qemu
git
neovim
nil
btop
fastfetch
zed-editor
anki
brave
steam-run
gh
rofi
gdb
gnumake
fzf
python313
swaybg
yazi
zathura
gimp
davinci-resolve
tenacity
obs-studio
obsidian
starship
pavucontrol
ghostty
verible
ruff
oterm
tmux
slurp
grim
wl-clipboard
tor-browser
kicad
openscad
waypaper
dunst
libclang
wlogout
xdg-desktop-portal-wlr
wl-clipboard
wl-clip-persist
cliphist
gammastep
vial
ungoogled-chromium
koruri
lm_sensors
tcl
];

fonts.packages = with pkgs; [
  nerd-fonts.victor-mono
  nerd-fonts.ubuntu-sans
  noto-fonts-cjk-sans
  nerd-fonts.caskaydia-cove
];

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
};

programs.systemtap.enable = true;

services.ollama = {
  enable = true;
  package = pkgs.ollama-cuda;
  loadModels = [
    "gpt-oss:20b"
    "devstral-small-2:24b"
    "qwen3-vl:8b"
  ];
};

services.open-webui = {
	enable = true;

};
services.sunshine = {
  enable = true;
  autoStart = true;
  capSysAdmin = true;
  openFirewall = true;
};

virtualisation.podman = {
  enable = true;
  dockerCompat = true;
};
#mango, ly and waybar
programs.mango.enable = true;
services.displayManager.ly.enable = true;
  
# Nvidia GPU
hardware = {
  graphics = {
    enable = true;
    enable32Bit = true;
  };

  nvidia = {
    open = true;
    modesetting.enable = true;
    powerManagement.enable = true;
  };
};

environment.variables = {
  NVD_BACKEND = "direct";
  LIBVA_DRIVER_NAME = "nvidia";
  WLR_NO_HARDWARE_CURSORS = "1";
  GBM_BACKEND = "nvidia-drm";
};

services.xserver.videoDrivers = [ "nvidia" ];

# Bluetooth
hardware.bluetooth.enable = true;
services.blueman.enable = true;

networking.nameservers = [ "9.9.9.9" "149.112.112.112" ];
services.tailscale = {
  enable = true;
  openFirewall = true;
};

services.resolved = {
  enable = true;
  settings.Resolve = {
  	DNSSEC = "true";
  	Domains = [ "~." ];
  	FallbackDNS = [ "9.9.9.9" "149.112.112.112" ];
  	DNSOverTLS = "true";
  };
};

services.openssh = {
  enable = true;
  ports = [ 22 ];
  settings = {
    PasswordAuthentication = true;
    AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
    UseDns = true;
    X11Forwarding = false;
    PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  };
};

programs.steam = {
	enable = true;
};

programs.thunar = {
	enable = true;
};

programs.kdeconnect = {
	enable = true;
};

  networking.firewall = { 
    enable = true;
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };
  networking.firewall.allowedUDPPorts = [ 41641 ]; # Or add 41641 to your existing list
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; # Did you read the comment?

}
