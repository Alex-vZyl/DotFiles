----------------------
-- Find and Replace --
----------------------

-- Allow FAR to undo.
vim.cmd('let g:far#enable_undo=1')

----------------
-- Auto pairs --
----------------

require 'nvim-autopairs'.setup {
    map_cr = false
}

----------
-- Leap --
----------

local leap = require 'leap'
leap.setup {

}
leap.set_default_keymaps(true)

----------------
-- Illuminate --
----------------

require 'illuminate'.configure {
    under_cursor = false,
    delay = 500,
    filetypes_denylist = {
        'startify',
        'NvimTree'
    }
}

---------------
-- Scrollbar --
---------------

-- require 'scrollbar'.setup {
    -- show_in_active_only = true,
--     set_highlights = false,
--     marks = {
--         Search = { color = 'Orange' },
--         Error = { color = 'Red' },
--         Warn = { color = 'Yellow' },
--         Info = { color = 'Blue' },
--         Hint = { color = 'Green' },
--         Misc = { color = 'Purple' }
--     }
-- } 

--------------
-- Zen mode --
--------------

require 'true-zen'.setup {
    modes = {
        ataraxis = {
            shade = 'dark',
            left = {
                hidden_number = false,
                hidden_relativenumber = false,
                hidden_signcolumn = "no",
                shown_number = true,
                shown_relativenumber = true,
                shown_signcolumn = "yes"
            }
        }
    },
   integrations = {
        lualine = true
    },
}

---------------------
-- Setup neoscroll --
---------------------

require 'neoscroll'.setup {
    erasing_function = 'quadratic'
}
local t = { }
t['<C-u>'] = {'scroll', {'-vim.wo.scroll * 2', 'true', '400', nil}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll * 2', 'true', '400', nil}}
require 'neoscroll.config'.set_mappings(t)

-----------------
-- Indentation --
-----------------

require 'indent_blankline'.setup {
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = false,
    filetype_exclude = { 'NvimTree', 'startify' },
    use_treesitter = false,
    use_treesitter_scope = false,
    -- context_char = '┃',
    context_char = '│',
    -- char = '│',
    -- char = '',
    -- ['|', '¦', '┆', '┊']
    char = '┆',
}

---------------------
-- Formatter setup --
---------------------

-- Todo.
-- require 'formatter'.setup {}

---------------------
-- Setup which-key --
---------------------

require 'which-key'.setup {

}

-- Timeout.
vim.cmd('set timeoutlen =1000')

---------------------------------
-- Setup default notifications --
---------------------------------

local notify = require 'notify'
notify.setup {}
vim.notify = notify

------------------
-- Image Viewer --
------------------

-- require 'hologram'.setup {
--    auto_display = true
-- }

-----------
-- Noice --
-----------

-- require "noice".setup {
    -- lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        -- override = {
          -- ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          -- ["vim.lsp.util.stylize_markdown"] = true,
          -- ["cmp.entry.get_documentation"] = true,
        -- },
    -- },
    -- you can enable a preset for easier configuration
    -- presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        -- long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
        -- lsp_doc_border = false, -- add a border to hover docs and signature help
    -- },
-- }
