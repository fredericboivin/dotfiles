-- Find dotfiles
local M = {}

function M.find_dotfiles()
  require("telescope.builtin").git_files {
    prompt_title = "<Dotfiles>",
    cwd = "$HOME/dotfiles/",
  }
end

return M
