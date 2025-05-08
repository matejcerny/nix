{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "history" "jsontools" "macos" ];
    };
    shellAliases = {
      l = "lsd -la --group-dirs first";
      nix-reload = "nix run nix-darwin -- switch --flake .#BlackFox-M4";
      hm-reload = "home-manager switch --flake .#BlackFox-M4 --impure";
       #update = "nix flake update && home-manager switch --flake .";
    };
    # initExtra = ''
    #   export EDITOR=nvim
    # '';
  };
}
