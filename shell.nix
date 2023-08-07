{ mkShell
, nvfetcher
, python3
}:
mkShell {
  buildInputs = [
    nvfetcher
    (python3.withPackages (ps: with ps; [
      pip
    ]))
  ];
}
