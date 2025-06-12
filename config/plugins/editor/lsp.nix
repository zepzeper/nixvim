{
  self,
  pkgs,
  lib,
  ...
}:
{
  plugins = {
    # LSP-related plugins
    lsp-lines = {
      enable = false;
    };

    lsp-signature = {
      enable = false;
    };

    lsp-format = {
      enable = false;
    };

    # Main LSP configuration
    lsp = {
      enable = true;
      inlayHints = true;

      # Server configurations
      servers = {
        html = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        ts_ls = {
          enable = true;
        };
        rust_analyzer = {
          enable = true;
					installCargo = true;
					installRustc = true;
        };
        gopls = {
          enable = true;
        };
        phpactor = {
          enable = true;
					settings = {
						"composer.bin" = "${lib.getExe pkgs.php84Packages.composer}";
						"language_server_diagnostics.enabled" = true;
						"language_server_completion.enabled" = true;
						"language_server_completion.mode" = "local";
						"language_server_code_action.enabled" = true;
						"language_server_hover.enabled" = true;
						"language_server_signature_help.enabled" = true;
					};
        };
        jsonls = {
          enable = true;
        };
        dockerls = {
          enable = true;
        };

        nixd = {
          enable = true;
          settings =
            let
              flake = ''(builtins.getFlake "${self}")'';
              system = ''''${builtins.currentSystem}'';
            in
            {
              formatting = {
                command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
              };
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
              options = {
                nixvim.expr = ''${flake}.packages.${system}.nvim.options'';
                # Uncomment and modify these if you have NixOS or Darwin configurations
                # nix-darwin.expr = ''${flake}.darwinConfigurations.<hostname>.options'';
                # nixos.expr = ''${flake}.nixosConfigurations.<hostname>.options'';
                # home-manager.expr = ''${nixos.expr}.home-manager.users.type.getSubOptions [ ]'';
              };
            };
        };

        marksman = {
          enable = true;
        };
      };

      # LSP keymaps
			keymaps = {
				silent = true;
				lspBuf = {
					gd = {
						action = "definition";
						desc = "Show LSP definitions";
					};
					gR = {
						action = "references";
						desc = "Show LSP references";
					};
					gD = {
						action = "declaration";
						desc = "Go to declaration";
					};
					gi = {
						action = "implementation";
						desc = "Show LSP implementations";
					};
					gt = {
						action = "type_definition";
						desc = "Show LSP type definitions";
					};
					K = {
						action = "hover";
						desc = "Show documentation for what is under cursor";
					};
					"<leader>ca" = {
						action = "code_action";
						desc = "See available code actions";
					};
					"<leader>rn" = {
						action = "rename";
						desc = "Smart rename";
					};
					"<leader>cw" = {
						action = "workspace_symbol";
						desc = "Workspace Symbol";
					};
				};
				diagnostic = {
					"<leader>e" = {
						action = "open_float";
						desc = "Show line diagnostics";
					};
					"<leader>E" = {
						action = "setloclist";
						desc = "Show buffer diagnostics";
					};
					"[d" = {
						action = "goto_prev";
						desc = "Go to previous diagnostic";
					};
					"]d" = {
						action = "goto_next";
						desc = "Go to next diagnostic";
					};
				};
			};
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options.desc = "Lsp Info";
    }
    {
      mode = "n";
      key = "<leader>rs";
      action = "<cmd>LspRestart<cr>";
      options.desc = "Restart LSP";
    }
  ];
}
