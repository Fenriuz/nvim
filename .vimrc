" syntax on
filetype plugin indent on

"set kscb
"set guicursor=
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4
set softtabstop=0
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

"OLDCONFIG:(
set showmatch
set cursorline
setlocal fileformat=unix
set ff=unix
set encoding=UTF-8
" set mouse=a

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader = " "

nmap <leader>bd :bdelete<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>af :w<CR>:silent ! ./node_modules/.bin/eslint % --fix<CR>:edit<CR>
nmap <leader>rn :!node %<CR>

nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader><CR> :so ~/nvim/.vimrc<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

" greatest remap ever
vnoremap <leader>p "_dP
inoremap <C-c> <esc>


" Plugins
call plug#begin('~/nvim/plugged')
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Format
Plug 'sbdchd/neoformat'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

"snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Things
Plug 'henrik/vim-indexed-search' " display the result when searching
Plug 'wellle/targets.vim' " add new text object (can delete between comma with di, for example)
Plug 'machakann/vim-swap' " swap arguments in parenthesis
Plug 'chaoren/vim-wordmotion' " camel case motion
Plug 'bfredl/nvim-miniyank' " Register management
" Plug 'ap/vim-css-color' " Display the hexadecimal colors - useful for css and color config
Plug 'majutsushi/tagbar'
" Plug 'ternjs/tern_for_vim'
Plug 'liuchengxu/vista.vim' " Use LSP
Plug 'ludovicchabant/vim-gutentags'
Plug 'tmux-plugins/vim-tmux' | Plug 'tmux-plugins/vim-tmux-focus-events' " syntax highlighting for tmux.conf + other cool options
" Plug 'christoomey/vim-tmux-navigator' " seemless navigation between vim windows / tmux pane
Plug 'neomake/neomake'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Golang
" Plug 'fatih/vim-go', {'for': 'go'} " general plugin
" Plug 'godoctor/godoctor.vim', {'for': 'go'} " refactoring
" Plug 'sebdah/vim-delve', {'for': 'go'} " debugger
" Plug 'Phantas0s/go-analyzer.vim' " Custom plugin
" Plug 'tweekmonster/gofmt.vim'
"
" JavaScript
" Plug 'mxw/vim-jsx' " For react


"De mi config old OOOOOOOOOOOOOOOOLLLLLLLLD
Plug 'jiangmiao/auto-pairs'
"Plug 'rstacruz/vim-closer'
Plug 'Yggdroot/indentLine'
Plug 'gregsexton/matchtag'
Plug 'tomtom/tcomment_vim' " keystroke to comment automatically
Plug 'dominikduda/vim_current_word'
Plug 'machakann/vim-sandwich' " surrounding text objects with paranthesis, quotes, html tags...
Plug 'tpope/vim-repeat' " the . command can repeat whatever you want! See http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
Plug 'alvan/vim-closetag'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'scrooloose/nerdtree' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight' | Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Dashboard
Plug 'glepnir/dashboard-nvim'

" Git
Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify' " wrapper for git and display git diff in the left gutter
Plug 'junegunn/gv.vim' " Display commits for project / file
Plug 'rhysd/git-messenger.vim' " Display commit message for a precise line

Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
"Plug 'ThePrimeagen/vim-apm'
"Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO

" Plug 'luochen1990/rainbow'

Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" Plug 'nvim-lua/lsp-status.nvim'
Plug 'glepnir/galaxyline.nvim'
" Plug 'Iron-E/nvim-highlite'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



" Plugins congig
" Theme and colors
source ~/nvim/config/gruvbox.vim
source ~/nvim/config/treesitter.vim
source ~/nvim/config/icons.vim

" Intellisense
source ~/nvim/config/lsp.vim
source ~/nvim/config/completion.vim
source ~/nvim/config/current-word.vim
source ~/nvim/config/snippets.vim

" IDE
" source ~/nvim/config/nerdtree.vim
source ~/nvim/config/luatree.vim
source ~/nvim/config/undotree.vim
source ~/nvim/config/fzf.vim
source ~/nvim/config/git.vim
source ~/nvim/config/bujo.vim
source ~/nvim/config/telescope.vim
source ~/nvim/config/miniyank.vim
source ~/nvim/config/tagbar.vim
source ~/nvim/config/markdown.vim
source ~/nvim/config/dashboard.vim
source ~/nvim/config/indent.vim
" source ~/nvim/config/status-line.vim
" source ~/nvim/lua/lspsaga/status-line.lua
lua require('init')
" source ~/nvim/config/vista.vim


"Extra
source ~/nvim/config/extra.vim


" let g:signify_sign_add               = '+'
" let g:signify_sign_delete            = '_'
" let g:signify_sign_delete_first_line = '‾'
" let g:signify_sign_change            = '!'
let g:signify_sign_show_count = 1

let g:signify_sign_add               = ''
let g:signify_sign_delete            = ''
let g:signify_sign_delete_first_line = ''
let g:signify_sign_change            = ''
set updatetime=100


highlight SignifySignAdd                  ctermbg=green guifg=#50fa7b
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ff5555
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#ffb86c
