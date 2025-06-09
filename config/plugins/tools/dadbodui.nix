{
	plugins.vim-dadbod-completion.enable = true;
	plugins.vim-dadbod.enable = true;
	plugins.vim-dadbod-ui = {
		enable = true;
	};

  keymaps = [
    {
      mode = "n";
      key = "<leader>tu";
      action = ":DBUIToggle<CR>";
      options.desc = "Toggle database UI";
    }
    {
      mode = "n";
      key = "<leader>df";
      action = ":DBUIFindBuffer<CR>";
      options.desc = "Find database buffer";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = ":DBUIRenameBuffer<CR>";
      options.desc = "Rename database buffer";
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = ":DBUILastQueryInfo<CR>";
      options.desc = "Last query info";
    }
  ];
}
