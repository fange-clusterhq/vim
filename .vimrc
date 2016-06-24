set backspace=indent,eol,start
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
if has('mouse')
   set mouse=a
endif
if &t_Co > 2 || has("gui_running")
   syntax on
endif
set autoindent                " always set autoindenting on
if !exists(":DiffOrig")
   command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
endif
set tabstop=8
set shiftwidth=3
set softtabstop=8
set expandtab
colorscheme ron
if &t_Co > 255
   " colorscheme zenburn
   " let g:zenburn_force_dark_Background=1
   " colorscheme maroloccio
endif
set guifont=Inconsolata:h18
set number

set hlsearch
" Show trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
autocmd InsertLeave * redraw!
nmap <F5> :noh<CR>

"
" Macro to remove spaces
"
function ShowSpaces(...)
   let @/='\v(\s+$)|( +\ze\t)'
   let oldhlsearch=&hlsearch
   if !a:0
      let &hlsearch=!&hlsearch
   else
      let &hlsearch=a:1
   end
   return oldhlsearch
endfunction

function TrimSpaces() range
   let oldhlsearch=ShowSpaces(1)
   execute a:firstline.",".a:lastline."substitute///gec"
   let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F6>   m`:TrimSpaces<CR>``
vnoremap <F6>   :TrimSpaces<CR>

" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \                                                                  
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif                                                                                                                                 
call plug#begin('~/.config/nvim/plugged') 
