# Contains macOS-specific settings (Dock, Finder, defaults, etc.) for BlackFox-M4

{ config, pkgs, lib, ... }:

{
  # Following line should allow us to avoid a logout/login cycle
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.defaults = {

    controlcenter = {
      AirDrop = false;
      BatteryShowPercentage = true;
      Bluetooth = false;
      FocusModes = false;
      NowPlaying = false;
      Sound = true;
    };

    dock = {
      autohide = true;
      mineffect = "suck";
      minimize-to-application = true;
      mru-spaces = false;
      persistent-apps = [
	#{ app = "${pkgs.obsidian}/Applications/Obsidian.app"; }
        { app = "/System/Applications/Calculator.app"; }
        { app = "/Applications/Nix Apps/Brave Browser.app"; }
        { app = "/Applications/Nix Apps/Signal.app"; }
        { app = "/Applications/Ghostty.app"; }
      ];
      persistent-others = []; # Ensure no persistent folders/stacks like Downloads
      show-recents = false; # Prevent 'Recent Applications' section in Dock
      static-only = true; # Show only open applications in the Dock
      tilesize = 48;
    };

    finder = {
      AppleShowAllExtensions = true;
      _FXShowPosixPathInTitle = false;
      _FXSortFoldersFirst = true; # Keep folders on top when sorting by name
      FXDefaultSearchScope = "SCcf"; # When in search, search the current folder by default
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv"; # Change the default finder view. "icnv" = Icon view, "Nlsv" = List view, "clmv" = Column View, "Flwv" = Gallery View
      NewWindowTarget = "Home"; # Change the default folder shown in Finder windows
      ShowPathbar = true;
      QuitMenuItem = true;
    };

    menuExtraClock.ShowDate = 1;

    trackpad = {
      Clicking = true; # Whether to enable trackpad tap to click
    };

    WindowManager = {
      EnableStandardClickToShowDesktop = false;
      EnableTiledWindowMargins = false; # Enable window margins when tiling windows
      EnableTilingByEdgeDrag = false; # Enable dragging windows to screen edges to tile them
      EnableTilingOptionAccelerator = false; # Enable holding alt to tile windows
      EnableTopTilingByEdgeDrag = false; # Enable dragging windows to the menu bar to fill the screen
    };

    screencapture.target = "preview";

    screensaver = {
      askForPassword = true; # Require password immediately after sleep or screen saver begins
      askForPasswordDelay = 0;
    };

    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

    CustomUserPreferences = {
      # Prevent creation of .DS_Store files
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      # ads
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
        allowIdentifierForAdvertising = false;
      };
    };
  };

  # Disable startup sound
  system.startup.chime = false;

  # Set computer/hostname 
  networking.computerName = "BlackFox-M4"; # Set in System Settings > General > About
  networking.hostName = "BlackFox-M4";

  # Enable Touch ID
  security.pam.services.sudo_local.touchIdAuth = true;

}
