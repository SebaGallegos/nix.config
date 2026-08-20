{ config, pkgs, inputs, ... }:

{
  home.username = "sebastian";
  home.homeDirectory = "/home/sebastian";

  imports = [
    ./modules/user.config/cursor.pointer.nix
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

  home.sessionVariables = {
    # Session variable to open files/directories
    # Make sure to:
    # 1. Ensure the program is installed previously (declaredin home.packages, for example)
    # 2. for better compatibility, use an editor with folder/directory support (avoid nano)
    EDITOR = "kate";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      # para hacer una nueva generación
      sys-update = "sudo nixos-rebuild switch --flake ~/.dotfiles#nixos";

      # para limpiar todo y actualizar systemd-boot
      sys-clean = "echo 'Warning: This wipes all old generations.' && read -p 'Press Enter to continue or Ctrl+C to cancel...' && sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ~/.dotfiles#nixos";

      # to edit dotfiles, uses $EDITOR session variable
      edit-df = "$EDITOR ~/.dotfiles";
    };
  };

  programs.home-manager.enable = true;
}
