{ config, pkgs, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/home/sam";
  home.stateVersion = "25.11";

  
programs.bash  = {
    enable = true;
    initExtra = "
        tmux a
        fastfetch
      ";
    shellAliases = {
      nixc="sudo nvim /home/sam/.config/nix/configuration.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      nixf="sudo nvim /home/sam/.config/nix/flake.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      nixh="sudo nvim /home/sam/.config/nix/home.nix && sudo nixos-rebuild switch --flake /home/sam/.config/nix";

      firmware-menu="sudo systemctl reboot --firmware-setup";
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
    settings ={
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
  
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    enableBashIntegration = true;
    settings = {
      background-opacity = 0.975;
      background-blur = true;
      theme = "Tomorrow Night";
      font-size = 17;
      font-family = "VictorMono Nerd Font";
    };
  };
  
  programs.alacritty = {
    enable = true;
    theme = "base16_default_dark";
    settings = {

      font = {
      normal = {
        family = "VictorMono Nerd Font";
        style = "medium";
      };
      size = 16;
      };

      window = {
        opacity = 0.98;
        blur = true;
      };      
    };
  };

  programs.neovim = {
  defaultEditor = true;
  coc.enable = true;
  plugins = with pkgs.vimPlugins; [
  vim-nix
  fugitive
  nvim-cmp
  luasnip
  lualine-nvim
  ];

  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  };
  programs.zed-editor = {
    enable = true;
    extensions = [ "Nix" "Verilog" "Astro" "probe-rs" "base16" "Make" "GDScript" ];
    installRemoteServer = true;
    userSettings = {
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 18;
      disable_ai = true;
      buffer_font_family = "VictorMono Nerd Font Mono";      
    };
  };
  programs.starship = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  services.tailscale-systray = {
    enable = true;
  };
  services.gammastep = {
    enable = true;

    temperature.night = 2100;
    
    dawnTime = "6:00-6:30";
    duskTime = "18:00-18:30";
  };

  programs.pywal = {
    enable = true;
  };
}
