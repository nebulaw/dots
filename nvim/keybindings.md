# Neovim Keybindings

## Navigation (flash.nvim)
| Key | Action |
|-----|--------|
| `s` + chars | Jump to any visible location |
| `S` | Select treesitter node |
| `f`/`F`/`t`/`T` | Enhanced f/t with labels |

## LSP (lspsaga)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gp` | Peek definition (floating window) |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `ca` | Code actions |
| `<leader>r` | Rename symbol |
| `<leader>p` | Rename across project |
| `<leader>o` | Outline sidebar |
| `<leader>lf` | Find references |
| `<leader>db` | Buffer diagnostics |
| `<leader>dl` | Line diagnostics |

## File Navigation
| Key | Action |
|-----|--------|
| `<space><space>` | Find files |
| `<space>ll` | Live grep (search text) |
| `<space>bb` | Open buffers |
| `<space>fo` | Recent files |
| `<space>ff` | File browser |
| `<space>e` | Toggle neo-tree |
| `<space>cs` | Colorschemes |
| `<space>t` | Trouble diagnostics |
| `<space>dd` | Telescope diagnostics |
| `<space>h` | Clear search highlights |

## Git (telescope)
| Key | Action |
|-----|--------|
| `<space>gf` | Git files |
| `<space>gs` | Git status |
| `<space>gb` | Git branches |
| `<space>gc` | Git commits |

## Editing
| Key | Action |
|-----|--------|
| `gcc` | Toggle comment line |
| `gc` + motion | Comment region |
| `sa` + motion + char | Surround add |
| `sd` + char | Surround delete |
| `sr` + old + new | Surround replace |
| `+` / `-` | Increment/decrement number |
| `<C-a>` | Select all |
| `dd` | Delete line (void register) |
| `jk` | Exit insert mode |

## Surround Examples
| Command | Result |
|---------|--------|
| `saiw"` | Surround word with " |
| `sa2w(` | Surround 2 words with () |
| `sd"` | Delete surrounding " |
| `sr"'` | Replace " with ' |

## Buffers/Tabs
| Key | Action |
|-----|--------|
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>ba` | Close all buffers |
| `tn` | New tab |
| `tt` | Next tab |
| `tc` | Close tab |
| `Tn` | Next tab |
| `Tp` | Previous tab |

## Windows
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate windows |
| `<C-w><left>` | Decrease width |
| `<C-w><right>` | Increase width |

## File Operations
| Key | Action |
|-----|--------|
| `<C-s>` | Save |
| `<C-q>` | Quit buffer |
| `<C-x>q` | Quit all |
| `<C-x>s` | Save & quit |
| `<C-x>a` | Save all & quit |
| `<C-x>r` | Find & replace (:%s/) |

## Execution
| Key | Action |
|-----|--------|
| `<C-c>p` | Run Python |
| `<C-c>c` | Compile & run C |
| `<C-c>j` | Run Java |
| `<C-c>o` | Run OCaml |

## Completion (blink.cmp)
| Key | Action |
|-----|--------|
| `<C-o>` | Trigger completion |
| `<C-e>` | Cancel |
| `<CR>` | Confirm |
| `<C-b>` / `<C-f>` | Scroll docs |

---

# Vim Motions

## Text Objects
| Motion | Target |
|--------|--------|
| `iw` / `aw` | Inner/around word |
| `i"` / `a"` | Inner/around quotes |
| `i'` / `a'` | Inner/around single quotes |
| `i(` / `a(` | Inner/around parentheses |
| `i{` / `a{` | Inner/around braces |
| `i[` / `a[` | Inner/around brackets |
| `it` / `at` | Inner/around HTML tag |
| `ip` / `ap` | Inner/around paragraph |
| `is` / `as` | Inner/around sentence |

## Common Combos
| Command | Action |
|---------|--------|
| `ciw` | Change word under cursor |
| `ci"` | Change inside quotes |
| `ca(` | Change around parentheses |
| `diw` | Delete word |
| `dap` | Delete paragraph |
| `dt,` | Delete until comma |
| `df,` | Delete including comma |
| `yi{` | Yank inside braces |
| `vip` | Select paragraph |
| `vf)` | Select until ) |
| `=ap` | Auto-indent paragraph |
| `>ip` | Indent paragraph |
| `<ip` | Unindent paragraph |
| `gUiw` | Uppercase word |
| `guiw` | Lowercase word |
| `g~iw` | Toggle case word |
| `~` | Toggle case char |

## Registers
| Command | Action |
|---------|--------|
| `"ay` | Yank to register a |
| `"ap` | Paste from register a |
| `"0p` | Paste last yank (not delete) |
| `"+y` | Yank to system clipboard |
| `"+p` | Paste from system clipboard |
| `:reg` | View all registers |

## Marks
| Command | Action |
|---------|--------|
| `ma` | Set mark a |
| `` `a `` | Jump to mark a (exact) |
| `'a` | Jump to mark a (line) |
| `` `. `` | Jump to last edit |
| `` `" `` | Jump to last exit position |
| `''` | Jump to last position |
| `:marks` | View all marks |

## Macros
| Command | Action |
|---------|--------|
| `qa` | Record macro to a |
| `q` | Stop recording |
| `@a` | Play macro a |
| `@@` | Repeat last macro |
| `10@a` | Play macro 10 times |

## Jumps
| Command | Action |
|---------|--------|
| `<C-o>` | Jump back |
| `<C-i>` | Jump forward |
| `gi` | Go to last insert position |
| `gv` | Reselect last visual |
| `g;` | Go to older change |
| `g,` | Go to newer change |

## Search
| Command | Action |
|---------|--------|
| `*` | Search word under cursor |
| `#` | Search word backwards |
| `n` / `N` | Next/previous match |
| `gn` | Select next match |
| `cgn` | Change next match (then `.` to repeat) |

---

# Plugin Features

## Flash.nvim
- `s` then type visible chars → jump labels appear
- `S` → treesitter node selection
- Works in operator-pending: `ds` (delete to flash target)

## Which-key
- Press `<space>` and wait → shows all leader mappings

## Neo-tree
- `<space>e` toggle
- `Y` in tree → copy path to clipboard
- `a` → add file
- `d` → delete
- `r` → rename

## Telescope
- `<C-n>/<C-p>` → navigate results
- `<C-v>` → open in vsplit
- `<C-x>` → open in split
- `<C-t>` → open in tab
- `q` → close (normal mode)

## Gitsigns
- Signs in gutter show git changes
- `]c` / `[c` → next/prev hunk

## Trouble
- `<space>t` → toggle diagnostics window
