filetype off                  " required

" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')

" NERD Tree Exention
Plug 'scrooloose/nerdtree'
map <C-i> :NERDTreeToggle<CR>
" autocmd VimEnter * NERDTree

"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/plugged/vim-yaml/after/syntax/yaml.vim

Plug 'posva/vim-vue'

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

"----------------------- git ----------------
Plug 'tpope/vim-fugitive'

"----------------------- commenter ----------
Plug 'preservim/nerdcommenter'

"---------------------- fzf finder ----------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


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

let g:fzf_preview_window = 'right:60%'

" =========== Markdown ===========
Plug 'gabrielelana/vim-markdown'
let g:markdown_enable_spell_checking = 0

" =========== RoR ===========
Plug 'tpope/vim-rails'

" =========== Linter ===========
Plug 'w0rp/ale'
" Set specific linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1
" let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 1

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
