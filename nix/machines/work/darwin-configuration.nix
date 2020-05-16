{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    awscli
    chefdk
    emacs
    fasd
    fd
    fzf
    git
    google-cloud-sdk
    python3
    ripgrep
    tree
    vim
    vscode
    zsh
  ];
  environment.shells = [ pkgs.zsh ];
  environment.pathsToLink = [ "/share/zsh" ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  #programs.bash.enable = true;
  programs.zsh.enable = true;
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 1;
  nix.buildCores = 1;

  imports = [
    <home-manager/nix-darwin>

    ../../modules
  ];

  users.users.gaelan = {
    home = "/Users/gaelan";
    description = "Gaelan D'costa";

    shell = pkgs.zsh;
  };
}
