
nnoremap <silent><nowait> <leader>ff  :<C-u>FZF<cr>
nnoremap <silent><nowait> <leader>fo  :<C-u>Zi<cr>
nnoremap <silent><nowait> <leader>li  :<C-u>PlugInstall<cr>
nnoremap <silent><nowait> <leader>.  :<C-u>NERDTreeFind<cr>
nnoremap <silent><nowait> <leader>pe  :<C-u>NERDTree<cr>

nnoremap <silent><nowait> sn :bnext<cr>
nnoremap <silent><nowait> sp :bprevious<cr>
nnoremap <silent><nowait> so <C-6>
nnoremap <silent><nowait> sq :<C-u>qall<cr>

nnoremap <silent><nowait> sc :<C-u>close<cr>
nnoremap <silent><nowait> sd :<C-u>bdelete<cr>

nnoremap <silent><nowait> sj <C-w>j
nnoremap <silent><nowait> sk <C-w>k
nnoremap <silent><nowait> sl <C-w>l
nnoremap <silent><nowait> sh <C-w>h

" Update
nnoremap <silent><nowait> fd :<C-u>silent update<cr>

nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
