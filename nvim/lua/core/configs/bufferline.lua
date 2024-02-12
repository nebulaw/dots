-- Bufferline

-- safe load
local status, bufferline = pcall(require, 'bufferline')
if not status then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    animation = true,
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_icons = false,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = false,
    max_name_length = 12,
    color_icons = true,
    no_name = "[No Name]",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, _, _)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Files Explorer",
        highlight = "Directory",
        text_align = "left",
        separator = true,
      }
    },

  },
}

nmap('<tab>', '<cmd>BufferLineCycleNext<CR>')
nmap('<S-tab>', '<cmd>BufferLineCyclePrev<CR>')

