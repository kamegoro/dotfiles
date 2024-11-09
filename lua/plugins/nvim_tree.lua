require'nvim-tree'.setup {
  filters = {
    dotfiles = true,
  },
  view = {
    width = 30,  -- サイドバーの幅
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
        default = '',  -- デフォルトアイコン
        symlink = '',
        git = {
          unstaged = '',
          staged = '✓',
        },
      },
    },
  },
}
