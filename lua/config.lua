local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup('plugins')

-- enable 24-bit color
vim.g.termuicolors = true


  local function trim(s)
    return s:match('^%s*(.-)%s*$')
  end

-- load init.lua in .git directory if it exists
local function get_git_root()
    local git_root = nil
    local f = io.popen("git rev-parse --show-toplevel 2>/dev/null")
    if f then
        git_root = trim(f:read("*a"))
        f:close()
    end
    return git_root
end

local git_path = get_git_root()

if git_path ~= "" then
    local git_init_lua = git_path .. "/.git/init.lua"
    local file = io.open(git_init_lua, "r")
    if file then
        file:close()
        dofile(git_init_lua)  -- Executes the Lua file
    end
end

