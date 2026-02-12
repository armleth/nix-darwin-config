{
    pkgs,
    self,
    ...
}:
{

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

    # Set Git commit hash for darwin-version.
    system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 6;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}
