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
    brews = [
    ];
    casks = [
      "arc"
      "tailscale"
      "alacritty"
      "swift-quit"
      "httpie"
      "qbittorrent"
      "appcleaner"
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
        if [ -z $TMUX ]; then tmux a || tmux; fi
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
        init.defaultBranch = "main";
      };
    }; 

    programs.alacritty = {
      enable = true;

      settings = {
        import = ["~/nix/dots/alacritty/dracula.toml"];

        env.TERM = "xterm-256color";
        font = {
          normal.family = "JetbrainsMono Nerd Font Mono";
          size = 12;
        };

	      window.decorations = "none";
	      window.padding = { x = 5; y = 5; };
        window.option_as_alt = "Both";

        mouse.hide_when_typing = true;
      };
    };

    programs.tmux = {
      enable = true;
      escapeTime = 0;
      mouse = true;
      clock24 = true;
      terminal = "tmux-256color";
      extraConfig = ''
        unbind C-b
        set -g prefix C-s

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        unbind "'"
        bind "'" split-window -h -c "#{pane_current_path}"
        bind '"' split-window -v -c "#{pane_current_path}"
        unbind %
      '';
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.dracula;
          extraConfig = ''
            set -g @dracula-show-powerline false
            set -g @dracula-plugins "git battery weather time"
            set -g @dracula-show-left-icon "●"

            set -g @dracula-show-location false
            set -g @dracula-military-time true
          '';
        }
      ];
    };
  };
}
