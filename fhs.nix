{ buildFHSUserEnv
, zlib
}:
buildFHSUserEnv {
  name = "fhs";
  extraBwrapArgs = [
    "--ro-bind"
    "/usr/lib/wsl"
    "/usr/lib/wsl"
  ];
  targetPkgs = pkgs: with pkgs; [
    python3
    (runCommandNoCC "wsl" { } "mkdir -p $out/lib/wsl")
    zlib
  ];
  runScript = "bash";
  unshareUser = false;
  unshareIpc = false;
  unsharePid = false;
  unshareNet = false;
  unshareUts = false;
  unshareCgroup = false;
  profile = ''
    export LD_LIBRARY_PATH=/usr/lib/wsl/lib
    export PYTHONPATH=$PWD
  '';
}

