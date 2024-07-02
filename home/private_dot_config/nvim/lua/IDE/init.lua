-- set up lazy.nvim
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  })
end

vim.opt.rtp:prepend(lazy_path)

-- setup custom config
local modules = {
  "IDE.core.editor",
  "IDE.core.mappings",
  "IDE.core.plugins",
  "IDE.core.autocmds",
}

for _, module in ipairs(modules) do
  require(module)
end
