{ stdenvNoCC
, python3
}:
stdenvNoCC.mkDerivation {
  name = "downloaded-pypi-file";
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
    pip download -r requirements.txt -d $out
  '';
  outputHashAlgo = "sha256";
  outputHashMode = "recursive";
  outputHash = "sha256-kkIJ0JEJDhTztTfxXOOudE6hnHAOiPaSOITizzTbG7Q=";
}
