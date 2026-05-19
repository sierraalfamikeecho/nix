{
  pkgs,
  lib,
  ...
}: {
  services.ollama = {
    enable = true;
    syncModels = true;
    package = pkgs.ollama-cuda;
    loadModels = [
      "gpt-oss:20b"
      "granite4.1:8b"
    ];
  };
  services.open-webui = {
    enable = true;
  };
}
