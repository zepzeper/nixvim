{
  plugins = {
    lualine = {
      enable = true;
      settings = {
        options = {
          section_separators = {
						left = "";
						right = "";
          };
          component_separators = {
            left = "";
            right = "";
          };
          disabled_filetypes = [
            "dapui_watches"
            "dapui_breakpoints"
            "dapui_scopes"
            "dapui_console"
            "dapui_stacks"
            "dap-repl"
            "Avante"
            "AvanteInput"
            "AvanteSelectedFiles"
          ];
        };
        sections = {
          lualine_a = [
            {
              __unkeyed-1 = "mode";
              separator = {
                left = "";
              };
              right_padding = 2;
            }
          ];
          lualine_b = [
            "branch"
            "diff"
            "diagnostics"
          ];
          lualine_c = [
            "filename"
          ];
          lualine_x = [
            "encoding"
            "fileformat"
            "filetype"
          ];
          lualine_y = [
            "progress"
          ];
          lualine_z = [
            {
              __unkeyed-1 = "location";
              separator = {
                right = "";
              };
              left_padding = 2;
            }
          ];
        };
      };
    };
    
    # Required dependencies
    web-devicons = {
      enable = true;
    };
  };
}
