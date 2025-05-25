return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',

    -- For vsnip users.
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/vim-vsnip',

    -- Vim vscode snippets (This works with vsnip and other snippet engines)
    'stevearc/vim-vscode-snippets',

    -- For luasnip users.
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparwaiz1/cmp_luasnip',

    -- For mini.snippets users.
    -- 'echasnovski/mini.snippets',
    -- 'abeldekat/cmp-mini-snippets',

    -- For ultisnips users.
    -- 'SirVer/ultisnips',
    -- 'quangnguyen30192/cmp-nvim-ultisnips',

    -- For snippy users.
    -- 'dcampos/nvim-snippy',
    -- 'dcampos/cmp-snippy',


  },
  config = function()
    local cmp = require('cmp')

    -- LSP Servers
    local servers = require('editor.config.servers')
    local lspconfig = require('lspconfig')
    local cmp_lsp = require('cmp_nvim_lsp')

    local capabilities = cmp_lsp.default_capabilities()

    local kind_icons = {
      Text = "",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰇽",
      Variable = "󰂡",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰅲",
    }

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

          -- For `mini.snippets` users:
          -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
          -- insert({ body = args.body }) -- Insert at cursor
          -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          -- require("cmp.config").set_onetime({ sources = {} })
        end,
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        expandable_indicator = false,
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
          -- Source
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            path = "[Path]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[LaTeX]",
            vsnip = "[VSnip]",
          })[entry.source.name]
          return vim_item
        end
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'path' },
        { name = 'buffer' },
        { name = "cmdline" }
      })
    })

    for _, server_name in pairs(servers) do
      if server_name == 'tailwindcss' then
        lspconfig.tailwindcss.setup({
          capabilities = capabilities,
          settings = {
            tailwindCSS = {
              classFunctions = { "cva", "cx" },
            },
          },
        })
      else
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end
    end
  end
}
