{
    lib,
    config,
    pkgs,
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

            # Dev tools
            nixd
            nixfmt-rfc-style
            lua-language-server
            rustup

            # AI tools
            claude-code
        ];
    };

    programs = {
        fzf = {
            enable = true;
            enableFishIntegration = true;
        };
    };

    xdg.enable = true;

    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
}
