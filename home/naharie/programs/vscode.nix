{ pkgs
, system
, inputs
, ...
}:


let

extensions = inputs.nix-vscode-extensions.extensions.${system};

in

{
  programs.vscode = {
    enable = true;

    userSettings = {
      workbench.iconTheme = "vscode-icons";
      workbench.colorTheme = "Default Dark+";

      git.confirmSync = false;
      git.autofetch = true;
      git.enableSmartCommit = true;

      nix.enableLanguageServer = true;
      nix.serverPath = "${pkgs.nil}/bin/nil";
      nix.formatterPath = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";

      "[nix]" = {
        editor.defaultFormatter = "jnoortheen.nix-ide";
      };

      editor.linkedEditing = true;
      editor.tabSize = 4;
      editor.indentSize = "tabSize";

      javascript.updateImportsOnFileMove.enabled = "always";
      typescript.updateImportsOnFileMove.enabled = "always";
    };

    extensions = with extensions.vscode-marketplace; [
      # General
      aaron-bond.better-comments
      streetsidesoftware.code-spell-checker
      moshfeu.compare-folders
      tal7aouy.icons
      mikestead.dotenv
      github.remotehub

      # Godot
      geequlim.godot-tools

      # Web Dev
      yoavbls.pretty-ts-errors
      bradlc.vscode-tailwindcss

      # Rust
      rust-lang.rust-analyzer
      tamasfe.even-better-toml

      # Nix
      jnoortheen.nix-ide
      brettm12345.nixfmt-vscode
      jeff-hykin.better-nix-syntax
      christian-kohler.path-intellisense
    ];
  };
}
