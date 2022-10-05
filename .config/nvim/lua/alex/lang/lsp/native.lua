-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts) vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts) vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts) vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts) vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts) vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts) vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts) vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts) 

end 

-- Run install-servers.sh to install all the servers used below.

local lsp_flags = {
    -- Default.
    debounce_text_changes = 250,
    -- Custom. 
}

-- Use lspconfig to setup.
local lsp_config = require 'lspconfig'

-- Lua.
lsp_config.sumneko_lua.setup {
    on_attach = on_attach,
    flags = lsp_flags
}

-- Julia.
lsp_config.julials.setup {
    on_attach = on_attach,
    flags = lsp_flags
}

-- Bash.
lsp_config.bashls.setup {
    on_attach = on_attach,
    flags = lsp_flags
}

-- Python.
lsp_config.pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags
}

-- Setup the nvim diagnostic signs.
vim.cmd([[
    sign define DiagnosticSignError text= texthl= linehl= numhl=DiagnosticSignError 
    sign define DiagnosticSignWarn  text= texthl= linehl= numhl=DiagnosticSignWarn
    sign define DiagnosticSignInfo  text= texthl= linehl= numhl=DiagnosticSignInfo
    sign define DiagnosticSignHint  text= texthl= linehl= numhl=DiagnosticSignHint
]])

-- Disable diagnostics msg.
vim.diagnostic.config({virtual_text = false})
-- Disable diagnostics text.
vim.diagnostic.config({signs = true})
