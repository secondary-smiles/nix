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
      "swift-quit"
    ];
  };
  
  environment.variables = {
    EDITOR = "nvim";
  };
  environment.shellAliases = {
    ls = "ls --color=auto";
  };

  programs.zsh.enable = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.z6l = { pkgs, ... }: {
    home.username = lib.mkForce "z6l";
    home.homeDirectory = lib.mkForce "/Users/z6l";
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
      yabai
      skhd
      coreutils
      aerc
      jq
      nixd
      typst
      gnupg
      pandoc
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      enableAutosuggestions = true;
      initExtra = ''
        GPG_TTY="$(tty)"
      '';
      localVariables = {
        PS1 = "%F{red}%B%(?..[%?] )%f%F{cyan}%b%n@%m%f * ";
        RPS1 = "%F{magenta}%~%f";
      };
    };

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
          normal.family = "JetbrainsMono Nerd Font Mono";
          size = 12;
        };

	      window.decorations = "none";
	      window.padding = { x = 5; y = 5; };

        mouse.hide_when_typing = true;
      };
    };
  };
}
