{ config, pkgs, inputs, ... }:

{
  home.username = "sebastian";
  home.homeDirectory = "/home/sebastian";

  imports = [
    ./modules/nix.user.config/cursor.pointer.nix
    ./modules/nix.user.config/git.config.nix
    ./modules/nix.user.config/starship.nix
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

  xdg.configFile."fastfetch/mini.jsonc".source = ./modules/config.files/fastfetch/mini.jsonc;

  programs.bash = {
    enable = true;
    initExtra = ''
      fastfetch --config mini
    '';
    shellAliases = {
      # to make a new generation
      sys-update = "sudo nixos-rebuild switch --flake ~/.dotfiles#nixos";

      # to wipe all generations and update systemd-boot
      sys-clean = "echo 'Warning: This wipes all old generations.' && read -p 'Press Enter to continue or Ctrl+C to cancel...' && sudo nix-collect-garbage -d && sudo nixos-rebuild boot --flake ~/.dotfiles#nixos";

      # to edit dotfiles, uses $EDITOR session variable
      edit-df = "$EDITOR ~/.dotfiles";
    };
  };

  programs.home-manager.enable = true;
}
