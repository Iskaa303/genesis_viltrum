{ pkgs, lib, ... }:

{
  packages = [ pkgs.zulu17 ];

  languages.java = {
    enable = true;
    jdk.package = pkgs.zulu21;
  };

  env = {
    MOD_VERSION = "0.0.0";
    GRADLE_USER_HOME = "./.gradle";
    JAVA17_HOME = "${pkgs.zulu17}";
    LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
      libGL
      glfw
      openal
      flite
      libpulseaudio
      udev
      libxcursor
      libxxf86vm
      libxrandr
      libxext
      libx11
    ];
  };
}
