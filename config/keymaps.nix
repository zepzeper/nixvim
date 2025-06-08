{
  globals.mapleader = " ";
  keymaps = [
    # Netrw
    {
      mode = "n";
      key = "<leader>pv";
      action = "<cmd>Ex<CR>";
    }
    {
      mode = "n";
      key = "<space><space>x";
      action = "<cmd>source %<CR>";
    }
    {
      mode = "n";
      key = "<space>x";
      action = ":.lua<CR>";
    }
    # Jumping pages keeps cursor in the middle
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
    }
    # Keep search terms in the middle of the screen
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Jump to next search term";
      };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Jump to previous search term";
      };
    }
    # When selected move up/down
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }
    # Replace under cursor in whole buffer
    {
      mode = "n";
      key = "<leader>s";
      action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
    }
    # Pastes copied buffer and keeps it in the register
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
    }
    # Toggle highlighting search
    {
      mode = "n";
      key = "<leader>;h";
      action = ":set hlsearch!<CR>";
      options = {
        desc = "Toggle highlighting search";
      };
    }

    # Tab management
    {
      mode = "n";
      key = "<leader>to";
      action = "<cmd>tabnew<CR>";
      options.desc = "Open new tab";
    }
    {
      mode = "n";
      key = "<leader>tx";
      action = "<cmd>tabclose<CR>";
      options.desc = "Close current tab";
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = "<cmd>tabn<CR>";
      options.desc = "Go to next tab";
    }
    {
      mode = "n";
      key = "<leader>tp";
      action = "<cmd>tabp<CR>";
      options.desc = "Go to previous tab";
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>tabnew %<CR>";
      options.desc = "Open current buffer in new tab";
    }

  ];

  # User commands for typos
  userCommands = {
    Wq = {
      command = "wq";
    };
    W = {
      command = "w";
    };
  };

  # Extra configuration for complex functions
  extraConfigLua = ''
    local del_qf_item = function()
      local items = vim.fn.getqflist()
      local line = vim.fn.line('.')
      table.remove(items, line)
      vim.fn.setqflist(items, "r")
      vim.api.nvim_win_set_cursor(0, { line, 0 })
    end
    
    -- Set up QF list keymaps (these need to be buffer-specific)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "qf",
      callback = function()
        vim.keymap.set("n", "dd", del_qf_item, { 
          silent = true, 
          buffer = true, 
          desc = "Remove entry from QF" 
        })
        vim.keymap.set("v", "D", del_qf_item, { 
          silent = true, 
          buffer = true, 
          desc = "Remove entry from QF" 
        })
      end,
    })
  '';
}
