function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

nmap <leader>n :call NERDTreeToggleInCurDir()<CR>

" don't display informations (type ? for help and so on)
let g:NERDTreeMinimalUI = 1
" " don't replace the native vim file explorer
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeQuitOnOpen = 1

" change the arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"
" remapping - see nerdtree.txt and search for "NERDTreeMappings"
"
hi NERDTreeDir guifg=#85AFA5 guibg=none gui=NONE
hi NERDTreeFile guifg=#F5F5F5 guibg=none gui=NONE
"
let NERDTreeMapOpenSplit = 'h'
let NERDTreeMapPreviewSplit='gh'
"
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapPreviewVSplit='gv'
"
let g:NERDTreeMouseMode=3
"
"
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
"
"" weird hack for nerdtree to work
let mapleader = "\\"
let maplocalleader = "\\"
map <space> <leader>
map <space> <localleader>

autocmd FileType nerdtree setlocal nolist


let s:test_yellow = 'FFCA28'
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*test.*\.js$'] = s:test_yellow " sets the color for files ending with _spec.rb
