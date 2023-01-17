-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
 vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local M = {};
local cmp = require('cmp')
local luasnip = require('luasnip')

M.set_keymap = function(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap(
        "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts
    )
    buf_set_keymap(
        "n", "<space>rn", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts
    )
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap(
    --     "n", "<space>wl",
    --     "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    --     opts
    -- )
    buf_set_keymap(
        "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts
    )
    buf_set_keymap("n", "<space>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap(
        "n", "<space>e",
        "<cmd>lua vim.diagnostic.open_float()<CR>", opts
    )
    buf_set_keymap(
        "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts
    )
    buf_set_keymap(
        "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts
    )
    buf_set_keymap(
        "n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts
    )
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = 'nvim_lsp' },
    {name = "treesitter"},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
    {name = 'path'},
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})

M.capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Set new icon on diagnostic errorrs
local function setup_lsp_diags()
    local signs = {
        Error = " ",
        Warning = " ",
        Hint = " ",
        Information = " ",
    }

    vim.diagnostic.config({
      virtual_text = false,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })

    -- for type, icon in pairs(signs) do
    --     local hl = "LspDiagnosticsSign" .. type
    --     vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
    -- end
end

setup_lsp_diags()

return M;
