{ system, ... }:
{
  system.defaults = {
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
    };

    dock = {
      autohide = true;
      autohide-delay = 0.01;
      autohide-time-modifier = 0.01;
      expose-animation-duration = 0.01;
      mru-spaces = false;
      orientation = "right";
      show-recents = false;
      static-only = true;
      tilesize = 1; # 64 is default
    };

    finder = {
      FXEnableExtensionChangeWarning = false;
      QuitMenuItem = true;
      ShowPathbar = true;
    };
    screencapture.disable-shadow = true;
    screensaver.askForPasswordDelay = 60;
  };
}
