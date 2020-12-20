if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
endif

" COLORSCHEME
set background=dark
syntax enable
colorscheme darcula
set encoding=UTF-8

" The Silver Searcher
if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
endif

" LEADER SHORTCUTS
let mapleader=","

" use jk to exit insert mode and write changes
" use jj to simply <esc>
inoremap jk <esc>:w<Enter>
inoremap jj <esc>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Map Leader n to open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Opens silver searcher in vim for easy searching
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)

nnoremap <leader>a :Ag<CR>

" Opens file search using fzf
nnoremap <leader>f :Files<CR>

" Opens tags to search using fzf
nnoremap <leader>t :Tags<CR>

" Searches tags in buffer using fzf
nnoremap <leader>T :BTags<CR>

" Quickly open a vertical split
nnoremap <leader>v :vsp<CR>

"Setting up auto-save
:au FocusLost * :wa
set autowrite
set autoread

" Quickly edit and source vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>eb :e ~/.vimrc.bundles<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Highlight a column when over 80 chars
if exists('+colorcolumn')
        set colorcolumn=80
else
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" CONFIG
" show line numbers
set number
set numberwidth=5

" tell vim to look for ctags index file in the source directory
set tags=tags

" keep some context visible when moving up and down pages
set scrolloff=10

" highlight which line the cursor is on
set cursorline
" visual autocomplete for command menu
set wildmenu
" redraw only when needed
set lazyredraw
" highlights matching parentheses
set showmatch

" buffers are hidden with unsaved changes rather than forcing you to write
set hidden

" COQ LANGUAGE SERVER CONFIG
set nobackup
set nowritebackup

" better display for messages
set cmdheight=2

set updatetime=300
" don't give |ins-completion-menu| messages.
" set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add diagnostic info for https://github.com/itchyny/lightline.vim
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
                        \ 'colorscheme': 'wombat',
                        \ 'active': {
                        \   'left': [ [ 'mode', 'paste' ],
                        \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
                        \ },
                        \ 'component_function': {
                        \   'cocstatus': 'coc#status',
                        \   'currentfunction': 'CocCurrentFunction'
                        \ },
                        \ }

" search as characters are entered, highlight matches, ignore case except when using capitals
set incsearch
set hlsearch
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert auto-correction
set backspace=indent,eol,start
" When opening a new line and no filetype-specific indenting is enables, keep the same indent as the line you're currently on.
set autoindent
" Use visualbell instead of beeping when dong something wrong
set visualbell
" enable the use of the mouse for all modes
set mouse=a
" Automatically write before running a command
set autowrite
" enable paste with Ctrl v 
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
" enable yanking visual selection yanking using Ctrl-C
vnoremap <C-c> "+y
" leader l redraws the screen and removes any search highlighting
nnoremap <leader>l :nohl<CR><C-l>

" SPACES AND TABS
" number of visual spaces per tab
set tabstop=2
set shiftwidth=2
" converts tabs to spaces
set expandtab
" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" MOVEMENT
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Set sane defaults for splits
set splitbelow
set splitright

" terminal movement
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l
" close terminal window
tnoremap <C-d> <C-\><C-n>:q!<CR>

" Emmet Configuration
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
                        \ 'javascript.jsx' : {
                        \ 'extends' : 'jsx',
                        \},
                        \}

" ALE tweaks for syntax highlighting
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" Less distracting when opening a new file
let g:ale_lint_on_enter = 0
let g:ale_fixers = {'javascript': ['eslint']}
" Fix files automatically on save
let g:ale_fix_on_save = 1

" vim-repl config
let g:repl_program = {
      \  'clojure': ['clojure'],
      \  'javascript': ['node'],
      \  'ruby': ['irb', 'pry'],
      \  'typescript': ['ts-node', 'node'],
      \}
nnoremap <leader>r :REPLToggle<Cr>
let g:repl_position = 3

" vim-sneak label mode
let g:sneak#label = 1
" overmap f with vim-sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Prettier default: true
let g:prettier#config#semi = 'false'
