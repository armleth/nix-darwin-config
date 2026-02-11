{ pkgs, lib, ... }:

let
    fSearchExcludes = [
        ".cabal"
        ".cache"
        ".cargo"
        ".docker"
        ".dotnet"
        ".emacs.d"
        ".git"
        ".gnupg"
        ".ipython"
        ".java"
        ".jupyter"
        ".local"
        ".meteor"
        ".mozilla"
        ".nix-defexpr"
        ".nodes"
        ".npm"
        ".nv"
        ".opam"
        ".open"
        ".pex"
        ".pki"
        ".powerlevel10k"
        ".rustup"
        ".ssh"
        ".steam"
        ".vscode"
        "node_modules"

        ".pyenv"
        ".claude"
        ".rbenv"
        ".aws"
    ];

    fSearchExcludeFlags = lib.concatMapStringsSep " " (
        x: "--exclude ${lib.escapeShellArg x}"
    ) fSearchExcludes;

    sudoAlias = "/Applications/Privileges.app/Contents/MacOS/PrivilegesCLI -a && /usr/bin/sudo";
in
{
    programs.fish = {
        enable = true;

        interactiveShellInit = ''
            set fish_greeting
            set -gx NIXPKGS_ALLOW_UNFREE 1
        '';

        shellInit = ''
            fish_vi_key_bindings
        '';

        functions = {
            fish_user_key_bindings = ''
                fzf_key_bindings

                for mode in insert default visual
                  bind -M $mode \cf  forward-char
                end
            '';
        };

        shellAliases = {
            sudo = "${sudoAlias}";
            rebuild = "${sudoAlias} darwin-rebuild switch --flake /etc/nix-darwin/";
            vi = "nvim";
            vim = "nvim";
            cat = "bat";
            ls = "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first";
            tree = "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --tree";
            atmt = "poetry run atmt";
            gco = "git checkout";
            gst = "git status";
        };

        functions = {
            f = {
                body = ''
                    set -l find_directory fd --type d --hidden ${fSearchExcludeFlags}
                    cd ($find_directory | fzf --preview='ls --color {}')
                '';
            };
        };
    };
}
