{ ... }:

{
    programs.opencode = {
        enable = true;

        settings = {
            disabled_providers = [ "opencode" ];
            share = "disabled";
            formatter = {
                nixfmt = {
                    command = [
                        "nixfmt"
                        "--indent"
                        "4"
                        "$FILE"
                    ];
                };
            };
            permission = {
                edit = "ask";
                webfetch = "ask";
                doom_loop = "ask";
                external_directory = "ask";
                bash = {
                    "*" = "ask";
                    "pwd" = "allow";
                    "git status" = "allow";
                    "git log *" = "allow";
                    "git show *" = "allow";
                    "git diff *" = "allow";
                    "git blame *" = "allow";
                    "gh pr view *" = "allow";
                    "grep *" = "allow";
                    "rg *" = "allow";
                    "ls *" = "allow";
                    "tail *" = "allow";
                    "head *" = "allow";
                    "cat *" = "allow";
                    "find *" = "allow";
                    "tree *" = "allow";
                    "sort *" = "allow";
                };
            };
        };
    };
}
