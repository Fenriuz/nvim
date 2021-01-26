nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gfa :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>")  }<CR>
nmap <leader>gs :G<CR>
nmap <leader>gac :GV<CR>
nmap <leader>gtc :GV!<CR>
