{ stdenvNoCC
, python3
}:
stdenvNoCC.mkDerivation {
  name = "downloaded-packages-from-pypi";
  buildInputs = [
    (python3.withPackages (ps: with ps; [
      pip
    ]))
  ];
  src = ./requirements.txt;
  unpackPhase = ''
    cp $src requirements.txt
  '';
  buildPhase = ''
    pip download -r requirements.txt -d $out --find-links https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
  '';
  outputHashAlgo = "sha256";
  outputHashMode = "recursive";
  outputHash = "sha256-g2nBEVbriSCn+/daF6ZSfmkBJdJZNWTmtnZ7o34Mvuw=";
}
