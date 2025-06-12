{
  plugins = {
    telescope = {
      enable = true;
			extensions = {
				ui-select.enable = true;
				advanced-git-search.enable = true;
				fzf-native.enable = true;
				live-grep-args.enable = true;
			};
      # highlightTheme = "Catppuccin Mocha";
      highlightTheme = "tokyonight";

      settings.defaults = {
        prompt_prefix = "   ";
        color_devicons = true;
        set_env.COLORTERM = "truecolor";
        file_ignore_patterns = [
          "^.git/"
          "^vendor/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "^aux/"
          "^.nvim/"
          "%.ipynb"
        ];

      };
    };
  };
  keymaps = [
    {
      key = "<C-p>";
      action = "<cmd>Telescope find_files<CR>";
      mode = "n";
      options.desc = "Fuzzy find files in cwd";
    }
    {
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<CR>";
      mode = "n";
      options.desc = "Fuzzy find recent files";
    }
    {
      key = "<leader>fs";
      action = "<cmd>Telescope live_grep<CR>";
      mode = "n";
      options.desc = "Find string in cwd";
    }
		# -----------------------------------------------------------------
		# Git Integration (from advanced-git-search.nvim)
		# -----------------------------------------------------------------
		# This plugin doesn't add keymaps by default, so here is a suggestion:
		{
			mode = "n";
			key = "\<leader>gf";
			action = "\<cmd>AdvancedGitSearch search_log_content_file\<cr>";
			options.desc = "Advanced Git Search (commits, files)";
			
		}
    {
      key = "<leader>fc";
      action = "<cmd>Telescope grep_string<CR>";
      mode = "n";
      options.desc = "Find string under cursor in cwd";
    }
  ];
}
