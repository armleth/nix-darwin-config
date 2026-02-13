{
    pkgs,
    self,
    ...
}:
{
    # imports = [
    #     ./yabai.nix
    #     ./skhd.nix
    # ];

    users.users = {
        root.shell = pkgs.fish;

        "armand.thibaudon" = {
            home = "/Users/armand.thibaudon";
            shell = pkgs.fish;
        };
    };

    nixpkgs.config.allowUnfree = true;
    programs.fish.enable = true;

    nix.settings.experimental-features = "nix-command flakes";

    security.pam.services.sudo_local = {
        touchIdAuth = true;
        reattach = true;
    };

    system = {
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;

        primaryUser = "armand.thibaudon";
        stateVersion = 6;
    };

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}
