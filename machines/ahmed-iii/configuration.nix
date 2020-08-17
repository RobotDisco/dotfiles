{ config, pkgs, ... }:

let

  hostName = "Fountain-of-Ahmed-III";

in

{

  networking.hostName = hostName;
  
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  #environment.systemPackages = with pkgs; [
  #];
  #environment.shells = [ pkgs.zsh ];
  #environment.pathsToLink = [ "/share/zsh" ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  #programs.bash.enable = true;
  programs.zsh.enable = true;
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  nix.nixPath = [
    "dotfiles=$HOME/code/dotfiles"
  ];

  imports = [
    <dotfiles/setup/darwin>
  ];
}
