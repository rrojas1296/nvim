return {
  {
    "<leader>a", "<cmd>Dashboard<cr>", desc = "Dashboard", mode = "n", icon = "󰕮"
  },
  {
    "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files", mode = "n",
  },
  {
    "<leader>F", "<cmd>Telescope live_grep<cr>", desc = "Find Text", mode = "n",
  },
  {
    "<leader>w", "<cmd>w<cr>", desc = "Save", mode = "n", icon = ""
  },
  {
    "<leader>r",
    group = "Renamer",
    {
      "<leader>rn", "<cmd>GrugFar<cr>", desc = "Rename multiple files", mode = "n"
    },
    {
      "<leader>rw", "<cmd>GrugFarWithin<cr>", desc = "Rename in current file", mode = "n"
    }
  },
  {
    "<leader>v",
    group = "Split",
    icon = "",
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
    "<leader>b",
    group = "Buffer",
    {
      "<leader>bc", "<cmd>w|%bd!|e#|bd#<cr>", desc = "Close Buffer except current", mode = "n",
    }

  },
  {
    "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer", mode = "n", icon = ""
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
    icon = "󰛦",
    {
      "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "n",
    },
    {
      "<leader>ls", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show diagnostics", mode = "n",
    },
  },
  {
    "<leader>o",
    group = "Flutter",
    icon = "",
    {
      "<leader>or", "<cmd>FlutterRun<cr>", desc = "Run", mode = "n",
    },
    {
      "<leader>ot", "<cmd>FlutterLogToggle<cr>", desc = "Toggle Logs", mode = "n"
    },
    {
      "<leader>of", "<cmd>Telescope flutter commands<cr>", desc = "Flutter Commands", mode = "n",
    },
    {
      "<leader>oe", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators", mode = "n",
    }
  },
  {
    "<leader>t",
    group = "Terminal",
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
