{ config, pkgs, inputs, ... }:

{
  home.username = "sebastian";
  home.homeDirectory = "/home/sebastian";

  imports = [
    ./modules/user.config/git.config.nix
    ./modules/user.config/starship.nix
  ];

  # WARNING
  # DO NOT CHANGE THIS!!!
  home.stateVersion = "26.05";

  home.packages = [
    pkgs.git
    pkgs.fastfetch
    pkgs.brave
    pkgs.pinentry-qt

    pkgs.nerd-fonts.fira-code
    inputs.helium.packages.${pkgs.system}.default
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      # to create a new generation
      sys-update = "sudo nixos-rebuild switch --flake ~/.dotfiles#nixos";

      # to wipe all old generations (only keeps the actual) and wipe their entries on systemd-boot
      sys-clean = "echo 'Warning: This wipes all old generations.' && read -p 'Press Enter to continue or Ctrl+C to cancel...' && sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ~/.dotfiles#nixos";
    };
  };

  programs.home-manager.enable = true;
}
