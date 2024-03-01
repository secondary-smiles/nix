local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

-- lsp keymaps
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end
})

local signs = {
  Warn = "◆",
  Error = "◆",
  Hint = "◆",
  Info = "◆",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numh1 = "" })
end

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require("cmp")
local luasnip = require("luasnip")

local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'luasnip',  keyword_length = 2 },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'l',
        luasnip = 's',
        buffer = 'b',
        path = 'p',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),

    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }
})

-- setup lsp servers
lspconfig.lua_ls.setup {}
lspconfig.clangd.setup {}
lspconfig.serve_d.setup {}
lspconfig.tsserver.setup {}
lspconfig.svelte.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.pyright.setup {}
lspconfig.elmls.setup {}
lspconfig.zls.setup {}
lspconfig.hls.setup {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}
lspconfig.unison.setup {}
lspconfig.perlls.setup {}

lspconfig.ocamllsp.setup {}
lspconfig.cssls.setup{}
lspconfig.html.setup{}
lspconfig.gdscript.setup{}

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
lspconfig.nixd.setup{}
lspconfig.typst_lsp.setup{}
