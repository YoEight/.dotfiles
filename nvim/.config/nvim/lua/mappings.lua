vim.g.mapleader = " "

-- telescope
local options = { noremap = true }
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope git_files<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fcr', '<cmd>Telescope lsp_references<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fcs', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fcd', '<cmd>Telescope lsp_workspace_diagnostics<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', options)

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
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'K', '<cmd> lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>crn', '<cmd> lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>F', '<cmd> lua vim.lsp.buf.formatting()<CR>', opts)
    -- buf_set_keymap('n', '<leader>e', '<cmd> lua vim.diagnostic.open_float()<CR>', opts)

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
vim.api.nvim_set_keymap('n', '<leader>ww', ':wincmd w<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wj', ':wincmd j<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wh', ':wincmd h<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wk', ':wincmd k<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wl', ':wincmd l<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wJ', ':wincmd J<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wK', ':wincmd K<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wH', ':wincmd H<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wL', ':wincmd L<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wv', ':vsplit<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>ws', ':split<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>w<', ':vert res -10<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>w>', ':vert res +10<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>w=', ':wincmd =<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>w-', ':res -10<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>w+', ':res +10<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>wc', ':wincmd c<cr>', options)

-- Terminal
-- vimp.nnoremap('<leader>`', ':20split term://zsh<cr>')
require('toggleterm').setup {
  size = 15,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
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
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<cr>', options)
