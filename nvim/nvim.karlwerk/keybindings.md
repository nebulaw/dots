# Neovim Keybindings

Leader is `<Space>`. Mappings come from `lua/liv/config/keymaps.lua` and `lua/liv/plugins/*.lua`.

**Contents**

1. [Leader Map at a Glance](#leader-map-at-a-glance)
2. [Files and Search](#files-and-search)
3. [Buffers, Windows and Tabs](#buffers-windows-and-tabs)
4. [Editing](#editing)
5. [LSP](#lsp)
6. [Diagnostics](#diagnostics)
7. [Git](#git)
8. [Completion](#completion)
9. [Inside Plugin Windows](#inside-plugin-windows)
10. [Commands](#commands)
11. [Gotchas](#gotchas)
12. [Vim Reference](#vim-reference)

---

## Leader Map at a Glance

| Prefix      | Group                             |
| ----------- | --------------------------------- |
| `<leader>b` | Buffers                           |
| `<leader>c` | Code (LSP actions, rename)        |
| `<leader>f` | Format / recent files             |
| `<leader>g` | Git                               |
| `<leader>t` | Tabs, colorscheme                 |
| `<leader>y` | Yank paths and code blocks        |
| `;`         | Surround, plus LSP incoming calls |

---

## Files and Search

All pickers are [snacks.nvim](https://github.com/folke/snacks.nvim). Hidden files are included.

| Key                | Action                                             |
| ------------------ | -------------------------------------------------- |
| `<leader><leader>` | Find files                                         |
| `<leader>lr`       | Live grep                                          |
| `<leader>fo`       | Recent files                                       |
| `<leader>bl`       | List buffers (jumps to the tab already showing it) |
| `<leader>;`        | Resume last picker                                 |
| `<leader>e`        | File tree (snacks explorer)                        |
| `<leader>o`        | File explorer (oil, floating)                      |
| `<leader>tc`       | Change colorscheme                                 |
| `<leader>nl`       | Notification history                               |
| `<leader>h`        | Clear search highlight                             |

### Paths

| Key          | Mode   | Action                                                              |
| ------------ | ------ | ------------------------------------------------------------------- |
| `<leader>yf` | Normal | Yank relative path (`file#L42`; entry under cursor in oil/explorer) |
| `<leader>yp` | Normal | Yank absolute path                                                  |
| `<leader>ym` | Visual | Yank selection as a Markdown code block with filename and line      |

---

## Buffers, Windows and Tabs

### Buffers

| Key          | Action             |
| ------------ | ------------------ |
| `<leader>bn` | Next buffer        |
| `<leader>bp` | Previous buffer    |
| `<leader>bx` | Delete all buffers |
| `<leader>bl` | Pick a buffer      |

### Windows

| Key            | Action         |
| -------------- | -------------- |
| `<C-h/j/k/l>`  | Move to window |
| `<C-w><Left>`  | Narrow window  |
| `<C-w><Right>` | Widen window   |

### Tabs

| Key          | Action       |
| ------------ | ------------ |
| `<leader>te` | New tab      |
| `<leader>tx` | Close tab    |
| `<leader>tn` | Next tab     |
| `<leader>tp` | Previous tab |

### Save and Quit

The quit keys are forced: unsaved changes are discarded.

| Key      | Mode           | Action                     |
| -------- | -------------- | -------------------------- |
| `<C-s>`  | Normal, Insert | Save                       |
| `<C-q>`  | Normal, Insert | Quit window without saving |
| `<C-x>q` | Normal, Insert | Quit all without saving    |
| `<C-x>s` | Normal, Insert | Save and quit              |
| `<C-x>a` | Normal, Insert | Save all and quit          |

---

## Editing

| Key          | Mode           | Action                             |
| ------------ | -------------- | ---------------------------------- |
| `jk`         | Insert         | Exit insert mode                   |
| `>` / `<`    | Normal         | Indent / unindent line             |
| `+` / `-`    | Normal         | Increment / decrement number       |
| `<C-a>`      | Normal         | Select all                         |
| `<leader>ff` | Normal, Visual | Format file or selection (conform) |

### Registers Are Left Alone

`d`, `D`, `c`, `C` (and so `dd`, `dw`, `cc`, ...) delete into the black hole register, and `p` in visual mode pastes without yanking the replaced text. Only yanks reach the clipboard (`clipboard=unnamedplus`).

### Comments (mini.comment)

| Key           | Action                                   |
| ------------- | ---------------------------------------- |
| `gcc`         | Toggle comment on line                   |
| `gc` + motion | Toggle comment on motion                 |
| `gc` (visual) | Toggle comment on selection              |
| `dgc`, `cgc`  | `gc` as a text object: the comment block |

Comment style follows the language under the cursor (JSX in TSX, CSS in HTML).

### Surround (mini.surround)

Prefix is `;` instead of the usual `s`.

| Key                  | Action                          |
| -------------------- | ------------------------------- |
| `;a` + motion + char | Add surrounding                 |
| `;d` + char          | Delete surrounding              |
| `;r` + old + new     | Replace surrounding             |
| `;f` / `;F`          | Find surrounding right / left   |
| `;h` + char          | Highlight surrounding           |
| `;n`                 | Change how many lines to search |

| Example | Result                                      |
| ------- | ------------------------------------------- |
| `;aiw"` | Surround word with `"`                      |
| `;a2w(` | Surround 2 words with `( )`                 |
| `;aiwt` | Surround word with a tag (prompts for name) |
| `;d"`   | Delete surrounding `"`                      |
| `;r"'`  | Replace `"` with `'`                        |

`(`, `[`, `{` add inner spaces; `)`, `]`, `}` do not.

### Multiple Cursors (vim-visual-multi)

| Key                   | Action                                |
| --------------------- | ------------------------------------- |
| `<C-n>`               | Select word, then add next occurrence |
| `<C-Down>` / `<C-Up>` | Add cursor below / above              |
| `n` / `N`             | Next / previous occurrence            |
| `q` / `Q`             | Skip current / remove current         |
| `<Tab>`               | Switch cursor and extend mode         |
| `<Esc>`               | Exit                                  |

### Auto Pairs

mini.pairs closes brackets and quotes in insert and command-line mode.

---

## LSP

Buffer-local, active once a server attaches. Neovim's default `grn`/`grr`/`gra`/... maps are removed so `gr` is instant.

### Navigation

| Key         | Action                                                         |
| ----------- | -------------------------------------------------------------- |
| `gd`        | Go to definition                                               |
| `gD`        | Go to declaration                                              |
| `gy`        | Go to type definition                                          |
| `gr`        | References                                                     |
| `gI`        | Source definition (TypeScript, skips `.d.ts`) / implementation |
| `;c`        | Incoming calls                                                 |
| `]]` / `[[` | Next / previous reference of the word under cursor             |
| `gO`        | Document symbols (Neovim default)                              |

### Information

| Key          | Action              |
| ------------ | ------------------- |
| `K`          | Hover documentation |
| `gK`         | Signature help      |
| `<leader>i`  | Toggle inlay hints  |
| `<leader>cl` | LSP info            |

### Actions

| Key          | Mode           | Action                                |
| ------------ | -------------- | ------------------------------------- |
| `<leader>ca` | Normal, Visual | Code action                           |
| `<leader>cr` | Normal         | Rename symbol                         |
| `<leader>cR` | Normal         | Rename file (updates imports via LSP) |

---

## Diagnostics

| Key         | Action                                      |
| ----------- | ------------------------------------------- |
| `<leader>d` | Diagnostics picker                          |
| `]d` / `[d` | Next / previous diagnostic (Neovim default) |
| `<C-w>d`    | Diagnostic float at cursor (Neovim default) |

---

## Git

### Pickers and Tools

| Key          | Action         |
| ------------ | -------------- |
| `<leader>gg` | Lazygit        |
| `<leader>gS` | Git status     |
| `<leader>gd` | Git diff hunks |
| `<leader>gl` | Git log        |
| `<leader>gr` | Git branches   |

In lazygit, `e` closes it and opens the file in the window you launched it from.

### Hunks (mini.diff)

| Key             | Action                                    |
| --------------- | ----------------------------------------- |
| `]c` / `[c`     | Next / previous hunk                      |
| `]H` / `[H`     | Last / first hunk                         |
| `<leader>gah`   | Stage hunk under cursor                   |
| `<leader>gaf`   | Stage file (saves first)                  |
| `gh` + motion   | Apply (stage) hunks in range              |
| `gH` + motion   | Reset hunks in range                      |
| `gh` (text obj) | Hunk under cursor, e.g. `ygh`             |
| `<leader>gv`    | Toggle diff overlay (old lines above new) |

### Blame (gitsigns)

| Key          | Action                                                               |
| ------------ | -------------------------------------------------------------------- |
| `<leader>gb` | Blame line (popup)                                                   |
| `<leader>gB` | Blame buffer                                                         |
| `<leader>go` | Open the file as of the commit that last changed this line (new tab) |

---

## Completion

blink.cmp with the `enter` preset. Docs pop up automatically after 200 ms.

| Key                 | Action                                |
| ------------------- | ------------------------------------- |
| `<C-Space>`         | Open menu / toggle docs               |
| `<C-n>` / `<C-p>`   | Next / previous item                  |
| `<Up>` / `<Down>`   | Next / previous item                  |
| `<CR>`              | Accept                                |
| `<C-e>`             | Close menu                            |
| `<C-b>` / `<C-f>`   | Scroll docs                           |
| `<Tab>` / `<S-Tab>` | Jump to next / previous snippet field |
| `<C-k>`             | Toggle signature help                 |

---

## Inside Plugin Windows

### Oil (`<leader>o`)

Edit the buffer like text and `:w` to apply creates, renames and deletes.

| Key               | Action                       |
| ----------------- | ---------------------------- |
| `<CR>`            | Open file / enter directory  |
| `h` / `-`         | Parent directory             |
| `_`               | Current working directory    |
| `g.`              | Toggle hidden files          |
| `<C-p>`           | Preview                      |
| `<C-s>` / `<C-t>` | Open in vertical split / tab |
| `g?`              | Show all keys                |
| `q`               | Close                        |

### Snacks Pickers

| Key                              | Action                       |
| -------------------------------- | ---------------------------- |
| `<C-n>`/`<C-p>`, `<C-j>`/`<C-k>` | Move through results         |
| `<CR>`                           | Open                         |
| `<Tab>`                          | Select / deselect item       |
| `<C-s>` / `<C-v>` / `<C-t>`      | Open in split / vsplit / tab |
| `<C-b>` / `<C-f>`                | Scroll preview               |
| `?`                              | Show all keys (list window)  |
| `<C-q>` / `<Esc>`                | Close                        |

---

## Commands

| Command            | Action                                       |
| ------------------ | -------------------------------------------- |
| `:ToggleFormatter` | Toggle format on save for all buffers        |
| `:GitLink`         | Copy a permalink to the current line(s)      |
| `:GitLink!`        | Open that permalink in the browser           |
| `:TodoQuickFix`    | List `TODO`/`FIXME`/... comments in quickfix |
| `:Mason`           | Manage LSP servers and formatters            |

---

## Gotchas

- `>` and `<` are single-line indent in normal mode, so `>ip` no longer works as an operator. Use visual mode: `vip>`.
- `;` is the surround prefix, so the built-in "repeat `f`/`t`" `;` waits for `timeoutlen` (500 ms). `,` is unaffected.
- `+`/`-` replace `<C-a>`/`<C-x>` for numbers, since `<C-a>` selects all.

---

# Vim Reference

## Text Objects

| Motion      | Target                       |
| ----------- | ---------------------------- |
| `iw` / `aw` | Inner/around word            |
| `i"` / `a"` | Inner/around quotes          |
| `i'` / `a'` | Inner/around single quotes   |
| `i(` / `a(` | Inner/around parentheses     |
| `i{` / `a{` | Inner/around braces          |
| `i[` / `a[` | Inner/around brackets        |
| `it` / `at` | Inner/around HTML tag        |
| `ip` / `ap` | Inner/around paragraph       |
| `is` / `as` | Inner/around sentence        |
| `gc`        | Comment block (mini.comment) |
| `gh`        | Git hunk (mini.diff)         |

## Common Combos

| Command | Action                    |
| ------- | ------------------------- |
| `ciw`   | Change word under cursor  |
| `ci"`   | Change inside quotes      |
| `ca(`   | Change around parentheses |
| `diw`   | Delete word               |
| `dap`   | Delete paragraph          |
| `dt,`   | Delete until comma        |
| `df,`   | Delete including comma    |
| `yi{`   | Yank inside braces        |
| `vip`   | Select paragraph          |
| `vf)`   | Select until `)`          |
| `=ap`   | Auto-indent paragraph     |
| `vip>`  | Indent paragraph          |
| `vip<`  | Unindent paragraph        |
| `gUiw`  | Uppercase word            |
| `guiw`  | Lowercase word            |
| `g~iw`  | Toggle case of word       |
| `~`     | Toggle case of character  |

## Registers

Yanks already go to the system clipboard, and deletes do not touch any register.

| Command | Action                |
| ------- | --------------------- |
| `"ay`   | Yank to register a    |
| `"ap`   | Paste from register a |
| `"0p`   | Paste last yank       |
| `:reg`  | View all registers    |

## Marks

| Command  | Action                     |
| -------- | -------------------------- |
| `ma`     | Set mark a                 |
| `` `a `` | Jump to mark a (exact)     |
| `'a`     | Jump to mark a (line)      |
| `` `. `` | Jump to last edit          |
| `` `" `` | Jump to last exit position |
| `''`     | Jump to last position      |
| `:marks` | View all marks             |

Files reopen at the last cursor position automatically.

## Macros

| Command | Action              |
| ------- | ------------------- |
| `qa`    | Record macro to a   |
| `q`     | Stop recording      |
| `@a`    | Play macro a        |
| `@@`    | Repeat last macro   |
| `10@a`  | Play macro 10 times |

The statusline shows the register while recording.

## Jumps

| Command | Action                     |
| ------- | -------------------------- |
| `<C-o>` | Jump back                  |
| `<C-i>` | Jump forward               |
| `gi`    | Go to last insert position |
| `gv`    | Reselect last visual       |
| `g;`    | Go to older change         |
| `g,`    | Go to newer change         |

## Search

| Command   | Action                                 |
| --------- | -------------------------------------- |
| `*`       | Search word under cursor               |
| `#`       | Search word backwards                  |
| `n` / `N` | Next / previous match                  |
| `gn`      | Select next match                      |
| `cgn`     | Change next match (then `.` to repeat) |

## Folds

Folds come from treesitter and start open.

| Command     | Action            |
| ----------- | ----------------- |
| `za`        | Toggle fold       |
| `zc` / `zo` | Close / open fold |
| `zM` / `zR` | Close / open all  |
