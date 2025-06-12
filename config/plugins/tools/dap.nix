{
	pkgs,
	...
}:
{
  plugins = {
    dap-virtual-text = {
      enable = true;
      settings = {
        commented = true; # Show virtual text alongside comment
      };
    };

    dap = {
      enable = true;
			adapters = {
				executables.php = {
					command = "${pkgs.nodejs}/bin/node";
					args = [
						"${pkgs.vscode-extensions.xdebug.php-debug}/share/vscode/extensions/xdebug.php-debug/out/phpDebug.js"
					];
				};
			};

			luaConfig.post = ''
				local dap = require('dap')
				dap.configurations.php = {
					{
						type = "php",
            request = "launch",
            name = "Listen for Xdebug (Docker)",
						log = true,
						port = 9003,
            pathMappings = {
							["/var/www/html"] = vim.fn.getcwd() .. "/html/",
            },
					},
				}



			'';

      signs = {
        dapBreakpoint = {
          text = " ";
          texthl = "DiagnosticSignError";
        };
        dapBreakpointCondition = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapBreakpointRejected = {
          text = " ";
          texthl = "DiagnosticError";
        };
        dapLogPoint = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapStopped = {
          text = "󰁕 ";
          texthl = "DiagnosticWarn";
          linehl = "DapStoppedLine";
          numhl = "DapStoppedLine";
        };
      };
    };

    dap-ui = {
      enable = true;
      settings = { };
    };
  };

  keymaps = [
    # Toggle breakpoint
    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
      options = {
        silent = true;
        desc = "Toggle breakpoint";
      };
    }
    # Continue / Start
    {
      mode = "n";
      key = "<leader>dc";
      action = "<cmd>lua require('dap').continue()<CR>";
      options = {
        silent = true;
        desc = "Start/Continue debugging";
      };
    }
    # Step Over
    {
      mode = "n";
      key = "<leader>do";
      action = "<cmd>lua require('dap').step_over()<CR>";
      options = {
        silent = true;
        desc = "Step over";
      };
    }
    # Step Into
    {
      mode = "n";
      key = "<leader>di";
      action = "<cmd>lua require('dap').step_into()<CR>";
      options = {
        silent = true;
        desc = "Step into";
      };
    }
    # Step Out
    {
      mode = "n";
      key = "<leader>dO";
      action = "<cmd>lua require('dap').step_out()<CR>";
      options = {
        silent = true;
        desc = "Step out";
      };
    }
    # Terminate debugging
    {
      mode = "n";
      key = "<leader>dq";
      action = "<cmd>lua require('dap').terminate()<CR>";
      options = {
        silent = true;
        desc = "Terminate debugging";
      };
    }
    # Toggle DAP UI
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>lua require('dapui').toggle()<CR>";
      options = {
        silent = true;
        desc = "Toggle debug UI";
      };
    }
  ];

  plugins.lualine = {
    settings = {
      options = {
        ignore_focus = [
          "dapui_scopes"
          "dapui_breakpoints"
          "dapui_stacks"
          "dapui_watches"
          "dap-repl"
          "dapui_console"
        ];
      };
    };
  };

  # Lua automation for the UI
  extraConfigLua = ''
    local dap = require('dap')
    local dapui = require('dapui')

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

		do
			function _G.open_dynamic_eval()
				local dap = require('dap')
				local width = math.floor(vim.o.columns * 0.6)
				local height = math.floor(vim.o.lines * 0.3)
				require('dapui').eval(nil, {
						width = width,
						height = height,
						enter = true,
						position = "center",
						})
			end

			vim.api.nvim_set_keymap('n', '<C-k>', [[<Cmd>lua _G.open_dynamic_eval()<CR>]], { noremap = true, silent = true })
		end

  '';

}
