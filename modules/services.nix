{
  config,
  pkgs,
  ...
}: {
  services.printing.enable = true;

  services.caddy = {
    enable = true;
    virtualHosts."roosevelt.bream-pike.ts.net".extraConfig = ''
      reverse_proxy 127.0.0.1:8080
    '';
  };
  services.tailscale.permitCertUid = "caddy";

  programs.steam = {
    enable = true;
  };

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
  };

  services.sysstat = {
    enable = true;
  };

  services.envfs = {
    enable = true;
  };

  programs.kdeconnect = {
    enable = true;
  };

  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
}
