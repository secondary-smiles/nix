{ config, lib, pkgs, ... }:

{
  imports = [
    ./system-defaults.nix
  ];

  services.nix-daemon.enable = true;

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    casks = [
      "arc"
      "tailscale"
      "alacritty"
    ];
  };
  
  environment.variables = {
    EDITOR = "nvim";
  };
  environment.extraInit = ''
    touch ~/.hushlogin
  '';

  fonts.fonts = with pkgs; [
    jetbrains-mono
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.z6l = { pkgs, ... }: {
    home.username = lib.mkForce "z6l";
    home.homeDirectory = lib.mkForce "/Users/z6l";
    home.stateVersion = "23.05";

    home.packages = with pkgs; [
      yabai
      skhd
      coreutils
      aerc
      jq
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      vimdiffAlias = true;
    };

    programs.git = {
      enable = true;
      userName = "Shav Kinderlehrer";
      userEmail = "shav@trinket.icu";

      extraConfig = {
        commit.verbose = true;
      };
    }; 

    programs.alacritty = {
      enable = true;

      settings = {
        env.TERM = "xterm-256color";
        font = {
          size = 12;
        };

	window.decorations = "none";
	window.padding = { x = 5; y = 5; };
      };
    };
  };
}
