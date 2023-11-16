local status_ok,neodev = pcall(require,'neodev')
if not status_ok then
  return
end
neodev.setup()

-- neodev.setup({
--   override = function(root_dir, library)
--     if root_dir:find("/etc/nixos", 1, true) == 1 then
--       library.enabled = true
--       library.plugins = true
--     end
--   end,
-- })
