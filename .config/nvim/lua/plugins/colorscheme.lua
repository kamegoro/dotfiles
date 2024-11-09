-- tokyonightの設定
require("tokyonight").setup({
  style = "night",  -- "storm" または "day" も選べます
  light_style = "day",  -- 明るいテーマの場合
  transparent = true,  -- 背景を透明にする
  terminal_colors = true,  -- 端末でも色を適用
  styles = {
    comments = { italic = true },  -- コメントをイタリック体に
    functions = { bold = true },   -- 関数名を太字に
    keywords = { italic = true },  -- キーワードをイタリック体に
    strings = { bold = true },     -- 文字列を太字に
    variables = { italic = false }, -- 変数名をイタリック体にしない
  },
  sidebars = { "qf", "help", "vista_kind", "terminal", "packer" }, -- サイドバー用
  hide_inactive_statusline = false, -- 非アクティブ時にステータスラインを隠さない
  dim_inactive = true, -- 非アクティブウィンドウを暗くする
  lualine_bold = true, -- lualineでの太字設定
})

vim.cmd([[colorscheme tokyonight]])