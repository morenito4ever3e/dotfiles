pkgs:
let
  isDarwin =
    pkgs.stdenv.isDarwin;

  fontFamily =
    if isDarwin then "SF Mono"
    else "JetBrains Mono";
in
{

  enable = true;

  settings = {
    window = {
      padding = {
        x = 10;
        y = 16;
        decorations = "buttonless";
      };
    };

    font = {
      normal = {
        family = fontFamily;
        style = "Light";
      };
      bold = {
        family = fontFamily;
        style = "Bold";
      };
      italic = {
        family = fontFamily;
        style = "Bold Italic";
      };
      bold_italic = {
        family = fontFamily;
        style = "Bold Italic";
      };
      size = 12.0;
      offset = {
        x = 1;
        y = 3;
      };
      glyph_offset = {
        x = 0;
        y = 3;
        use_thin_strokes = true;
      };
    };

    colors = {
      primary = {
        foreground = "#dddddd";
        background = "#171717";
      };
      normal = {
        black = "#000000";
        red = "#c73b1d";
        green = "#00a800";
        yellow = "#acaf15";
        blue = "#3854fc";
        magenta = "#d533ce";
        cyan = "#2cbac9";
        white = "#bfbfbf";
      };
      bright = {
        black = "#4d4d4d";
        red = "#e82100";
        green = "#00db00";
        yellow = "#e5e900";
        blue = "#566BF9";
        magenta = "#e83ae9";
        cyan = "#00e6e7";
        white = "#e6e6e6";
      };
    };

    # Setup alt key bindings on macOS
    key_bindings = if !isDarwin then [ ] else [
      { key = "A"; mods = "Alt"; chars = "\\x1bal"; }
      { key = "B"; mods = "Alt"; chars = "\\x1bb"; }
      { key = "C"; mods = "Alt"; chars = "\\x1bc"; }
      { key = "D"; mods = "Alt"; chars = "\\x1bd"; }
      { key = "E"; mods = "Alt"; chars = "\\x1be"; }
      { key = "F"; mods = "Alt"; chars = "\\x1bf"; }
      { key = "G"; mods = "Alt"; chars = "\\x1bg"; }
      { key = "H"; mods = "Alt"; chars = "\\x1bh"; }
      { key = "I"; mods = "Alt"; chars = "\\x1bi"; }
      { key = "J"; mods = "Alt"; chars = "\\x1bj"; }
      { key = "K"; mods = "Alt"; chars = "\\x1bk"; }
      { key = "L"; mods = "Alt"; chars = "\\x1bl"; }
      { key = "M"; mods = "Alt"; chars = "\\x1bm"; }
      { key = "N"; mods = "Alt"; chars = "\\x1bn"; }
      { key = "O"; mods = "Alt"; chars = "\\x1bo"; }
      { key = "P"; mods = "Alt"; chars = "\\x1bp"; }
      { key = "Q"; mods = "Alt"; chars = "\\x1bq"; }
      { key = "R"; mods = "Alt"; chars = "\\x1br"; }
      { key = "S"; mods = "Alt"; chars = "\\x1bs"; }
      { key = "T"; mods = "Alt"; chars = "\\x1bt"; }
      { key = "U"; mods = "Alt"; chars = "\\x1bu"; }
      { key = "V"; mods = "Alt"; chars = "\\x1bv"; }
      { key = "W"; mods = "Alt"; chars = "\\x1bw"; }
      { key = "X"; mods = "Alt"; chars = "\\x1bx"; }
      { key = "Y"; mods = "Alt"; chars = "\\x1by"; }
      { key = "Z"; mods = "Alt"; chars = "\\x1bz"; }
      { key = "A"; mods = "Alt|Shift"; chars = "\\x1bA"; }
      { key = "B"; mods = "Alt|Shift"; chars = "\\x1bB"; }
      { key = "C"; mods = "Alt|Shift"; chars = "\\x1bC"; }
      { key = "D"; mods = "Alt|Shift"; chars = "\\x1bD"; }
      { key = "E"; mods = "Alt|Shift"; chars = "\\x1bE"; }
      { key = "F"; mods = "Alt|Shift"; chars = "\\x1bF"; }
      { key = "G"; mods = "Alt|Shift"; chars = "\\x1bG"; }
      { key = "H"; mods = "Alt|Shift"; chars = "\\x1bH"; }
      { key = "I"; mods = "Alt|Shift"; chars = "\\x1bI"; }
      { key = "J"; mods = "Alt|Shift"; chars = "\\x1bJ"; }
      { key = "K"; mods = "Alt|Shift"; chars = "\\x1bK"; }
      { key = "L"; mods = "Alt|Shift"; chars = "\\x1bL"; }
      { key = "M"; mods = "Alt|Shift"; chars = "\\x1bM"; }
      { key = "N"; mods = "Alt|Shift"; chars = "\\x1bN"; }
      { key = "O"; mods = "Alt|Shift"; chars = "\\x1bO"; }
      { key = "P"; mods = "Alt|Shift"; chars = "\\x1bP"; }
      { key = "Q"; mods = "Alt|Shift"; chars = "\\x1bQ"; }
      { key = "R"; mods = "Alt|Shift"; chars = "\\x1bR"; }
      { key = "S"; mods = "Alt|Shift"; chars = "\\x1bS"; }
      { key = "T"; mods = "Alt|Shift"; chars = "\\x1bT"; }
      { key = "U"; mods = "Alt|Shift"; chars = "\\x1bU"; }
      { key = "V"; mods = "Alt|Shift"; chars = "\\x1bV"; }
      { key = "W"; mods = "Alt|Shift"; chars = "\\x1bW"; }
      { key = "X"; mods = "Alt|Shift"; chars = "\\x1bX"; }
      { key = "Y"; mods = "Alt|Shift"; chars = "\\x1bY"; }
      { key = "Z"; mods = "Alt|Shift"; chars = "\\x1bZ"; }
      { key = "Key1"; mods = "Alt"; chars = "\\x1b1"; }
      { key = "Key2"; mods = "Alt"; chars = "\\x1b2"; }
      { key = "Key3"; mods = "Alt"; chars = "\\x1b3"; }
      { key = "Key4"; mods = "Alt"; chars = "\\x1b4"; }
      { key = "Key5"; mods = "Alt"; chars = "\\x1b5"; }
      { key = "Key6"; mods = "Alt"; chars = "\\x1b6"; }
      { key = "Key7"; mods = "Alt"; chars = "\\x1b7"; }
      { key = "Key8"; mods = "Alt"; chars = "\\x1b8"; }
      { key = "Key9"; mods = "Alt"; chars = "\\x1b9"; }
      { key = "Key0"; mods = "Alt"; chars = "\\x1b0"; }
      { key = "Space"; mods = "Control"; chars = "\\x00"; } # Ctrl + Space
      { key = "Grave"; mods = "Alt"; chars = "\\x1b`"; } # Alt + `
      { key = "Grave"; mods = "Alt|Shift"; chars = "\\x1b~"; } # Alt + ~
      { key = "Period"; mods = "Alt"; chars = "\\x1b."; } # Alt + .
      { key = "Key8"; mods = "Alt|Shift"; chars = "\\x1b*"; } # Alt + *
      { key = "Key3"; mods = "Alt|Shift"; chars = "\\x1b#"; } # Alt + #
      { key = "Period"; mods = "Alt|Shift"; chars = "\\x1b>"; } # Alt + >
      { key = "Comma"; mods = "Alt|Shift"; chars = "\\x1b<"; } # Alt + <
      { key = "Minus"; mods = "Alt|Shift"; chars = "\\x1b_"; } # Alt + _
      { key = "Key5"; mods = "Alt|Shift"; chars = "\\x1b%"; } # Alt + %
      { key = "Key6"; mods = "Alt|Shift"; chars = "\\x1b^"; } # Alt + ^
      { key = "Backslash"; mods = "Alt"; chars = "\\x1b\\x1b5c"; } # Alt + Backslash
      { key = "Backslash"; mods = "Alt|Shift"; chars = "\\x1b|"; } # Alt + |
      { key = "LBracket"; mods = "Alt"; chars = "\\x1b["; } # Alt + [
      { key = "RBracket"; mods = "Alt"; chars = "\\x1b]"; } # Alt + ]
      { key = "LBracket"; mods = "Alt|Shift"; chars = "\\x1b{"; } # Alt + {
      { key = "RBracket"; mods = "Alt|Shift"; chars = "\\x1b}"; } # Alt + }
    ];

  };

}
