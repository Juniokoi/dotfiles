let g:airline_powerline_fonts = 1
let g:airline_extensions = []
let g:airline_theme='angr'

function! s:update_highlights()
	hi CursorLine ctermbg=none guibg=NONE
	hi VertSplit ctermbg=none guibg=NONE
endfunction
autocmd User AirlineAfterTheme call s:update_highlights()
