local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
    icons_enabled = true,
    separator = { left = '' },
    right_padding = 2,
}

local buffers = {
    'filename',
    file_status = true,
    newfile_status = true,
    separator = {right = ''},
    path = 0,

    max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
    -- it can also be a function that returns
    -- the value of `max_length` dynamically.
    filetype_names = {
        TelescopePrompt = 'Telescope',
        dashboard = 'Dashboard',
        packer = 'Packer',
        fzf = 'FZF',
        alpha = 'Alpha'
    }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

    buffers_color = {
        -- Same values as the general color option can be used here.
        active = 'lualine_{section}_normal', -- Color for active buffer.
        inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
    },

    symbols = {
        modified = '● ', -- Text to show when the buffer is modified
        alternate_file = '#', -- Text to show to identify the alternate file
        directory = '', -- Text to show when the buffer is a directory
    },
}
local filetype = {
      'filetype',
      colored = true,   -- Displays filetype icon in color if set to true
      icon_only = false, -- Display only an icon for filetype
      icon = { align = 'right' }, -- Display filetype icon on the right hand side
      -- icon =    {'X', align='right'}
      -- Icon string ^ in table is ignored in filetype component
}
local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}
local progress_number = {
    "progress",
    separator = {
        right = '',
    },
    left_padding = -2,
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = true,
    always_visible = false,
}


local progress_bar = {
    function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
    end,
    separator = {
        right = '',
    },
    left_padding = -20,
    right_padding = 0,
}

lualine.setup {
    options = {
        theme = 'tokyonight',
        component_separators = '•',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        ignore_focus = {},
    },




    sections = {
        lualine_a = {
            mode,
        },
        lualine_b = {buffers, diff, branch, diagnostics, },
        lualine_c = {},
        lualine_x = { 'filesize', 'encoding', 'fileformat' },
        lualine_y = {filetype, progress_number, progress_bar },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },



    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {
    },
    extensions = { 'nvim-tree', 'toggleterm' },
}

