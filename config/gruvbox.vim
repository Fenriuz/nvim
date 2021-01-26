let g:theprimeagen_colorscheme = "gruvbox"
fun! ColorMyPencils()
  colorscheme ayu
  set background=dark

  let g:gruvbox_contrast_dark = 'hard'
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  let g:gruvbox_invert_selection='0'

  highlight ColorColumn ctermbg=0 guibg=grey
  highlight Normal guibg=none
  highlight qfFileName guifg=#aed75f
  highlight MatchParen guifg=none
  highlight MatchParen guibg=#3a3a3a
endfun
call ColorMyPencils()
