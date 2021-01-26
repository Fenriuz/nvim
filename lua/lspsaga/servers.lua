local chain_complete_list = {
  default = {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'path'}, triggered_only = {'./', '/'}},
    {complete_items = {'buffers'}},

  },
  string = {
    {complete_items = {'path'}, triggered_only = {'./', '/'}},
    {complete_items = {'buffers'}},

  },
  comment = {},

}

local on_attach = function(_, _)
  require'completion'.on_attach({
    chain_complete_list = chain_complete_list,
    enable_auto_popup = 1,
    enable_auto_signature = 1,
    auto_change_source = 1,
    enable_auto_hover = 1,
  })
end
require'lspconfig'.tsserver.setup{on_attach=on_attach}
require'lspconfig'.html.setup{on_attach=on_attach}
require'lspconfig'.jsonls.setup{on_attach=on_attach}
require'lspconfig'.cssls.setup{on_attach=on_attach}
