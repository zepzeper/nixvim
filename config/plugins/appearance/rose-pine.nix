# In ./ui/rose-pine.nix
{ config, lib, pkgs, ... }:
{
  colorschemes.rose-pine = {
    enable = true;
  };
  
  # Debug: This should show up in your neovim
  extraConfigLua = ''
    print("Rose Pine module loaded!")
  '';
}
