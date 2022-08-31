let
  note = name: "\n\n# --- ${name} ---\n\n";
in
pkgs: {
  enable = true;
  enableCompletion = true;
  historyControl = [ "ignoredups" "erasedups" ];
  historyIgnore = [ "ls" "cd" "exit" ];
  sessionVariables = {
    PROMPT_DIRTRIM = "2";
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS"; # necessary for completion
    GIT_PS1_SHOWDIRTYSTATE = "true";
    GIT_PS1_SHOWUNTRACKEDFILES = "true";
    GIT_PS1_SHOWSTASHSTATE = "true";
  };
  shellOptions = [ "histappend" ];
  shellAliases = { };
  initExtra =
    note "git-prompt" +
    "source ${pkgs.git}/share/git/contrib/completion/git-prompt.sh" +
    note ".bashrc" +
    builtins.readFile ./bashrc +
    note "end extra";
}
