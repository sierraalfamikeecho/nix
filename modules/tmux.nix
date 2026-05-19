{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    newSession = true;
    terminal = "tmux-256color";
    keyMode = "vi";
    baseIndex = 0;
    mouse = true;
    disableConfirmationPrompt = true;
    tmuxp.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      harpoon
      tmux-fzf
      yank
      pass
    ];
  };
}
