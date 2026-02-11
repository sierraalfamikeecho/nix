{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    enableBashIntegration = true;
    settings = {
      background-opacity = 0.975;
      background-blur = true;
      theme = "Tomorrow Night Bright";
      font-size = 17;
      font-family = "VictorMono Nerd Font";
    };
  };
}
