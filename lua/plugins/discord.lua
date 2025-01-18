return {
	"vyfor/cord.nvim",
	branch = "client-server",
	build = ":Cord update",
	opts = {
		display = {
			swap_fields = true,
		},
	}, -- calls require('cord').setup()
}
