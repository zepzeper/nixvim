{
  plugins.dashboard = {
    enable = true;
    settings = {
      change_to_vcs_root = true;
      config = {
        packages.enable = false;
        footer = [
          ""
          "Welcome back ☕! Zepzeper 🥱"
          ""
        ];
        mru.limit = 5;
        week_header.enable = true;
        project.enable = true;
        shortcut = [
          {
            action.__raw = "function() Snacks.picker.files() end";
            desc = "󰱼 Files";
            group = "Label";
            key = "f";
          }
          {
            action.__raw = "function() Snacks.picker.recent() end";
            desc = "󱦠 Recent Files";
            group = "Label";
            key = "r";
          }
          {
            action = "quitall!";
            desc = "󰈆 Quit";
            group = "Label";
            key = "q";
          }
        ];
      };
      theme = "hyper";
    };
  };

  plugins.lualine = {
    settings = {
      options = {
        disabled_filetypes = [
          "dashboard"
        ];
      };
    };
  };
}
