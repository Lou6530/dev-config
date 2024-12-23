local state = {
  floating = { buf = -1, win = -1 },
}

local function open_floating_window(opts)
  -- Get the current screen dimensions
  local ui = vim.api.nvim_list_uis()[1]
  local screen_width = ui.width
  local screen_height = ui.height

  -- Set default width and height to 80% of the screen dimensions
  local default_width = math.floor(screen_width * 0.8)
  local default_height = math.floor(screen_height * 0.8)

  -- Use provided width and :height, or default if not specified
  local width = opts and opts.width or default_width
  local height = opts and opts.height or default_height

  -- Calculate the position to center the window
  local col = math.floor((screen_width - width) / 2)
  local row = math.floor((screen_height - height) / 2)

  -- Create a new buffer
  local buf = nil

  if opts and vim.api.nvim_buf_is_valid(opts.buf) then
    -- Use the provided buffer if it is valid
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end
  -- Define the window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded", -- Optional: "none", "single", "double", "rounded", etc.
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  -- Return the buffer and window IDs in case they need to be referenced
  return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("Floaterminal", function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = open_floating_window({ buf = state.floating.buf })
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end, {})
