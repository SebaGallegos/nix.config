{ config, pkgs, inputs, ... }:

{
  home.username = "sebastian";
  home.homeDirectory = "/home/sebastian";

  imports = [
    ./modules/user.config/git.config.nix
    ./modules/user.config/starship.nix
  ];

  home.stateVersion = "26.05";

  home.packages = [
    pkgs.brave
    pkgs.fastfetch
    pkgs.git
    pkgs.nerd-fonts.fira-code
    pkgs.pinentry-qt
    pkgs.prismlauncher
    pkgs.vlc

    inputs.helium.packages.${pkgs.system}.default
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      # para hacer una nueva generación
      sys-update = "sudo nixos-rebuild switch --flake ~/.dotfiles#nixos";

      # para limpiar todo y actualizar systemd-boot
      sys-clean = "echo 'Warning: This wipes all old generations.' && read -p 'Press Enter to continue or Ctrl+C to cancel...' && sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ~/.dotfiles#nixos";
    };
  };

  programs.home-manager.enable = true;
}
