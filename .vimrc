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