# Manages Homebrew using nix-darwin's built-in module

{ config, pkgs, lib, ... }:

{
  homebrew = {
    enable = true;

    taps = [
      # "your/custom-tap" # Add other taps by name here if needed
    ];

    # Add brews here if you need any command-line tools via Homebrew
    # brews = [ "git", "jq" ]; # Example

    casks = [
      "brave-browser"
      "ghostty"
      "google-drive"
      "signal"
      "vlc"
    ];

    # Optional: Configure update/cleanup behavior (use with care)
    # onActivation.autoUpdate = true;  # Run `brew update` during activation
    # onActivation.upgrade = true;     # Run `brew upgrade` during activation
    # onActivation.cleanup = "zap";    # Run `brew cleanup --zap` during activation
  };
}
