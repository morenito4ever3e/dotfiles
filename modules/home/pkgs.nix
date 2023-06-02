{
  pkgs,
  lib,
  ...
}: let
  base = with pkgs; [
    age
    awscli2
    bashInteractive
    brotli
    cargo
    coreutils
    ctags
    curl
    direnv
    duf
    element
    exa
    ffmpeg
    fish
    fzf
    getopt
    gh
    gnupg
    gnused
    gnutar
    htop
    imagemagick
    jq
    kak-lsp
    kakoune
    libwebp
    luajit
    moreutils
    ngrok
    nodejs
    optipng
    pastel
    postgresql
    python3
    redis
    ripgrep
    shellcheck
    shfmt
    simple-http-server
    tmux
    tree
    tree-sitter
    ttyd
    viu
    vscode
    wget
    yq
    yubikey-manager
    z-lua
    zopfli
  ];

  go = with pkgs; [
    delve
    go_1_20
    golangci-lint
    gopls
    goreleaser
    gotools
  ];

  haskell = with pkgs.haskellPackages;
    [
      cabal-fmt
      cabal-install
      floskell
      fourmolu
      pkgs.haskell.compiler.ghc943
    ]
    ++ lib.optionals ((pkgs.stdenv.isDarwin && pkgs.stdenv.isAarch64) != true)
    [
      haskell-language-server
    ];

  lsp = with pkgs;
  with pkgs.elmPackages;
  with pkgs.nodePackages_latest; [
    alejandra
    bash-language-server
    elm
    elm-language-server
    golangci-lint-langserver
    nil
    prettier
    stylua
    sumneko-lua-language-server
    svgo
    typescript
    typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
  ];

  maybeMacOS = lib.optionals pkgs.stdenv.isDarwin (with pkgs; [
    blender
    cachix
    dozer
    nightfall
    telegram
  ]);
in {
  home.packages = base ++ go ++ haskell ++ lsp ++ maybeMacOS;

  programs = {
    z-lua.enable = true;
  };
}
