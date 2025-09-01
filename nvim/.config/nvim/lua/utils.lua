local M = {}

--- Toggle React JSX single-line comments across a visual selection: {/* ... */}
--- @param srow number starting row of selection
--- @param erow number ending row of selection
function M.toggle_react_comment_range(srow, erow)
  local function get_line(ln)
    return vim.api.nvim_buf_get_lines(0, ln - 1, ln, false)[1] or ''
  end

  local function is_react_commented(line)
    return line:match('^%s*{%/%*.-%*/}%s*$') ~= nil
  end

  -- determine add/remove comment
  local all_commented = true
  for ln = srow, erow do
    local txt = get_line(ln)
    if txt:match('%S') and not is_react_commented(txt) then
      all_commented = false
      break
    end
  end

  if all_commented then
    -- uncomment
    for ln = srow, erow do
      local txt = get_line(ln)
      local indent, inner = txt:match('^(%s*){%/%*%s?(.-)%s?%*/}%s*$')
      if indent then
        vim.api.nvim_buf_set_lines(0, ln - 1, ln, false, { indent .. inner })
      end
    end
  else
    -- comment
    for ln = srow, erow do
      local txt = get_line(ln)
      if txt:match('%S') and not is_react_commented(txt) then
        local indent = txt:match('^(%s*)') or ''
        local content = txt:gsub('^%s*', '')
        vim.api.nvim_buf_set_lines(0, ln - 1, ln, false, { indent .. '{/* ' .. content .. ' */}' })
      end
    end
  end
end

return M
