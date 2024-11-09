require'nvim-tree'.setup {
  filters = {
    dotfiles = false,
  },
  view = {
    width = 30,
    side = 'left',
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = '',
          staged = '✓',
        },
      },
    },
  },
}
