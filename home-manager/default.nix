{
    lib,
    config,
    pkgs,
    datadog-nix,
    ...
}:

{
    imports = [
        ./shell.nix
        ./tmux.nix
        ./opencode.nix
    ];

    home = {
        username = "armand.thibaudon";
        homeDirectory = "/Users/armand.thibaudon";

        packages = with pkgs; [
            # Basic unix tools
            bat
            eza
            fd
            ripgrep

            # Editor
            dwt1-shell-color-scripts
            neovim
            tmux
            vscode

            # Dev tools
            nixd
            nixfmt-rfc-style
            lua-language-server
            gotools
            black
            pyright

            # AI tools
            claude-code

            # Datadog
            datadog-nix.packages.${pkgs.stdenv.hostPlatform.system}.ddtool

            # OPW
            rustup
            protobuf
            go

            # UI tools
            betterdisplay

            # Docker
            docker
            docker-compose

            # Apps
            spotify
        ];
    };

    programs = {
        direnv = {
            enable = true;
            nix-direnv.enable = true;
        };
        fzf = {
            enable = true;
            enableFishIntegration = true;
        };
    };

    xdg.enable = true;

    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
}
