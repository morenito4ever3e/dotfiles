{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  inputs.nixpkgs-unstable.url = "flake:nixpkgs";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  inputs.charm.url = "github:charmbracelet/nur";
  inputs.charm.inputs.nixpkgs.follows = "nixpkgs-unstable";
  inputs.ghostty.url = "git+ssh://git@github.com/ghostty-org/ghostty";

  # Vim/NeoVim plugins
  inputs.color-picker-nvim.url = "github:ziontee113/color-picker.nvim";
  inputs.color-picker-nvim.flake = false;

  # Lua fzy implementation
  inputs.fzyLua.url = "https://raw.githubusercontent.com/swarn/fzy-lua/a3f1dd75725b535e6b00af84048c7e066432f530/src/fzy_lua.lua";
  inputs.fzyLua.flake = false;

  # macOS stuff
  inputs.mkAlias.url = "github:cdmistman/mkAlias";
  inputs.mkAlias.inputs.nixpkgs.follows = "nixpkgs-unstable";
  inputs.blenderMacOSAarch64.url = "https://mirror.clarkson.edu/blender/release/Blender4.1/blender-4.1.1-macos-arm64.dmg";
  inputs.blenderMacOSAarch64.flake = false;
  inputs.blenderMacOSx86_64.url = "https://mirror.clarkson.edu/blender/release/Blender4.1/blender-4.1.1-macos-x64.dmg";
  inputs.blenderMacOSx86_64.flake = false;
  inputs.dozer.url = "https://github.com/Mortennn/Dozer/releases/download/v4.0.0/Dozer.4.0.0.dmg";
  inputs.dozer.flake = false;
  inputs.hammerspoon.url = "https://github.com/Hammerspoon/hammerspoon/releases/download/1.0.0/Hammerspoon-1.0.0.zip";
  inputs.hammerspoon.flake = false;
  inputs.monitorcontrol.url = "https://github.com/MonitorControl/MonitorControl/releases/download/v4.1.0/MonitorControl.4.1.0.dmg";
  inputs.monitorcontrol.flake = false;
  inputs.nightfall.url = "https://github.com/r-thomson/Nightfall/releases/download/v3.0.0/Nightfall.dmg";
  inputs.nightfall.flake = false;

  # Fonts
  inputs.anchor.url = "git+ssh://git.rocha.is/anchor";
  inputs.anchor.flake = false;
  inputs.arno-pro.url = "git+ssh://git.rocha.is/arno-pro";
  inputs.arno-pro.flake = false;
  inputs.benjamins-gothic.url = "git+ssh://git.rocha.is/benjamins-gothic";
  inputs.benjamins-gothic.flake = false;
  inputs.gabriello.url = "git+ssh://git.rocha.is/gabriello";
  inputs.gabriello.flake = false;
  inputs.gelion.url = "git+ssh://git.rocha.is/gelion";
  inputs.gelion.flake = false;
  inputs.larsseit.url = "git+ssh://git.rocha.is/larsseit";
  inputs.larsseit.flake = false;
  inputs.liza.url = "git+ssh://git.rocha.is/liza";
  inputs.liza.flake = false;
  inputs.maru.url = "git+ssh://git.rocha.is/maru";
  inputs.maru.flake = false;
  inputs.monoflow.url = "git+ssh://git.rocha.is/monoflow";
  inputs.mononoki.url = "git+ssh://git.rocha.is/mononoki";
  inputs.mononoki.flake = false;
  inputs.mori.url = "git+ssh://git.rocha.is/mori";
  inputs.mori.flake = false;
  inputs.monoflow.flake = false;
  inputs.neufile-grotesk.url = "git+ssh://git.rocha.is/neufile-grotesk";
  inputs.neufile-grotesk.flake = false;
  inputs.pique.url = "git+ssh://git.rocha.is/pique";
  inputs.pique.flake = false;
  inputs.pangaia.url = "git+ssh://git.rocha.is/pangaia";
  inputs.pangaia.flake = false;
  inputs.rifton.url = "git+ssh://git.rocha.is/rifton";
  inputs.rifton.flake = false;
  inputs.rois.url = "git+ssh://git.rocha.is/rois";
  inputs.rois.flake = false;
  inputs.sf-mono.url = "git+ssh://git.rocha.is/sf-mono";
  inputs.sf-mono.flake = false;
  inputs.saans.url = "git+ssh://git.rocha.is/saans";
  inputs.saans.flake = false;
  inputs.symbolset.url = "git+ssh://git.rocha.is/symbolset";
  inputs.symbolset.flake = false;
  inputs.untitled-sans.url = "git+ssh://git.rocha.is/untitled-sans";
  inputs.untitled-sans.flake = false;
  inputs.upton.url = "git+ssh://git.rocha.is/upton";
  inputs.upton.flake = false;

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }: let
    lib = nixpkgs.lib;

    x86_64-linux = "x86_64-linux";
    x86_64-darwin = "x86_64-darwin";
    aarch64-darwin = "aarch64-darwin";

    mkSystem = {
      hostname,
      system ? x86_64-linux,
      default ? false,
    }:
      {
        nixosConfigurations."${hostname}" = lib.nixosSystem {
          inherit system;
          modules = [
            {
              nixpkgs.overlays = [
                (self: super: {
                  # Enable CUDA/Optix in Blender
                  blender = super.blender.override {cudaSupport = true;};
                })
              ];
            }
            ({
              pkgs,
              modulesPath,
              ...
            }: {
              system.configurationRevision = lib.mkIf (self ? rev) self.rev;
            })
            (import ./modules/nixos hostname)
          ];
        };

        homeManagerConfigurations."christian@${hostname}" =
          import ./modules/home
          {
            pkgs = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
            inherit system home-manager hostname inputs;
          };
      }
      // (
        let
          target =
            if default
            then "default"
            else "christian@${hostname}";
        in {
          packages."${system}"."${target}" = self.homeManagerConfigurations."christian@${hostname}".activationPackage;
        }
      );
  in
    lib.foldr lib.recursiveUpdate {} (map mkSystem [
      {
        hostname = "whitenoise";
        system = x86_64-linux;
        default = true;
      }
      {
        hostname = "athena";
        system = x86_64-linux;
      }
      {
        hostname = "headless";
        system = x86_64-linux;
      }
      {
        hostname = "thunderclap";
        system = x86_64-darwin;
        default = true;
      }
      {
        hostname = "meowmachine";
        system = aarch64-darwin;
        default = true;
      }
    ]);
}
