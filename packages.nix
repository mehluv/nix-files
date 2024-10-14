{ pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.plex.enable = true;

  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.htop.enable = true;
  programs.npm.enable = true;


  users.users.luv.packages = with pkgs; [
    nodejs
    jdk22_headless
    vivaldi
    ((pkgs.vivaldi.overrideAttrs (oldAttrs: {
      buildPhase = builtins.replaceStrings
      ["for f in libGLESv2.so libqt5_shim.so ; do"]
      ["for f in libGLESv2.so libqt6_shim.so ; do"]
      oldAttrs.buildPhase;
      dontWrapQtApps = false;
      dontPatchELF = true;
      nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.kdePackages.wrapQtAppsHook ];
    })).override {
      qt5 = pkgs.qt6;
      commandLineArgs = [
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=wayland"
          "--ozone-platform-hint=auto"
          "--enable-features=WaylandWindowDecorations"
      ];
      proprietaryCodecs = true;
      enableWidevine = true;
    })
    keepassxc
  ];

  environment.systemPackages = with pkgs; [
    wget
    lshw
    unzip
  ];
}
