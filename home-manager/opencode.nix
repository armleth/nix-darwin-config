{ ... }:

{
    programs.opencode.settings = {
        "disabled_providers" = [ "opencode" ];
        "share" = "disabled";
        "permission" = {
            "edit" = "ask";
            "webfetch" = "ask";
            "doom_loop" = "ask";
            "external_directory" = "ask";
            "bash" = {
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
            };
        };
    };
}
