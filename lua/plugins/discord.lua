local should_enable = true
local os_name = vim.loop.os_uname().sysname
if os_name == 'Linux' or os_name:match 'BSD$' then
	should_enable = false
end
return {
	"vyfor/cord.nvim",
	branch = "client-server",
	build = ":Cord update",
	enabled = should_enable,
	opts = {
		display = {
			swap_fields = true,
		},
	}, -- calls require('cord').setup()
}
