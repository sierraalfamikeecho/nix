{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpit-aware = "yes";
        layer = "overlay";
        icons-enabled = "yes";
        keyboard-focus = "on-demand";
        terminal = "ghostty -e {cmd}";
        auto-select = "yes";
        width = 64;
      };
      border = {
        width = 0;
        radius = 0;
      };
    };
  };
}
