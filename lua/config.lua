local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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

-- enable 24-bit color before colorschemes/plugins load
vim.opt.termguicolors = true

require('lazy').setup('plugins')

local function get_git_root()
    local result = vim.system({ "git", "rev-parse", "--show-toplevel" }, { text = true }):wait()
    if result.code ~= 0 or not result.stdout then
        return nil
    end

    local git_root = vim.trim(result.stdout)
    if git_root == "" then
        return nil
    end

    return git_root
end

local git_path = get_git_root()

if git_path then
    local git_init_lua = git_path .. "/.git/init.lua"
    if vim.fn.filereadable(git_init_lua) == 1 then
        dofile(git_init_lua)
    end

    local git_vimrc = git_path .. "/.git/vimrc"
    if vim.fn.filereadable(git_vimrc) == 1 then
        vim.cmd.source(vim.fn.fnameescape(git_vimrc))
    end

    local git_tags = git_path .. "/.git/tags"
    if vim.fn.filereadable(git_tags) == 1 then
        vim.opt.tags:prepend(git_tags)
    end
end
