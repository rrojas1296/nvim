return {
  'brenoprata10/nvim-highlight-colors',
  config = function ()
    
    local status_ok, colors = pcall(require, "nvim-highlight-colors")

    if not status_ok then
      return
    end

    colors.setup()
  end
}
