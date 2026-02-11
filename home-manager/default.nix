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
    ];

    home = {
        username = "armand.thibaudon";
        homeDirectory = "/Users/armand.thibaudon";

        packages = with pkgs; [
            # Basic unix tools
            bat
            eza
            fd
            neofetch
            ripgrep

            # Editor
            dwt1-shell-color-scripts
            neovim
            tmux

            # Dev tools
            nixd
            nixfmt-rfc-style
            rustup
            lua-language-server
        ];
    };

    programs = {
        fzf = {
            enable = true;
            enableFishIntegration = true;
        };
    };

    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
}
