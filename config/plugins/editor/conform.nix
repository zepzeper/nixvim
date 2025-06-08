{ pkgs, lib, ... }:
{
	plugins.conform-nvim = {
		enable = true;
		settings = {
			# format_on_save = ''
			#   function(bufnr)
			#     -- Disable with a global or buffer-local variable
			#     if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			#       return
			#     end
			#     return { timeout_ms = 500, lsp_format = 'fallback' }
			#   end
			# '';
			notify_on_error = true;
			formatters_by_ft = {
				# Web technologies
				html = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};
				css = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};
				scss = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};
				javascript = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};
				typescript = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};
				javascriptreact = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};
				typescriptreact = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};
				json = [ "jq" ];
				yaml = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};

				# Programming languages
				lua = [ "stylua" ];
				python = [ "isort" "black" ];
				go = [ "goimports" "gofmt" ];
				rust = [ "rustfmt" ];
				php = [ "php_cs_fixer" ];
				c = [ "clang_format" ];
				cpp = [ "clang_format" ];
				java = [ "google_java_format" ];

				# System/Config
				nix = [ "nixfmt-rfc-style" ];
				bash = [
					"shellcheck"
						"shellharden"
						"shfmt"
				];
				sh = [
					"shellcheck"
						"shellharden"
						"shfmt"
				];
				zsh = [
					"shellcheck"
						"shellharden"
						"shfmt"
				];

				# Documentation
				markdown = {
					__unkeyed-1 = "prettierd";
					__unkeyed-2 = "prettier";
					stop_after_first = true;
				};

				# Formatter for all filetypes
				"_" = [ "trim_whitespace" ];
			};
			formatters = {
				# Existing formatters
				black = {
					command = "${lib.getExe pkgs.black}";
				};
				isort = {
					command = "${lib.getExe pkgs.isort}";
				};
				nixfmt-rfc-style = {
					command = "${lib.getExe pkgs.nixfmt-rfc-style}";
				};
				jq = {
					command = "${lib.getExe pkgs.jq}";
				};
				prettierd = {
					command = "${lib.getExe pkgs.prettierd}";
				};
				stylua = {
					command = "${lib.getExe pkgs.stylua}";
				};
				shellcheck = {
					command = "${lib.getExe pkgs.shellcheck}";
				};
				shfmt = {
					command = "${lib.getExe pkgs.shfmt}";
				};
				shellharden = {
					command = "${lib.getExe pkgs.shellharden}";
				};

				# New formatters
				rustfmt = {
					command = "${lib.getExe pkgs.rustfmt}";
				};
				gofmt = {
					command = "${lib.getExe pkgs.go}/bin/gofmt";
				};
				goimports = {
					command = "${lib.getExe pkgs.gotools}/bin/goimports";
				};
				php_cs_fixer = {
					command = "${lib.getExe pkgs.php82Packages.php-cs-fixer}";
				};
				clang_format = {
					command = "${lib.getExe pkgs.clang-tools}";
				};
				google_java_format = {
					command = "${lib.getExe pkgs.google-java-format}";
				};
			};
		};
	};

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>mp";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
