let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let g:completion_enable_snippet = 'Neosnippet'
let g:completion_confirm_key = "\n"
let g:completion_sorting = "length"
let g:completion_auto_change_source = 1
let g:completion_timer_cycle = 50

imap <C-t>     <Plug>(neosnippet_expand_or_jump)
smap <C-t>     <Plug>(neosnippet_expand_or_jump)
xmap <C-t>     <Plug>(neosnippet_expand_target)


inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
