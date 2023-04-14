"""""
"" Wilder
""""
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<C-j>',
      \ 'previous_key': '<C-k>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ 'left': [
	  \   ' ', wilder#popupmenu_devicons({
	  \ 'get_icon': wilder#devicons_get_icon_from_vim_devicons() }),
      \ ], 
      \ 'border': 'rounded',
      \ })),
      \ '/': wilder#wildmenu_renderer(),
      \ 'pumblend': 20,
      \ }))

