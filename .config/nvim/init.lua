local vscode = vim.g.vscode

-- Options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"

-- Keymaps
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

if vscode then
  local function vscode_action(cmd)
    return function()
      require("vscode").action(cmd)
    end
  end

  vim.keymap.set("n", "<Space>f", vscode_action("workbench.action.quickOpen"))
  vim.keymap.set("n", "<Space>g", vscode_action("workbench.action.findInFiles"))
  vim.keymap.set("n", "<Space>e", vscode_action("workbench.action.toggleSidebarVisibility"))
  vim.keymap.set("n", "gr", vscode_action("editor.action.goToReferences"))
  vim.keymap.set("n", "gd", vscode_action("editor.action.revealDefinition"))
  vim.keymap.set("n", "gi", vscode_action("editor.action.goToImplementation"))
  vim.keymap.set("n", "<Space>r", vscode_action("editor.action.rename"))
  vim.keymap.set("n", "<Space>a", vscode_action("editor.action.quickFix"))
  vim.keymap.set("n", "]d", vscode_action("editor.action.marker.next"))
  vim.keymap.set("n", "[d", vscode_action("editor.action.marker.prev"))
  vim.keymap.set("n", "<Space>b", vscode_action("workbench.action.toggleSidebarVisibility"))
else
  -- Standalone Neovim settings
  vim.opt.number = true
  vim.opt.cursorline = true
  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.smartindent = true
  vim.opt.termguicolors = true
  vim.opt.updatetime = 250
  vim.opt.swapfile = false
  vim.opt.backup = false
end
