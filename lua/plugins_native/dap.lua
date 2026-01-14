return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jbyuki/one-small-step-for-vimkind",
			"nicholasmata/nvim-dap-cs",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.5 },
							{ id = "repl", size = 0.5 },
						},
						position = "bottom",
						size = 10,
					},
				},
				controls = {
					enabled = true,
					element = "repl",
				},
			})
			require("dap-cs").setup()

			--- @diagnostic disable-next-line: missing-fields
			require("nvim-dap-virtual-text").setup({
				-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})
			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}

			dap.adapters.nlua = function(callback, config)
				callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
			end

			-- Handled by nvim-dap-go
			-- dap.adapters.go = {
			--   type = "server",
			--   port = "${port}",
			--   executable = {
			--     command = "dlv",
			--     args = { "dap", "-l", "127.0.0.1:${port}" },
			--   },
			-- }

			-- local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
			-- if elixir_ls_debugger ~= "" then
			-- 	dap.adapters.mix_task = {
			-- 		type = "executable",
			-- 		command = elixir_ls_debugger,
			-- 	}
			--
			-- 	dap.configurations.elixir = {
			-- 		{
			-- 			type = "mix_task",
			-- 			name = "phoenix server",
			-- 			task = "phx.server",
			-- 			request = "launch",
			-- 			projectDir = "${workspaceFolder}",
			-- 			exitAfterTaskReturns = false,
			-- 			debugAutoInterpretAllModules = false,
			-- 		},
			-- 	}
			-- end

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
