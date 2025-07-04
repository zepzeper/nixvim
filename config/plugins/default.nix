{
  imports = [
    ./ui/rose-pine.nix
    ./ui/dashboard.nix
		./ui/lualine.nix
		./ui/web-devicons.nix

    ./editor/lsp.nix
    ./editor/conform.nix
    ./editor/blink.nix
    ./editor/auto-close.nix
    ./editor/treesitter

    ./tools/snacks
    ./tools/comment.nix
    ./tools/dap.nix
    ./tools/dadbodui.nix
    ./tools/gitsigns.nix
    ./tools/highlight-colors.nix
    ./tools/harpoon.nix
    ./tools/lazy.nix
		./tools/render-markdown.nix
    ./tools/telescope.nix
    ./tools/trouble.nix
		./tools/yazi.nix

    ./extras/extras.nix
  ];
}
