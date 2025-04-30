return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    local status_ok_2, noice = pcall(require, "noice")
    local status_ok_1, notify = pcall(require, "notify")

    if not status_ok_1 then
      return
    end
    if not status_ok_2 then
      return
    end

    notify.setup({
      render = "compact",
      merge_duplicates = true,
    })

    noice.setup({
      presets = {
        bottom_search = true,
      },
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },

      }
    })
  end
}
