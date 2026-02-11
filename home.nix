{
  config,
  pkgs,
  ...
}: {
  home.username = "sam";
  home.homeDirectory = "/home/sam";
  home.stateVersion = "25.11";
  imports = [
    ./modules/ghostty.nix
    ./modules/zed.nix
  ];

  programs.bash = {
    enable = true;
    initExtra = "
        tmux
        fastfetch
      ";
    shellAliases = {
      nixc = "sudo nvim /home/sam/.config/nix/configuration.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      nixf = "sudo nvim /home/sam/.config/nix/flake.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      nixh = "sudo nvim /home/sam/.config/nix/home.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      reload-nix = "sudo nixos-rebuild switch --flake /home/sam/.config/nix";
      firmware-menu = "sudo systemctl reboot --firmware-setup";
    };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    terminal = "tmux-256color";
    keyMode = "vi";
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        email = "osamwonyi_eke@protonmail.com";
        name = "Sam";
      };

      core.editor = "nvim";
    };
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      general.hide_cursor = true;

      animations.enabled = false;
      background = {
        path = "/home/sam/Downloads/tsuyoshi-kozu-bB1PGcGdUY4-unsplash.jpg";
        blur_passes = 1;
        blur_size = 4;
      };
    };
  };
  programs.starship = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  services.gammastep = {
    enable = true;
    temperature.night = 2000;
    dawnTime = "6:00-6:30";
    duskTime = "18:00-18:30";
  };
}
