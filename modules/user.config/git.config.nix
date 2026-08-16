{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Sebastián Gallegos F.";
    userEmail = "59512190+SebaGallegos@users.noreply.github.com";
    signing = {
      key = "8437B33B817FE464";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.ssh = {
    enable = true;
  };

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };
}
