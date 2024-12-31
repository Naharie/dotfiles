{ pkgs
, ...
}:

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

      editor.linkedEditing = true;
      editor.tabSize = 4;
      editor.indentSize = "tabSize";

      javascript.updateImportsOnFileMove.enabled = "always";
      typescript.updateImportsOnFileMove.enabled = "always";
    };

    extensions = with pkgs; [
      vscode-extensions.aaron-bond.better-comments
      vscode-extensions.streetsidesoftware.code-spell-checker
      vscode-extensions.moshfeu.compare-folders
      vscode-extensions.bradlc.vscode-tailwindcss
      vscode-extensions.tal7aouy.icons
      vscode-extensions.rust-lang.rust-analyzer
      vscode-extensions.yoavbls.pretty-ts-errors
      vscode-extensions.jnoortheen.nix-ide
      #vscode-extensions.geequlim.godot-tools
      vscode-extensions.tamasfe.even-better-toml
      vscode-extensions.mikestead.dotenv
    ];
  };
}
