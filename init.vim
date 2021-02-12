" Wanna use Neovim? Sorry u cant, but wait a min, now u can!!
syntax enable
set modifiable
set noerrorbells
set nowrap
set noswapfile
set hidden
set nu
set relativenumber
set incsearch
set guicursor=a:block
set guicursor=a:blinkon0
set scrolloff=8
set expandtab
set autoindent
set autowriteall
set splitbelow splitright
set signcolumn=yes
set termguicolors

set tabstop=4
set softtabstop=4 shiftwidth=4
let mapleader = " "

"Copy paste from anywhere into Vim
set clipboard=unnamedplus

"Extensions
call plug#begin('C:\\Users\\sujay\\Neovim\\config\\plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'morhetz/gruvbox'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

call plug#end()

"Greatest colorscheme known to man
colorscheme gruvbox
set background=dark
highlight Normal guibg=None

if (has("termguicolors"))
    set termguicolors
endif

"Add some damn colours to ur sed lyf
lua require 'colorizer'.setup()

"NERDCommenter: want to comment out a block of code quick? Boy O boy use me!
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"NERDTree: u think VSCode file explorer is good? watch this
"autocmd VimEnter * NERDTree
"let NERDTreeMinimalUI=0
let g:NERDTreeChDirMode=2
map <leader>e :NERDTreeToggle<CR>

"The cool looking bar u see below, here's where I come from
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-w> :bd<CR>


"default system python 
let g:python3_host_prog='C:\\Users\\sujay\\miniconda3\\python'

"Using Powershell as default shell and some terminal remaps to make LIFE EZZ
tnoremap <Esc> <C-\><C-n>
"autocmd TermOpen * startinsert
nnoremap <leader>tt :new term://powershell<CR>:resize 13<CR>iclear<CR>


"COC nvim 
"What do ladies say when they know have a nicely configured COC
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

"sweet sweet tab completion 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"some more juicy keymaps to goto definition and references 
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Break outta brackets live free voohoo!!
inoremap <C-l> <Esc>la

"FZF
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = 'C:\\Users\\sujay\\AppData\\Local\\nvim\\fzf_history_dir'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--reverse'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" That Beyooootiful GIT integration
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

"Some more bleh Git config to resolve issues fazzzzt
nmap <leader>gh :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>gc :GCheckout<CR>

"Jump through splits like a ninja
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Get neat python docstrings
let g:pydocstring_doq_path="C:\\Users\\sujay\\miniconda3\\Scripts\\doq.exe"
let g:pydocstring_formatter = 'google'
nmap <silent> :doc <Plug>(pydocstring)
