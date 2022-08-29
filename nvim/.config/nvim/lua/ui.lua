require('nvim-web-devicons').setup {
    default = true,
}

require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  -- update_to_buf_dir   = {
  --   enable = true,
  --   auto_open = true,
  -- },
  renderer = {
    icons = {
      webdev_colors = false,
    }
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    -- auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

vim.g.vscode_style = "dark"
vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_style = false
vim.g.tokyonight_italic_keywords = false
-- vim.g.gruvbox_material_enable_italic = true

require('lualine').setup {
  options = {
    -- theme = 'vscode',
    -- theme = 'gruvbox-material',
    theme = 'tokyonight',
    icons_enabled = true,
    -- component_separators = { left = '\\', right = '/'},
    component_separators = { left = '||', right = '|'},
    -- Those separators only work on gnome-terminal so far.
    -- section_separators = {left = '◣', right = '◢'},
    section_separators = {left = '', right = ''},
  }
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = true,
})

require('indent_blankline').setup {
  show_current_context = false,
  show_current_context_start = false,
}

-- highlight NvimTreeFolderIcon guibg=blue
-- colorscheme gruvbox-material
vim.cmd [[
  colorscheme tokyonight
]]
