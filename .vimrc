"""""""""""""""""""""""""""""""""""""""
" Default
"""""""""""""""""""""""""""""""""""""""
" To insert space characters whenever the tab key is pressed. Use  Ctrl-V<Tab> to insert tab
set expandtab
" columns for a tab
set tabstop=2
" colums for indent
set shiftwidth=2
" no swap files
set noswapfile
" backup file while editing
set nowritebackup
" backup file while editing
set nobackup
" activate backspace in v mode
set backspace=indent,eol,start
" the minimum number of line to display
set scrolloff=5
" set file encoding when you save
set fileencoding=utf-8
" set encoding
set encoding=utf-8
" color code
syntax on
" disable beep
set vb t_vb=
" disable beep
set novisualbell
" yanked ckaracter to clipboard
set clipboard=unnamed,autoselect
" show line number
set number
" number at right bottom
set ruler
" set default of vim
set nocompatible
" when you close brackets the cursor won't go to the beginning of the line
set nostartofline
" move to matched brackets with using %
set matchpairs& matchpairs+=<:>
" show matched brackets
set showmatch
" activate showmatch in 3 seconds
set matchtime=3
" wrap lines
set wrap
" not to wrap
set textwidth=0
" set list
set list
" show invisible character like the bellow
set lcs=tab:»-,trail:-,eol:¬,nbsp:%
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" round indent to multiple of 'shiftwidth'
set shiftround
" when complement it doesnt matter that it's upper case or lower case
set infercase
" ignore upper case and lower case (ignorecase, smartcase)
set ignorecase
set smartcase
" enable incremental search
set incsearch
" highlight search matches
set hlsearch
" number of available history
set history=10000
" show inserted command
set showcmd
" font
"set guifont=Ricty_Diminished:h16
" font for airline
set guifont=Inconsolata_for_Powerline:h16
" show full width character
set ambiwidth=double
" highlight cursored line
set cursorline
" to show airline
set laststatus=2
" go to the previous tab
ca th tabp
" make a new tab
ca tn tabnew


"""""""""""""""""""""""""""""""""""""""
" NeoBundle
"""""""""""""""""""""""""""""""""""""""
filetype off

if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Fetch NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" To open files
NeoBundle 'Shougo/unite.vim.git'
let g:unit_enable_start_insert=1

" To show recent opened files
NeoBundle 'Shougo/neomru.vim'
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html


"""""""""""""""""""""""""""""""""""""""
" Unite.vim
"""""""""""""""""""""""""""""""""""""""
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


"""""""""""""""""""""""""""""""""""""""
" Colorscheme (colorscheme setting is at the bottom)
"""""""""""""""""""""""""""""""""""""""
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" tomorrow theme
NeoBundle 'chriskempson/tomorrow-theme'
" base16
NeoBundle 'chriskempson/base16-vim'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'


"""""""""""""""""""""""""""""""""""""""
" Vim-airline
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_section_b = "%t %M"
let s:sep = " %{get(g:, 'airlin_right_alt_sep', '')} "
let g:airline_section_x =
\ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
\ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
\ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" let g:Powerline_symbols = 'fancy'


"""""""""""""""""""""""""""""""""""""""
" Emmet-vim
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'mattn/emmet-vim'


"""""""""""""""""""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'scrooloose/nerdtree'
let NERDTreeShowHidden=1


"""""""""""""""""""""""""""""""""""""""
" Vim-nerdtree-tabs
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup = 1

"""""""""""""""""""""""""""""""""""""""
" Neosnippet
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'


"""""""""""""""""""""""""""""""""""""""
" Tern for vim
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'marijnh/tern_for_vim', { 'build': { 'others': 'npm install' } }


"""""""""""""""""""""""""""""""""""""""
" Neocomplete
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neocomplete.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"
" inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"""""""""""""""""""""""""""""""""""""""
" Vim-furgitive
"""""""""""""""""""""""""""""""""""""""
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}


"""""""""""""""""""""""""""""""""""""""
" Auto-pairs
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 0


"""""""""""""""""""""""""""""""""""""""
" Vim-surround
"""""""""""""""""""""""""""""""""""""""
"  選択したテキストを囲うようにクオーテーションや括弧など追加する
NeoBundle 'tpope/vim-surround'


"""""""""""""""""""""""""""""""""""""""
" Nerdcommenter
"""""""""""""""""""""""""""""""""""""""
" to comment out
NeoBundle 'scrooloose/nerdcommenter'


"""""""""""""""""""""""""""""""""""""""
" Html5.vim
"""""""""""""""""""""""""""""""""""""""
" support html5 syntax
NeoBundle 'othree/html5.vim'


"""""""""""""""""""""""""""""""""""""""
" Vim-css3-syntax
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'hail2u/vim-css3-syntax'


"""""""""""""""""""""""""""""""""""""""
" Vim-jsx
"""""""""""""""""""""""""""""""""""""""
" to support jsx syntax
" NeoBundle 'mxw/vim-jsx'
" let g:jsx_ext_required = 0


"""""""""""""""""""""""""""""""""""""""
" Yet Another JavaScript Syntax
"""""""""""""""""""""""""""""""""""""""
" to support es6 syntax
NeoBundle 'othree/yajs.vim'


"""""""""""""""""""""""""""""""""""""""
" Ctrlp
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'kien/ctrlp.vim'


call neobundle#end()
" <C-h>, <BS>: close popup and delete backword char.

"""""""""""""""""""""""""""""""""""""""
" setting colorscheme
"""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme base16-solarized

" required, to detect filetype, indent and plugin
filetype plugin indent on

" Installation check.
	NeoBundleCheck

if !has('vim_starting')
" Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
