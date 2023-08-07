{ buildFHSUserEnv
, cudatoolkit
, cudaPackages
, zlib
, downloaded-packages-from-pypi
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
    cudatoolkit
    cudaPackages.cudnn
    cudaPackages.libcublas
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
    python -m venv .venv
    source .venv/bin/activate
    pip install --no-index --find-links ${downloaded-packages-from-pypi} -r requirements.txt
  '';
}

