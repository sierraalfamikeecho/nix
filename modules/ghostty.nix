{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    settings = {
      background-opacity = 1;
      background-blur = true;
      cursor-style-blink = true;
      theme = "Kanagawa Dragon";
      font-size = 17;
      font-family = "Lilex Nerd Font Mono";
    };
  };
}
