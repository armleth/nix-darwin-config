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
            sl

            # Editor
            dwt1-shell-color-scripts
            neovim
            tmux

            # Dev tools
            nixd
            nixfmt-rfc-style
            lua-language-server
            rustup

            # AI tools
            claude-code

            # Datadog
            datadog-nix.packages.${pkgs.stdenv.hostPlatform.system}.ddtool
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
