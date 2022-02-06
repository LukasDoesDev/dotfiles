-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require('lspconfig')

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.jsonls.setup{
    capabilities = capabilities,
}
lspconfig.html.setup {
    capabilities = capabilities,
}
lspconfig.pyright.setup{
    capabilities = capabilities,
}
lspconfig.tsserver.setup{
    capabilities = capabilities,
}
lspconfig.denols.setup{
    capabilities = capabilities,
}
lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
}
lspconfig.emmet_ls.setup{
    capabilities = capabilities,
}
lspconfig.eslint.setup{
    capabilities = capabilities,
}
lspconfig.tailwindcss.setup{
    capabilities = capabilities,
}
lspconfig.dockerls.setup{
    capabilities = capabilities,
}

-- For Deno code in Markdown files
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

-- ESLint format on write
-- vim.api.nvim_command("autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>")




-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

