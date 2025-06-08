{
	plugins.harpoon = {
		enable = true;
		enableTelescope = true;
		settings = {
			settings = {
				save_on_toggle = true;
			};
		};
	};

	keymaps = [
    # Add file to harpoon
    {
      mode = "n";
      key = "<leader>ha";
      action = "<cmd>lua require('harpoon'):list():add()<cr>";
      options.desc = "Harpoon add file";
    }
    
    # Toggle harpoon menu
    {
      mode = "n";
      key = "<C-e>";
      action = "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>";
      options.desc = "Harpoon toggle menu";
    }
    
    # Select harpoon files 1-5
    {
      mode = "n";
      key = "<leader>1";
      action = "<cmd>lua require('harpoon'):list():select(1)<cr>";
      options.desc = "Harpoon 1";
    }
    {
      mode = "n";
      key = "<leader>2";
      action = "<cmd>lua require('harpoon'):list():select(2)<cr>";
      options.desc = "Harpoon 2";
    }
    {
      mode = "n";
      key = "<leader>3";
      action = "<cmd>lua require('harpoon'):list():select(3)<cr>";
      options.desc = "Harpoon 3";
    }
    {
      mode = "n";
      key = "<leader>4";
      action = "<cmd>lua require('harpoon'):list():select(4)<cr>";
      options.desc = "Harpoon 4";
    }
    {
      mode = "n";
      key = "<leader>5";
      action = "<cmd>lua require('harpoon'):list():select(5)<cr>";
      options.desc = "Harpoon 5";
    }
  ];
}
