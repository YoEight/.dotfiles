vim.g.mapleader = " "

local vimp = require('vimp')

-- telescope
local telescope = require('telescope.builtin')
vimp.nnoremap('<leader>ff', telescope.find_files)
vimp.nnoremap('<leader>fg', telescope.git_files)
vimp.nnoremap('<leader>fb', telescope.buffers)
vimp.nnoremap('<leader>fh', telescope.help_tags)
vimp.nnoremap('<leader>fcr', telescope.lsp_references)
vimp.nnoremap('<leader>fcs', telescope.lsp_dynamic_workspace_symbols)
vimp.nnoremap('<leader>fcd', telescope.lsp_workspace_diagnostics)
vimp.nnoremap('<leader>ft', telescope.treesitter)

-- CMP
local lspkind = require('lspkind')
local cmp = require('cmp')
cmp.setup({
    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    })
})

-- LSP
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    vimp.nnoremap({'silent'}, 'K', vim.lsp.buf.hover)
    vimp.nnoremap({'silent'}, 'gd', vim.lsp.buf.definition)
    vimp.nnoremap({'silent'}, '<leader>ca', vim.lsp.buf.code_action)
    vimp.nnoremap({'silent'}, '<leader>cr', vim.lsp.buf.rename)
    vimp.nnoremap({'silent'}, '<leader>F', vim.lsp.buf.formatting)

    -- require('virtualtypes').on_attach(client, bufnr)
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'rust_analyzer', 'gopls', 'jdtls' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

-- Java LSP
-- local utils = require('./utils')
-- local jar_opts = utils.tbl_join({
--         'java',
--         '-Declipse.application=org.eclipse.jdt.ls.core.id1 ',
--         '-Dosgi.bundles.defaultStartLevel=4 ',
--         '-Declipse.product=org.eclipse.jdt.ls.core.product ',
--         '-Dlog.level=ALL ',
--         '-noverify',
--         '-Xmx2G',
--         '-jar',
--         vim.env.JDTLS_HOME .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--         '-configuration',
--         vim.env.JDTLS_HOME .. '/config_linux',
--         '-data',
--         vim.env.WORKSPACE,
--         '--add-opens',
--         'java.base/java.util=ALL-UNNAMED',
--         '--add-opens',
--         'java.base/java.util=ALL-UNNAMED',
-- }, ' ')


-- Windows
vimp.nnoremap('<leader>ww', ':wincmd w<cr>')
vimp.nnoremap('<leader>wj', ':wincmd j<cr>')
vimp.nnoremap('<leader>wh', ':wincmd h<cr>')
vimp.nnoremap('<leader>wk', ':wincmd k<cr>')
vimp.nnoremap('<leader>wl', ':wincmd l<cr>')
vimp.nnoremap('<leader>wJ', ':wincmd J<cr>')
vimp.nnoremap('<leader>wK', ':wincmd K<cr>')
vimp.nnoremap('<leader>wH', ':wincmd H<cr>')
vimp.nnoremap('<leader>wL', ':wincmd L<cr>')
vimp.nnoremap('<leader>wv', ':vsplit<cr>')
vimp.nnoremap('<leader>ws', ':split<cr>')
vimp.nnoremap('<leader>w<', ':vert res -10<cr>')
vimp.nnoremap('<leader>w>', ':vert res +10<cr>')
vimp.nnoremap('<leader>w=', ':wincmd =<cr>')
vimp.nnoremap('<leader>w-', ':res -10<cr>')
vimp.nnoremap('<leader>w+', ':res +10<cr>')
vimp.nnoremap('<leader>w0', ':wincmd c<cr>')

-- Terminal
-- vimp.nnoremap('<leader>`', ':20split term://zsh<cr>')
require('toggleterm').setup {
  size = 15,
  open_mapping = [[<leader>\]],
  hide_numbers = true,
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = false,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Tree
vimp.nnoremap('<C-n>', ':NvimTreeToggle<cr>')
vimp.nnoremap('<leader>r', ':NvimTreeRefresh<cr>')
vimp.nnoremap('<leader>n', ':NvimTreeFindFile<cr>')
