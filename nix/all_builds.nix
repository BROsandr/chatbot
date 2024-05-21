{ sources ? import ./sources.nix }: let
  pkgs = import sources.nixpkgs { config = {}; overlays = []; };

  free-proxy = pkgs.callPackage ./python/free-proxy.nix {};

  shell = pkgs.mkShell {
    inputsFrom = [ ];
    packages = with pkgs; [
      free-proxy
    ];

    hardeningDisable = ["all"];
  };
in {
  inherit free-proxy shell;
}
