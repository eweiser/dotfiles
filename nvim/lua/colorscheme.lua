-- define your colorscheme here
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1
local colorscheme = 'sonokai'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
