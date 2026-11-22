-- nvim-treesitter (main branch) + nvim-treesitter-textobjects (main branch)
-- Requires the `tree-sitter` CLI (brew install tree-sitter-cli) and a C compiler.
local parsers = {
  "lua", "typescript", "tsx", "javascript",
  "go", "gomod", "gosum",
  "python",
  "rust",
  "json", "yaml", "toml",
  "html", "css",
  "markdown", "markdown_inline",
  "bash",
  "sql",
  "dockerfile",
  "terraform", "hcl",
  "helm",
  "graphql",
  "regex",
  "vimdoc",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- main branch does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang or not vim.treesitter.language.add(lang) then
            return
          end
          vim.treesitter.start(args.buf, lang)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- Incremental selection: Neovim 0.12 provides `an` (expand) / `in` (shrink) in visual mode.
      vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "Start node selection" })
      vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "Expand node selection" })
      vim.keymap.set("x", "<BS>", "in", { remap = true, desc = "Shrink node selection" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      local select = require("nvim-treesitter-textobjects.select")
      for lhs, query in pairs({
        af = "@function.outer",
        ["if"] = "@function.inner",
        ac = "@class.outer",
        ic = "@class.inner",
        aa = "@parameter.outer",
        ia = "@parameter.inner",
      }) do
        vim.keymap.set({ "x", "o" }, lhs, function()
          select.select_textobject(query, "textobjects")
        end, { desc = "Select " .. query })
      end

      local move = require("nvim-treesitter-textobjects.move")
      local function map_move(lhs, fn, query)
        vim.keymap.set({ "n", "x", "o" }, lhs, function()
          fn(query, "textobjects")
        end, { desc = "Move to " .. query })
      end
      map_move("]f", move.goto_next_start, "@function.outer")
      map_move("[f", move.goto_previous_start, "@function.outer")
      -- ]c / [c are kept for diff navigation; classes use ]] / [[
      map_move("]]", move.goto_next_start, "@class.outer")
      map_move("[[", move.goto_previous_start, "@class.outer")
    end,
  },
}
