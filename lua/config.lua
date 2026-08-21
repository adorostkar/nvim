local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  if vim.v.shell_error ~= 0 or not vim.uv.fs_stat(lazypath) then
    error("Failed to install lazy.nvim:\n" .. output)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Enable 24-bit color before colorschemes load.
vim.opt.termguicolors = true

require("lazy").setup("plugins", {
  change_detection = { notify = false },
  rocks = { enabled = false },
})

local loaded_git_dirs = {}

local function run_trusted_file(path, is_lua)
  if vim.fn.filereadable(path) == 0 then
    return
  end

  local contents = vim.secure.read(path)
  if not contents then
    return
  end

  local ok, err
  if is_lua then
    local chunk
    chunk, err = load(contents, "@" .. path)
    if chunk then
      ok, err = pcall(chunk)
    end
  else
    ok, err = pcall(vim.cmd, contents)
  end

  if not ok then
    vim.notify("Failed to load project config " .. path .. ": " .. tostring(err), vim.log.levels.ERROR)
  end
end

local function load_project_config()
  local cwd = vim.fn.getcwd()
  local root = vim.fs.root(cwd, ".git")
  if not root then
    return
  end

  local dot_git = root .. "/.git"
  local stat = vim.uv.fs_stat(dot_git)
  local git_dir = dot_git
  if stat and stat.type == "file" then
    local line = (vim.fn.readfile(dot_git, "", 1)[1] or ""):match("^gitdir:%s*(.+)$")
    if not line then
      return
    end
    if line:match("^/") or line:match("^%a:[/\\]") then
      git_dir = vim.fs.normalize(line)
    else
      git_dir = vim.fs.normalize(root .. "/" .. line)
    end
  end

  if loaded_git_dirs[git_dir] then
    return
  end
  loaded_git_dirs[git_dir] = true

  run_trusted_file(git_dir .. "/init.lua", true)
  run_trusted_file(git_dir .. "/vimrc", false)

  local tags = git_dir .. "/tags"
  if vim.fn.filereadable(tags) == 1 then
    vim.opt.tags:prepend(tags)
  end
end

load_project_config()
vim.api.nvim_create_autocmd("DirChanged", { callback = load_project_config })
