require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  size = 15,
  direction = 'horizontal',
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function lazygit_toggle()
	lazygit:toggle()
end
