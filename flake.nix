{
  description = "IPRO 497 Summer 2023 Investment Tech prototypes";

  outputs = {self, nixpkgs}: {
    lib = {
      pkgsForEach = nixpkgs: cfg: systems: attrs: let
        sys2attrset = system: {
          name = system;
          value = let
            wholeCfg = cfg // {
              inherit system;
            };
            pkgs = import nixpkgs wholeCfg;
            apply = _: f: f pkgs system;
          in builtins.mapAttrs apply attrs;
        };
      in builtins.listToAttrs (map sys2attrset systems);

      pkgsForEachDefaults = self.lib.pkgsForEach nixpkgs {} [
        "x86_64-linux"
      ];
    };

    packages = self.lib.pkgsForEachDefaults {
      twitterBootstrap = pkgs: sys: pkgs.twitterBootstrap;
      masonryLayout = pkgs: sys: builtins.fetchurl {
        url = "https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js";
        sha256 = "1ljmgpnwapjlzk085j3lk92r7di475yf844k5n6v87vlzkynlz9n";
      };
    };

    devShells = self.lib.pkgsForEachDefaults {
      default = pkgs: sys: pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          gnum4
        ];
      };
    };
  };
}
