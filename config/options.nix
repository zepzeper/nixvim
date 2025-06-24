{
  opts = {
    # Cursor settings
    guicursor = "";
    
    # Line numbers
    relativenumber = true; # show relative line numbers
    number = true;         # shows absolute line number on cursor line (when relative number is on)
    
    # Tabs & indentation
    tabstop = 4;       # 2 spaces for tabs (prettier default)
    shiftwidth = 4;    # 2 spaces for indent width
    expandtab = false;  # expand tab to spaces
    autoindent = true; # copy indent from current line when starting new one
    
    # Line wrapping
    wrap = false; # disable line wrapping
    
    # Search settings
    ignorecase = true; # ignore case when searching
    smartcase = true;  # if you include mixed case in your search, assumes you want case-sensitive
    
    # Appearance
    cursorline = true; # highlight the current cursor line
    termguicolors = true;
    background = "dark"; # colorschemes that can be light or dark will be made dark
    signcolumn = "yes";  # show sign column so that text doesn't shift
    
    # Backspace
    backspace = "indent,eol,start"; # allow backspace on indent, end of line or insert mode start position
    
    # Split windows
    splitright = true; # split vertical window to the right
    splitbelow = true; # split horizontal window to the bottom
  };

  globals = {
    #Netrw list
    neovide_hide_mouse_when_typing = true;
  };

  clipboard = {
    register = "unnamedplus";
  };
}
