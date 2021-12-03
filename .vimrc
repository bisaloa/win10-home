set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
syntax on

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1
highlight ColorColumn ctermbg=238

au FileType gitcommit setlocal tw=72
au FileType gitcommit setlocal cc=+1
au FileType gitcommit set cc+=51
set complete+=kspell
au FileType gitcommit setlocal spell
