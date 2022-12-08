local status_ok, noice = pcall(require, "noice")
if not status_ok then
    return
end

noice.setup(
    {
        cmdline = {
            view = "cmdline_popup", -- view for rendering the cmdline. change to `cmdline` to get a classic cmdline at the bottom
            opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
            icons = {
                ["/"] = { icon = " ", hl_group = "diagnosticwarn" },
                ["?"] = { icon = " ", hl_group = "diagnosticwarn" },
                [":"] = { icon = " ", hl_group = "diagnosticinfo", firstc = false },
            },
        },
        popupmenu = {
            enabled = true, -- disable if you use something like cmp-cmdline
            ---@type 'nui'|'cmp'
            backend = "nui", -- backend to use to show regular cmdline completions
            -- you can specify options for nui under `config.views.popupmenu`
        },
        history = {
            -- options for the message history that you get with `:noice`
            view = "split",
            opts = { enter = true },
            filter = { event = "msg_show", ["not"] = { kind = { "search_count", "echo" } } },
        },
        notify = {
            -- noice can be used as `vim.notify` so you can route any notification like other messages
            -- notification messages have their level and other properties set.
            -- event is always "notify" and kind can be any log level as a string
            -- the default routes will forward notifications to nvim-notify
            -- benefit of using noice for this is the routing and consistent history view
            enabled = false,
        },
        throttle = 1000 / 30, -- how frequently does noice need to check for ui updates? this has no effect when in blocking mode.
        views = {},
        routes = {}, -- @see the section on routes below
        status = {}, --@see the section on statusline components below
        format = {}, -- @see section on formatting
    }
)
