return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = function()
			-- Custom component to show active LSP clients
			local function lsp_clients()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if next(clients) == nil then
					return ""
				end

				local client_names = {}
				for _, client in pairs(clients) do
					-- Filter out GitHub Copilot
					if client.name ~= "GitHub Copilot" then
						table.insert(client_names, client.name)
					end
				end

				if #client_names == 0 then
					return ""
				end

				return table.concat(client_names, ", ")
			end

			-- Custom component to show active formatters
			local function formatters()
				local conform = require("conform")
				local formatters_list = conform.list_formatters(0)

				if #formatters_list == 0 then
					return ""
				end

				local formatter_names = {}
				for _, formatter in ipairs(formatters_list) do
					if formatter.available then
						table.insert(formatter_names, formatter.name)
					end
				end

				if #formatter_names == 0 then
					return ""
				end

				return table.concat(formatter_names, ", ")
			end

			-- Custom component to show active linters
			local function linters()
				-- Since you're using LSP for diagnostics, we can show diagnostic sources
				local diagnostics = vim.diagnostic.get(0)
				local sources = {}
				local seen = {}

				for _, diagnostic in ipairs(diagnostics) do
					if diagnostic.source and not seen[diagnostic.source] then
						seen[diagnostic.source] = true
						table.insert(sources, diagnostic.source)
					end
				end

				if #sources == 0 then
					return ""
				end

				return table.concat(sources, ", ")
			end

			return {
				sections = {
					lualine_c = {
						{
							"filename",
							file_status = true,
							newfile_status = true,
							path = 1,
							shorting_target = 40,
							symbols = {
								modified = "[+]",
								readonly = "[RO]",
								unnamed = "[No Name]",
								newfile = "[New]",
							},
						},
					},
					lualine_x = {
						{
							lsp_clients,
							icon = "󰒋",
							color = { fg = "#7aa2f7" },
							cond = function()
								return lsp_clients() ~= ""
							end,
						},
						{
							formatters,
							icon = "󰉼",
							color = { fg = "#9ece6a" },
							cond = function()
								return formatters() ~= ""
							end,
						},
						{
							linters,
							icon = "󰦕",
							color = { fg = "#f7768e" },
							cond = function()
								return linters() ~= ""
							end,
						},
						"encoding",
						"fileformat",
						"filetype",
					},
				},
				extensions = { "neo-tree" },
			}
		end,
	},
}
