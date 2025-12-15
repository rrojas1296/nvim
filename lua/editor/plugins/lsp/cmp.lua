return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',


    -- Vim vscode snippets (This works with vsnip and other snippet engines)
    -- 'stevearc/vim-vscode-snippets',

    -- For luasnip users.
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    "rafamadriz/friendly-snippets"

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
    local snippets = require('luasnip.loaders.from_lua')
    local lspconfig = require('lspconfig')
    local cmp_lsp = require('cmp_nvim_lsp')
    local vscode_snippets = require("luasnip.loaders.from_vscode")
    local ls = require("luasnip")

    -- Cambia la tecla de expansión/salto hacia adelante
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    -- Salto hacia atrás en el snippet
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

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

    snippets.lazy_load({ paths = { "~/.config/nvim/lua/editor/snippets" } })
    vscode_snippets.lazy_load()

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body)     -- For `vsnip` users.
          ls.lsp_expand(args.body) -- For `luasnip` users.
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
            codeium = "[Codeium]",
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
        { name = 'codeium' },
        -- { name = 'vsnip' },   -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'path' },
        { name = 'buffer' },
      })
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    })

    for _, server_name in pairs(servers) do
      if server_name == 'tailwindcss' then
        vim.lsp.config(server_name, {
          capabilities = capabilities,
          settings = {
            tailwindCSS = {
              classFunctions = { "cva", "cx" },
            },
          },
        })
      else
        vim.lsp.config(server_name, {
          capabilities = capabilities,
        })
      end
    end
  end
}
