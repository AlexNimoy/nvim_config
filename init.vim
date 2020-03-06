filetype off                  " required

" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')

" NERD Tree Exention
Plug 'scrooloose/nerdtree'
map <C-i> :NERDTreeToggle<CR>

"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" coc extensions
" let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'

" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'

Plug 'stephpy/vim-yaml' " YAML highliter
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/vim-yaml/after/syntax/yaml.vim

Plug 'posva/vim-vue'

" brew install bat
" brew install fzf
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

"----------------------- COMMENTS ------------------
Plug 'tpope/vim-commentary'

"----------------------- Dockerfile syntax ---------
Plug 'ekalinin/Dockerfile.vim'

"----------------------- Status Bar ----------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='atomic'

"----------------------- Multicursor ---------------
Plug 'terryma/vim-multiple-cursors'

"----------------------- indentLine ----------------
Plug 'Yggdroot/indentLine'

"----------------------- ColorScheme ----------------
Plug 'kristijanhusak/vim-hybrid-material'

"----------------------- Golang ----------------
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"----------------------- Autocomplite ----------------
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-go'
Plug 'phpactor/ncm2-phpactor'


"----------------------- git ----------------
Plug 'tpope/vim-fugitive'

"----------------------- commenter ----------
Plug 'preservim/nerdcommenter'

call plug#end()
" == VIMPLUG END ================================

" =========== Cyrilic ===========
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-l> <C-^>
highlight lCursor guifg=NONE guibg=Cyan

" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd BufWritePre *.{tsx,ts} %s/\s\+$//e
au BufWritePost *.go silent !gofmt -w %
au FocusGained,BufEnter * :checktime

" ========= highlight ===========================
highlight UnwanttedTab ctermbg=red guibg=darkred
highlight TrailSpace guibg=red ctermbg=darkred
match UnwanttedTab /\t/
match TrailSpace / \+$/

autocmd ColorScheme * highlight UnwanttedTab ctermbg=red guibg=darkred
autocmd ColorScheme * highlight TrailSpace guibg=red ctermbg=darkred
" ========= highlight END =======================

" == AUTOCMD END ================================

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on

set background=dark
colorscheme hybrid_reverse
" colorscheme cryslominsa

set encoding=UTF-8
set number relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set showcmd
set colorcolumn=81
set autoread
