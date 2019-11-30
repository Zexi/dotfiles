" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'buoto/gotests-vim'
"Plug 'kien/rainbow_parentheses.vim'
Plug 'wlangstroth/vim-racket'
Plug 'morhetz/gruvbox'
"Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'tpope/vim-repeat'
Plug 'suan/vim-instant-markdown'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jceb/vim-orgmode'
Plug 'dhruvasagar/vim-table-mode'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" All of your Plugins must be added before the following line
call plug#end()    " required
filetype plugin indent on " required

set wildmenu
set wildmode=full
set history=1000
"set number
set showcmd
set ignorecase

set hls
set incsearch
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

filetype plugin on
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" restore last cursor position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

syntax on
set termguicolors
set background=dark
"let g:gruvbox_contrast_dark='medium'
"colorscheme gruvbox
colorscheme base16-tomorrow-night-eighties
"colorscheme Tomorrow-Night-Eighties
"colorscheme base16-atelier-dune
"colorscheme PaperColor
"let g:nord_bold = 0
if has('gui_running')
	set guioptions-=T
	set guioptions-=m
	set guifont=Monaco:h15
else
	set t_Co=256
endif

" conf for vim-ruby
filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific plugins
autocmd FileType ruby,yaml,eruby setlocal expandtab shiftwidth=2 tabstop=2
let g:user_emmet_install_global = 0
autocmd FileType html,css setlocal expandtab shiftwidth=2 tabstop=2 smartindent smarttab softtabstop=2
autocmd FileType html,css EmmetInstall
autocmd FileType sh,expect setlocal expandtab shiftwidth=4 tabstop=4 smartindent
autocmd FileType c,cpp,dot setlocal sw=4 tabstop=4 cindent
autocmd FileType go setlocal sw=4 tabstop=4 noexpandtab
autocmd FileType javascript,java setlocal expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4
autocmd FileType tex,markdown setlocal expandtab tabstop=2 shiftwidth=2 smarttab softtabstop=2

" conf for Ag
let g:ag_prg="/usr/local/bin/ag --vimgrep"

" conf for ctags
let g:ctags_statusline=1

" conf for window split
" We can use different key mappings for easy navigation between splits to save
" a keystroke. So instead of ctrl-w then j, it’s just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than
" Vim’s default:
set splitbelow
set splitright

" for vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" sudo write
cmap w!! w !sudo tee % >/dev/null

" for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" racket
if has("autocmd")
  au BufReadPost *.rkt,*.rktl,*.scm set filetype=racket
  au filetype racket set lisp
  au filetype racket set autoindent
  "au filetype racket let b:autopairs_enabled = 0
endif

"" rainbow_parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" make exiting to normal mode a bit easier
imap jj <ESC>
imap kk <ESC>

" vim-go
" let g:go_def_mode = 'godef'
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
"let g:go_fmt_autosave = 0
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_deadline = "5s"
"let g:go_def_mapping_enabled = 0
"let g:go_def_reuse_buffer = 1
"autocmd FileType go nmap gd <Plug>(go-def-vertical)
"autocmd FileType go nmap <C-]> <Plug>(go-def)
"autocmd FileType go nmap  g] <Plug>(go-implements)

" tex
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="xelatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}

" markdown
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

let g:vim_markdown_folding_disabled = 1

" status line
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ }

" for easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" vim table mode
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" For Markdown-compatible tables use
let g:table_mode_corner="|"

" terminal mode
tnoremap <Esc> <C-\><C-n>

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" auto show signcolumns
set signcolumn=auto

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <Tab> for confirm completion.
" Coc only does snippet and additional edit on confirm
" inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

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
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"set completeopt=noinsert,noselect,menuone
