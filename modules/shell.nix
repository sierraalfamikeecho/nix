{
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza -la";
      cd = "z";
      fw-menu = "sudo systemctl reboot --firmware-setup";
    };
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      firmware-menu = "sudo systemctl reboot --firmware-setup";
      ls = "eza -la";
      cat = "bat";
      cd = "z";
      btop = "sudo btop";
    };
    interactiveShellInit = ''
      set fish_greeting
      tmux a
    '';
    plugins = [
      {
        name = "z";
        src = pkgs.fishPlugins.z;
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  programs.eza = {
    enable = true;
    colors = "always";
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
