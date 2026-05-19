{
  config,
  pkgs,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    extraPackages = with pkgs; [
      nixd
      nil
      libclang
      haskell-language-server
      ruff
      tinymist
      harper
      ocamlPackages.ocaml-lsp
    ];
    userSettings = {
      telemetry = {
        metrics = false;
      };
      hour_format = "hour24";
      vim_mode = true;
      disable_ai = false;
      # buffer_font_size = 17;
      # buffer_font_family = "Lilex Nerd Font Mono";
      # ui_font_family = "IBM Plex Sans";
      # ui_font_size = 16;
    };
    extensions = [
      "nix"
      "verilog"
      "astro"
      "probe-rs"
      "compline"
      "make"
      "toml"
      "basher"
      "neocmake"
      "tcl"
      "csharp"
      "assembly"
      "haskell"
      "typst"
      "colored-zed-icons-theme"
      "justfile"
      "ocaml"
      "tomorrow-min-theme"
    ];
    themes = {
      mode = "dark";
      dark = "Compline";
    };
  };
}
