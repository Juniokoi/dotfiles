let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'

	Plug 'w0ng/vim-hybrid'

	Plug 'tpope/vim-abolish'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'vim-scripts/Align'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'mhinz/vim-startify'

	Plug 'mhinz/vim-signify'
	Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-fireplace'
	Plug 'rdnetto/YCM-Generator'

	Plug 'machakann/vim-highlightedyank'

	Plug 'fatih/vim-go'
	Plug 'rust-lang/rust.vim'

	Plug 'nsf/gocode'
	Plug 'junegunn/fzf'
	Plug 'nanotee/zoxide.vim'

	Plug 'easymotion/vim-easymotion'
	Plug 'vim-syntastic/syntastic'
	Plug 'tpope/vim-vinegar'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'godlygeek/tabular'
	Plug 'tomtom/tcomment_vim'
	Plug 'tpope/vim-unimpaired'
	Plug 'kkoomen/vim-doge'
	Plug 'tpope/vim-repeat'
	Plug 'wellle/targets.vim'
	Plug 'farmergreg/vim-lastplace'
	Plug 'justinmk/vim-sneak'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'mg979/vim-visual-multi'
	Plug 'elzr/vim-json'
	Plug 'gelguy/wilder.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'lambdalisue/nerdfont.vim'

	Plug 'dmerejkowsky/vim-ale'
	Plug 'ervandew/supertab'
call plug#end()
