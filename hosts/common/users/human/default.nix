let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # Allows for imperative declaration of users and password. Disable once secrets have been figured out
  users.mutableUsers = true;
  users.users.human = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "network"
      "git"
      "libvirtd"
    ];

    # Initial password allows us to skip setting a root password using
    # `--no-root-passwd` as an argument to nixos-install. Change user password 
    # using passwd.
    initialPassword = "CHANGEME";
    
    packages = [ pkgs.home-manager ];
  };
}
