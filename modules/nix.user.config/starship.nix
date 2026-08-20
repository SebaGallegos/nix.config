# ~/.dotfiles/modules/user.config/starship.nix
{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      format = "$directory$git_branch$git_status$nix_shell$character";

      directory = {
        style = "bold blue";
        truncate_to_repo = false;
      };

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };

      nix_shell = {
        symbol = "❄️ ";
        format = "[$symbol$state( \\($name\\))]($style) ";
      };
    };
  };
}
