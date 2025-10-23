return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
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
			},
			extensions = { "neo-tree" },
		},
	},
}
