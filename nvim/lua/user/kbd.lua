vim.cmd([[

" fast cargo call
command CRun :w | !cargo run
command Bd :b# | bw# | bn | bp
command Bdw :w | b# | bw# | bn | bp
command Bdd :b# | bw!# | bn | bp

map <C-n> :NeoTreeFocusToggle<CR>

" FZF
map <C-p> :FZF<CR>
map <C-f> :Rg<CR>
map <C-t> :e <cfile><cr>
"

" a co to?
map <S-Tab> :bn<CR>

" Zoom
map <silent> <C-kPlus> :ZoomIn<Enter>
map <silent> <C-kMinus> :ZoomOut<Enter>

" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" Move highlighted text up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Status bar config
set statusline+=%#warningmsg#

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \	 'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
            \	 fzf#vim#with_preview(), <bang>0)

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

au BufReadPost *.ezt set syntax=html

nnoremap o o<Esc>
nnoremap O O<Esc>

nnoremap Y y$

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

"Terminal Mode

tnoremap <Esc> <C-\><C-n>
command Terminal :below 7split | terminal

"switch buffers
nnoremap <C-h> :bprev<CR>
nnoremap <C-j> :bnext<CR>

"toggle comment
"nnoremap <C-Bslash> :call nerdcommenter#Comment('0', 'toggle')<CR>
"vnoremap <C-Bslash> :call nerdcommenter#Comment('0', 'toggle')<CR>
"inoremap <C-Bslash> :call nerdcommenter#Comment('0', 'toggle')<CR>

map <C-Bslash> <plug>NERDCommenterToggle
]])