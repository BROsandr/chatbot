{ sources ? import ./sources.nix }: let
  pkgs = import sources.nixpkgs { config = {}; overlays = []; };

  pyEnv = let
    free-proxy = pkgs.callPackage ./python/free-proxy.nix {};
  in pkgs.python3.withPackages (ps: [ free-proxy ]);

  shell = pkgs.mkShell {
    inputsFrom = [ ];
    packages = with pkgs; [
      pyEnv
    ];

    hardeningDisable = ["all"];
  };
in {
  inherit pyEnv shell;
}
