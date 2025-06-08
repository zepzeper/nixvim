{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  extraPackages = lib.mkIf config.plugins.blink-cmp.enable (
    with pkgs;
    [
      gh
      wordnet
    ]
  );

  plugins = lib.mkMerge [
    {
      blink-cmp = {
        enable = true;
        package = inputs.blink-cmp.packages.${pkgs.system}.default;

        settings = {
          completion = {
            accept.auto_brackets.enabled = true;
            ghost_text.enabled = true;
            documentation = {
              auto_show = true;
              window.border = "rounded";
            };
            list.selection.preselect = false;
            menu = {
              border = "rounded";
              draw = {
                columns = [
                  { __unkeyed-1 = "label"; }
                  {
                    __unkeyed-1 = "kind_icon";
                    __unkeyed-2 = "kind";
                    gap = 1;
                  }
                  { __unkeyed-1 = "source_name"; }
                ];
                components.kind_icon = {
                  ellipsis = false;
                  text.__raw = ''
                    function(ctx)
                      -- Use only blink's kind icons without mini fallback
                      return require('blink.cmp.config').appearance.kind_icons[ctx.kind] or ""
                    end
                  '';
                };
              };
            };
          };
          fuzzy = {
            implementation = "rust";
            prebuilt_binaries.download = false;
          };
          appearance = {
            use_nvim_cmp_as_default = true;
          };
          keymap = {
            preset = "enter";
            "<C-Up>" = [
              "snippet_forward"
              "fallback"
            ];
            "<C-Down>" = [
              "snippet_backward"
              "fallback"
            ];
            "<Tab>" = [
              "select_next"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "fallback"
            ];
          };
          signature = {
            enabled = true;
            window.border = "rounded";
          };
          snippets.preset = "luasnip";
          sources = {
            default =
              [
                "buffer"
                "calc"
                "dictionary"
                "emoji"
                "git"
                "lsp"
                "path"
                "snippets"
                "spell"
              ]
              ++ lib.optionals config.plugins.avante.enable [
                "avante_commands"
                "avante_files"
                "avante_mentions"
              ];

            providers =
              {
                lsp.score_offset = 4;

                buffer.opts.get_bufnrs.__raw = ''
                  function()
                    return vim.tbl_filter(function(bufnr)
                      return vim.bo[bufnr].buftype == ""
                    end, vim.api.nvim_list_bufs())
                  end
                '';


                dictionary = {
                  name = "Dict";
                  module = "blink-cmp-dictionary";
                  min_keyword_length = 3;
                };

                emoji = {
                  name = "Emoji";
                  module = "blink-emoji";
                  score_offset = 1;
                };

                git = {
                  name = "Git";
                  module = "blink-cmp-git";
                  enabled = true;
                  score_offset = 100;
                  should_show_items.__raw = ''
                    function()
                      return vim.o.filetype == 'gitcommit' or vim.o.filetype == 'markdown'
                    end
                  '';
                  opts.git_centers.github.issue.on_error.__raw = ''
                    function(_, _)
                      return true
                    end
                  '';
                };

                spell = {
                  name = "Spell";
                  module = "blink-cmp-spell";
                  score_offset = 1;
                };
              }
              // lib.optionalAttrs config.plugins.blink-compat.enable {
                calc = {
                  name = "calc";
                  module = "blink.compat.source";
                  score_offset = 2;
                };
              }
              // lib.optionalAttrs (config.plugins.avante.enable && config.plugins.blink-compat.enable) {
                avante_commands = {
                  name = "avante_commands";
                  module = "blink.compat.source";
                  score_offset = 90;
                };
                avante_files = {
                  name = "avante_files";
                  module = "blink.compat.source";
                  score_offset = 100;
                };
                avante_mentions = {
                  name = "avante_mentions";
                  module = "blink.compat.source";
                  score_offset = 1000;
                };
              };
          };
        };
      };

      blink-cmp-dictionary.enable = true;
      blink-cmp-git.enable = true;
      blink-cmp-spell.enable = true;
      blink-emoji.enable = true;
      blink-compat.enable = true;
    }

    (lib.mkIf config.plugins.blink-cmp.enable {
      cmp-calc.enable = true;
    })
  ];
}
