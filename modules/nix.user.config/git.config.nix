{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Sebastián Gallegos F.";
        email = "59512190+SebaGallegos@users.noreply.github.com";
      };
      init = {
        defaultBranch = "main";
      };
    };

    signing = {
      key = "8437B33B817FE464";
      signByDefault = true;
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-qt;
  };
}
