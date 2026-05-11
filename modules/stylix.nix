{pkgs, ...}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";

    fonts = {
      serif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Sans";
      };

      sansSerif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.lilex;
        name = "Lilex Nerd Font Mono";
      };

      sizes = {
        desktop = 16;
        terminal = 18;
        applications = 14;
      };
    };
  };
}
