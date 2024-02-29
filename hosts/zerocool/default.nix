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
    ];
  };
  
  environment.variables = {
    EDITOR = "nvim";
  };

  fonts.fonts = with pkgs; [
    jetbrains-mono
  ];

  programs.zsh = {
    enable = true;
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
    }; 

    programs.alacritty = {
      enable = true;

      settings = {
        env.TERM = "xterm-256color";
        font = {
          size = 12;
          draw_bold_text_with_bright_colors = true;
        };
      };
    };
  };
}
