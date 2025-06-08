{ config, lib, ... }:
{
  plugins.snacks = {
    settings = {
      lazygit.enabled = true;
    };
  };

  keymaps = lib.mkIf config.plugins.snacks.settings.lazygit.enabled [
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>lua Snacks.lazygit()<CR>";
      options.desc = "Open lazygit";
    }
  ];
}
