let pkgsSource = fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/8aa1ee34b999cdd12bdfd262a5a3db27f18602d6.tar.gz";
      sha256 = "1751pnwx95b0nnj1hzzrafyxl6wjjqzn89k55q62r56fx0cvbsr2";
    };
    pkgs = import pkgsSource {};

    gems = pkgs.bundlerEnv {
      name = "nix-gem-propagated-build-inputs-bug-gems";
      ruby = pkgs.ruby_2_7;
      gemdir = ./.;
    };
in
pkgs.mkShell {
  name = "nix-gem-propagated-build-inputs-bug-app";
  buildInputs = [ gems /* pkgs.v8 */ ];
}
