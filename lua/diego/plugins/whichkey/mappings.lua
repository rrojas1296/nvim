return {
  {
    "<leader>a", "<cmd>Dashboard<cr>", desc = "Dashboard", mode = "n",
  },
  {
    "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files", mode = "n",
  },
  {
    "<leader>F", "<cmd>Telescope live_grep<cr>", desc = "Find Text", mode = "n",
  },
  {
    "<leader>w", "<cmd>w<cr>", desc = "Save", mode = "n",
  },

  {
    "<leader>v",
    group = "Slip",

    {
      "<leader>vs", "<cmd>vsp<cr>", desc = "Split", mode = "n",
    },

    {
      "<leader>vc", "<cmd>on<cr>", desc = "Close all splits", mode = "n",
    },
  },
  {
    "<leader>c", "<cmd>bdelete<cr>", desc = "Close Buffer", mode = "n",
  },
  {
    "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", mode = "n",
  },
  {
    "<leader>q", "<cmd>q!<cr>", desc = "Quit", mode = "n",
  },
  {
    "<leader>g",
    group = 'Git',
    {
      "<leader>gc", "<cmd>Git commit<cr>", desc = "Make Commit", mode = "n",

    },
    {
      "<leader>ga", "<cmd>Git add .<cr>", desc = "Add files", mode = "n",
    },
    {
      "<leader>gp", "<cmd>Git push<cr>", desc = "Push Changes", mode = "n",
    },
    {
      "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Search changed files", mode = "n",
    },
    {
      "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Search Branch", mode = "n",
    },
    {
      "<leader>gq", "<cmd>Telescope git_commits<cr>", desc = "Search Commits", mode = "n",
    },
    {
      "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", mode = "n",
    },
    {
      "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit", mode = "n",
    },
    {
      "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame", mode = "n",
    }
  },
  {
    "<leader>l",
    group = "LSP",
    {
      "<leader>ls", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "See Diagnostics", mode = "n",
    },
    {
      "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "n",
    },
    {
      "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format", mode = "n",
    }
  },
  {
    "<leader>t",
    group = "Terminal",
    {
      "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node", mode = "n",
    },
    {
      "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU", mode = "n",
    },
    {
      "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop", mode = "n",
    },
    {
      "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python", mode = "n",
    },
    {
      "<leader>tg", "<cmd>lua _GIT_BASH_TOGGLE()<cr>", desc = "Git Bash", mode = "n",
    },
    {
      "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", mode = "n",
    },
    {
      "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", mode = "n",
    },
    {
      "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", mode = "n",
    },
  }
}
