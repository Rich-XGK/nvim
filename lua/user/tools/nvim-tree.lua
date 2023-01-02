--[[default mappings
  >
  view.mappings.list = { -- BEGIN_DEFAULT_MAPPINGS
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    { key = "<C-e>",                          action = "edit_in_place" },
    { key = "O",                              action = "edit_no_picker" },
    { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
    { key = "<C-v>",                          action = "vsplit" },
    { key = "<C-x>",                          action = "split" },
    { key = "<C-t>",                          action = "tabnew" },
    { key = "<",                              action = "prev_sibling" },
    { key = ">",                              action = "next_sibling" },
    { key = "P",                              action = "parent_node" },
    { key = "<BS>",                           action = "close_node" },
    { key = "<Tab>",                          action = "preview" },
    { key = "K",                               action = "first_sibling" },
    { key = "J",                              action = "last_sibling" },
    { key = "I",                              action = "toggle_git_ignored" },
    { key = "H",                              action = "toggle_dotfiles" },
    { key = "U",                              action = "toggle_custom" },
    { key = "R",                              action = "refresh" },
    { key = "a",                              action = "create" },
    { key = "d",                              action = "remove" },
    { key = "D",                              action = "trash" },
    { key = "r",                              action = "rename" },
    { key = "<C-r>",                          action = "full_rename" },
    { key = "x",                              action = "cut" },
    { key = "c",                              action = "copy" },
    { key = "p",                              action = "paste" },
    { key = "y",                              action = "copy_name" },
    { key = "Y",                              action = "copy_path" },
    { key = "gy",                             action = "copy_absolute_path" },
    { key = "[e",                             action = "prev_diag_item" },
    { key = "[c",                             action = "prev_git_item" },
    { key = "]e",                             action = "next_diag_item" },
    { key = "]c",                             action = "next_git_item" },
    { key = "-",                              action = "dir_up" },
    { key = "s",                              action = "system_open" },
    { key = "f",                              action = "live_filter" },
    { key = "F",                              action = "clear_live_filter" },
    { key = "q",                              action = "close" },
    { key = "W",                              action = "collapse_all" },
    { key = "E",                              action = "expand_all" },
    { key = "S",                              action = "search_node" },
    { key = ".",                              action = "run_file_command" },
    { key = "<C-k>",                          action = "toggle_file_info" },
    { key = "g?",                             action = "toggle_help" },
    { key = "m",                              action = "toggle_mark" },
    { key = "bmv",                            action = "bulk_move" },
  } -- END_DEFAULT_MAPPINGS
<
]]

local config = {
  --[[
        *nvim-tree.disable_netrw*
        Completely disable netrw
        Type: `boolean`, Default: `false`
      ]]
  disable_netrw = false,
  --[[
        *nvim-tree.hijack_netrw*
        Hijack netrw windows (overridden if |disable_netrw| is `true`)
        Type: `boolean`, Default: `true`
      ]]
  hijack_netrw = true,
  --[[
        *nvim-tree.open_on_setup*
        Will automatically open the tree when running setup if startup buffer is
        a directory, is empty or is unnamed. nvim-tree window will be focused.
        Type: `boolean`, Default: `false`
      ]]
  open_on_setup = false,
  --[[
        *nvim-tree.open_on_setup_file*
        Will automatically open the tree when running setup if startup buffer is a file.
        File window will be focused.
        File will be found if update_focused_file is enabled.
        Type: `boolean`, Default: `false`
      ]]
  open_on_setup_file = false,
  --[[
        *nvim-tree.ignore_buffer_on_setup*
        Will ignore the buffer, when deciding to open the tree on setup.
        Type: `boolean`, Default: `false`
      ]]
  ignore_buffer_on_setup = false,
  --[[
        *nvim-tree.ignore_ft_on_setup*
        List of filetypes that will prevent `open_on_setup` to open.
        You can use this option if you don't want the tree to open
        in some scenarios (eg using vim startify).
        Type: {string}, Default: `{}`
        ]]
  ignore_ft_on_setup = {},
  --[[
        *nvim-tree.ignore_buf_on_tab_change*
        List of filetypes or buffer names that will prevent `open_on_tab` to open.
        Type: {string}, Default: `{}`
      ]]
  ignore_buf_on_tab_change = {},
  --[[
        *nvim-tree.auto_reload_on_write*
        Reloads the explorer every time a buffer is written to.
        Type: `boolean`, Default: `true`
      ]]
  auto_reload_on_write = true,
  --[[
        *nvim-tree.create_in_closed_folder*
        Creating a file when the cursor is on a closed folder will set the
        path to be inside the closed folder, otherwise the parent folder.
       Type: `boolean`, Default: `false`
      ]]
  create_in_closed_folder = true,
  --[[
        *nvim-tree.open_on_tab*
        Opens the tree automatically when switching tabpage or opening a new tabpage
        if the tree was previously open.
        Type: `boolean`, Default: `false`
      ]]
  open_on_tab = true,
  --[[
        *nvim-tree.sort_by*
        Changes how files within the same directory are sorted.
        Can be one of `name`, `case_sensitive`, `modification_time`, `extension` or a function.
        Type: `string` | `function(nodes)`, Default: `"name"`
      ]]
  sort_by = "name",
  --[[
        *nvim-tree.hijack_unnamed_buffer_when_opening*
        Opens in place of the unnamed buffer if it's empty.
        Type: `boolean`, Default: `false`
      ]]
  hijack_unnamed_buffer_when_opening = false,
  --[[
        *nvim-tree.hijack_cursor*
        Keeps the cursor on the first letter of the filename when moving in the tree.
        Type: `boolean`, Default: `false`
      ]]
  hijack_cursor = false,
  --[[
        *nvim-tree.root_dirs*
        Preferred root directories.
        Only relevant when `update_focused_file.update_root` is `true`
        Type: `{string}`, Default: `{}`
      ]]
  root_dirs = { '~/.config/nvim' },
  --[[
        *nvim-tree.prefer_startup_root*
        Prefer startup root directory when updating root directory of the tree.
        Only relevant when `update_focused_file.update_root` is `true`
        Type: `boolean`, Default: `false`
      ]]
  prefer_startup_root = true,
  --[[
        *nvim-tree.sync_root_with_cwd*  (previously `update_cwd`)
        Changes the tree root directory on `DirChanged` and refreshes the tree.
        Type: `boolean`, Default: `false`
      ]]
  sync_root_with_cwd = false,
  --[[
        *nvim-tree.reload_on_bufenter*
        Automatically reloads the tree on `BufEnter` nvim-tree.
        Type: `boolean`, Default: `false
      ]]
  reload_on_bufenter = false,
  --[[
        *nvim-tree.respect_buf_cwd*
        Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
        Type: `boolean`, Default: `false`
      ]]
  respect_buf_cwd = false,
  --[[
        *nvim-tree.hijack_directories*  (previously `update_to_buf_dir`)
        hijacks new directory buffers when they are opened (`:e dir`).
  
          *nvim-tree.hijack_directories.enable*
          Enable the feature.
          Disable this option if you use vim-dirvish or dirbuf.nvim.
          If `hijack_netrw` and `disable_netrw` are `false`, this feature will be disabled.
          Type: `boolean`, Default: `true`
  
          *nvim-tree.hijack_directories.auto_open*
          Opens the tree if the tree was previously closed.
          Type: `boolean`, Default: `true`
      ]]
  hijack_directories = { enable = true, auto_open = true },
  --[[
        *nvim-tree.update_focused_file*
        Update the focused file on `BufEnter`, un-collapses the folders recursively
        until it finds the file.
  
          *nvim-tree.update_focused_file.enable*
          Enable this feature.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.update_focused_file.update_root*  (previously `update_focused_file.update_cwd`)
          Update the root directory of the tree if the file is not under current
          root directory. It prefers vim's cwd and `root_dirs`.
          Otherwise it falls back to the folder containing the file.
          Only relevant when `update_focused_file.enable` is `true`
          Type: `boolean`, Default: `false`
  
          *nvim-tree.update_focused_file.ignore_list*
          List of buffer names and filetypes that will not update the root dir
          of the tree if the file isn't found under the current root directory.
          Only relevant when `update_focused_file.update_root` and
          `update_focused_file.enable` are `true`.
            Type: {string}, Default: `{}`
    ]]
  update_focused_file = { enable = true, update_root = true, ignore_list = {} },
  --[[
        *nvim-tree.system_open*
        Configuration options for the system open command.
  
          *nvim-tree.system_open.cmd*
          The command to run, leaving empty should work but useful if you want to
          override the default command with another one.
          Type: `string`, Default: `""`
  
          *nvim-tree.system_open.args*
          The command arguments as a list.
          Type: {string}, Default: `{}`
    ]]
  system_open = { cmd = "", args = {} },
  --[[
        *nvim-tree.diagnostics*
        Show LSP and COC diagnostics in the signcolumn
  
          *nvim-tree.diagnostics.enable*
          Enable/disable the feature.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.diagnostics.debounce_delay*
          Idle milliseconds between diagnostic event and update.
          Type: `number`, Default: `50` (ms)
  
          *nvim-tree.diagnostics.show_on_dirs*
          Show diagnostic icons on parent directories.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.diagnostics.icons*
          Icons for diagnostic severity.
          Type: `table`, Default: `{ hint = "", info = "", warning = "", error = "" }`
  
        `NOTE`: it will use the default diagnostic color groups to highlight the signs.
        If you wish to customize, you can override these groups:
        - `NvimTreeLspDiagnosticsError`
        - `NvimTreeLspDiagnosticsWarning`
        - `NvimTreeLspDiagnosticsInformation`
        - `NvimTreeLspDiagnosticsHint`
    ]]
  diagnostics = {
    enable = true,
    debounce_delay = 50,
    show_on_dirs = true,
    icons = { hint = "", info = "", warning = "", error = "" }
  },
  --[[
        *nvim-tree.git*
        Git integration with icons and colors.
  
          *nvim-tree.git.enable*
          Enable / disable the feature.
          Type: `boolean`, Default: `true`
  
          *nvim-tree.git.ignore*
          Ignore files based on `.gitignore`. Requires |git.enable| `= true`
          Toggle via the `toggle_git_ignored` action, default mapping `I`.
          Type: `boolean`, Default: `true`
  
          *nvim-tree.git.show_on_dirs*
          Show status icons of children when directory itself has no status icon.
          Type: `boolean`, Default: `true`
  
          *nvim-tree.git.timeout*
          Kills the git process after some time if it takes too long.
          Type: `number`, Default: `400` (ms)
  
        You will still need to set |renderer.icons.show.git| `= true` or
        |renderer.highlight_git| `= true` to be able to see things in the
        tree. This will be changed in the future versions.
  
        The configurable timeout will kill the current process and so disable the
        git integration for the project that takes too long.
        The git integration is blocking, so if your timeout is too long (like not in
        milliseconds but a few seconds), it will not render anything until the git
        process returned the data.
    ]]
  git = { enable = true, ignore = true, show_on_dirs = true, timeout = 400 },
  --[[
        *nvim-tree.filesystem_watchers*
        Will use file system watcher (libuv fs_event) to watch the filesystem for
        changes.
        Using this will disable BufEnter / BufWritePost events in nvim-tree which
        were used to update the whole tree. With this feature, the tree will be
        updated only for the appropriate folder change, resulting in better
        performance.
  
          *nvim-tree.filesystem_watchers.enable*
          Enable / disable the feature.
          Type: `boolean`, Default: `true`
  
          *nvim-tree.filesystem_watchers.debounce_delay*
          Idle milliseconds between filesystem change and action.
          Type: `number`, Default: `50` (ms)
  
          *nvim-tree.filesystem_watchers.ignore_dirs*
          List of vim regex for absolute directory paths that will not be watched.
          Backslashes must be escaped e.g. `"my-project/\\.build$"`. See |string-match|.
          Useful when path is not in `.gitignore` or git integration is disabled.
          Type: {string}, Default: `{}`
    ]]
  filesystem_watchers = { enable = false },
  --[[
        *nvim-tree.on_attach*
        Function ran when creating the nvim-tree buffer.
        This can be used to attach keybindings to the tree buffer.
        When on_attach is "disabled", it will use the older mapping strategy, otherwise it
        will use the newer one.
        >
          on_attach = function(bufnr)
              local inject_node = require("nvim-tree.utils").inject_node
              vim.keymap.set("n", "<leader>n", inject_node(function(node)
                  if node then
                      print(node.absolute_path)
                  end
              end), { buffer = bufnr, noremap = true })
              vim.bo[bufnr].path = "/tmp"
          end
        <
        Type: `function(bufnr)`, Default: `"disable"`
    ]]
  on_attach = "disable",
  --[[
        *nvim-tree.remove_keymaps*
        This can be used to remove the default mappings in the tree.
        - Remove specific keys by passing a `string` table of keys
          eg. {"<C-o>", "<CR>", "o", "<Tab>"}
        - Remove all default mappings by passing `true`
        - Ignore by passing `false`
          Type: `bool` or `{string}`, Default: `false`
    ]]
  remove_keymaps = false,
  --[[
        *nvim-tree.select_prompts*
        Use |vim.ui.select| style prompts. Necessary when using a UI prompt decorator
        such as dressing.nvim or telescope-ui-select.nvim
        Type: `boolean`, Default: `false`
    ]]
  select_prompts = false,
  --[[
        *nvim-tree.view*
        Window / buffer setup.
  
          *nvim-tree.view.adaptive_size*
          Resize the window on each draw based on the longest line.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.view.centralize_selection*
          When entering nvim-tree, reposition the view so that the current node is initially centralized, see |zz|.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.view.hide_root_folder*
          Hide the path of the current working directory on top of the tree.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.view.width*
          Width of the window, can be a `%` string, a number representing columns or a function.
          Type: `string | number | function`, Default: `30`
  
          *nvim-tree.view.side*
          Side of the tree, can be `"left"`, `"right"`.
          Type: `string`, Default: `"left"`
  
          *nvim-tree.view.preserve_window_proportions*
          Preserves window proportions when opening a file.
          If `false`, the height and width of windows other than nvim-tree will be equalized.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.view.number*
          Print the line number in front of each line.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.view.relativenumber*
          Show the line number relative to the line with the cursor in front of each line.
          If the option `view.number` is also `true`, the number on the cursor line
          will be the line number instead of `0`.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.view.signcolumn*
          Show diagnostic sign column. Value can be `"yes"`, `"auto"`, `"no"`.
          Type: `string`, Default: `"yes"`
  
          *nvim-tree.view.mappings*
          Configuration options for |nvim-tree-mappings|
  
            *nvim-tree.view.mappings.custom_only*
            Will use only the provided user mappings and not the default otherwise,
            extends the default mappings with the provided user mappings.
            Type: `boolean`, Default: `false`
  
            *nvim-tree.view.mappings.list*
            A list of keymaps that will extend or override the default keymaps.
            Type: `table`
            Default: see |nvim-tree-default-mappings|
  
          *nvim-tree.view.float*
          Configuration options for floating window
  
            *nvim-tree.view.float.enable*
            Tree window will be floating.
            Type: `boolean`, Default: `false`
  
            *nvim-tree.view.float.quit_on_focus_loss*
            Close the floating tree window when it loses focus.
            Type: `boolean`, Default: `true`
  
            *nvim-tree.view.float.open_win_config*
            Floating window config. See |nvim_open_win| for more details.
            Type: `table` or `function` that returns a table, Default:
              `{`
                `relative = "editor",`
                `border = "rounded",`
                `width = 30,`
                `height = 30,`
                `row = 1,`
                `col = 1,`
              `}`
    ]]
  view = {
    adaptive_size = false,
    centralize_selection = true,
    hide_root_folder = false,
    width = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here

      }
    },
    float = { enable = false }
  },
  --[[
        *nvim-tree.renderer*
        UI rendering setup
  
          *nvim-tree.renderer.add_trailing*
          Appends a trailing slash to folder names.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.renderer.group_empty*
          Compact folders that only contain a single folder into one node in the file tree.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.renderer.full_name*
          Display node whose name length is wider than the width of nvim-tree window in floating window.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.renderer.highlight_git*
          Enable file highlight for git attributes using `NvimTreeGit*` highlight groups.
          This can be used with or without the icons.
          Type: `boolean`, Default: `false`
  
          *nvim-tree.renderer.highlight_opened_files*
          Highlight icons and/or names for opened files.
          Value can be `"none"`, `"icon"`, `"name"` or `"all"`.
          Type: `string`, Default: `"none"`
  
          *nvim-tree.renderer.root_folder_modifier*
          In what format to show root folder. See `:help filename-modifiers` for
          available options.
          Type: `string`, Default: `":~"`
  
          *nvim-tree.renderer.indent_width*
          Number of spaces for an each tree nesting level. Minimum 1.
          Type: `number`, Default: `2`
  
          *nvim-tree.renderer.indent_markers*
          Configuration options for tree indent markers.
  
            *nvim-tree.renderer.indent_markers.enable*
            Display indent markers when folders are open
            Type: `boolean`, Default: `false`
  
            *nvim-tree.renderer.indent_markers.inline_arrows*
            Display folder arrows in the same column as indent marker
            when using |renderer.icons.show.folder_arrow|
            Type: `boolean`, Default: `true`
  
            *nvim-tree.renderer.indent_markers.icons*
            Icons shown before the file/directory. Length 1.
            Type: `table`, Default: `{ corner = "└", edge = "│", item = "│", bottom = "─", none = " ", }`
  
          *nvim-tree.renderer.icons*
          Configuration options for icons.
  
            *nvim-tree.renderer.icons.webdev_colors*
            Use the webdev icon colors, otherwise `NvimTreeFileIcon`.
            Type: `boolean`, Default: `true`
  
            *nvim-tree.renderer.icons.git_placement*
            Place where the git icons will be rendered.
            Can be `"after"` or `"before"` filename (after the file/folders icons)
            or `"signcolumn"` (requires |nvim-tree.view.signcolumn| enabled).
            Note that the diagnostic signs will take precedence over the git signs.
            Type: `string`, Default: `before`
  
            *nvim-tree.renderer.icons.padding*
            Inserted between icon and filename.
            Use with caution, it could break rendering if you set an empty string depending on your font.
            Type: `string`, Default: `" "`
  
            *nvim-tree.renderer.icons.symlink_arrow*
            Used as a separator between symlinks' source and target.
            Type: `string`, Default: `" ➛ "`
  
            *nvim-tree.renderer.icons.show*
            Configuration options for showing icon types.
  
              *nvim-tree.renderer.icons.show.file*
              Show an icon before the file name. `nvim-web-devicons` will be used if available.
                Type: `boolean`, Default: `true`
  
              *nvim-tree.renderer.icons.show.folder*
              Show an icon before the folder name.
                Type: `boolean`, Default: `true`
  
              *nvim-tree.renderer.icons.show.folder_arrow*
              Show a small arrow before the folder node. Arrow will be a part of the
              node when using |renderer.indent_markers|.
                Type: `boolean`, Default: `true`
  
              *nvim-tree.renderer.icons.show.git*
              Show a git status icon, see |renderer.icons.git_placement|
              Requires |git.enable| `= true`
                Type: `boolean`, Default: `true`
  
            *nvim-tree.renderer.icons.glyphs*
            Configuration options for icon glyphs.
  
              *nvim-tree.renderer.icons.glyphs.default*
              Glyph for files. Will be overridden by `nvim-web-devicons` if available.
                Type: `string`, Default: `""`
  
              *nvim-tree.renderer.icons.glyphs.symlink*
              Glyph for symlinks to files.
                Type: `string`, Default: `""`
  
              *nvim-tree.renderer.icons.glyphs.folder*
              Glyphs for directories.
                Type: `table`, Default:
                  `{`
                    `arrow_closed = "",`
                    `arrow_open = "",`
                    `default = "",`
                    `open = "",`
                    `empty = "",`
                    `empty_open = "",`
                    `symlink = "",`
                    `symlink_open = "",`
                  `}`
  
              *nvim-tree.renderer.icons.glyphs.git*
              Glyphs for git status.
                Type: `table`, Default:
                  `{`
                    `unstaged = "✗",`
                    `staged = "✓",`
                    `unmerged = "",`
                    `renamed = "➜",`
                    `untracked = "★",`
                    `deleted = "",`
                    `ignored = "◌",`
                  `}`
  
          *nvim-tree.renderer.special_files*
          A list of filenames that gets highlighted with `NvimTreeSpecialFile`.
          Type: `table`, Default: `{ "Cargo.toml", "Makefile", "README.md", "readme.md", }`
  
          *nvim-tree.renderer.symlink_destination*
          Whether to show the destination of the symlink.
          Type: `boolean`, Default: `true`
    ]]
  renderer = {
    add_trailing = false,
    group_empty = false,
    full_name = false,
    highlight_git = false,
    highlight_opened_files = "icon",
    root_folder_modifier = ":~",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = { corner = "└", edge = "│", item = "│", bottom = "─", none = " " }
    },
    icons = { webdev_colors = true }
  },
  --[[
        *nvim-tree.filters*
        Filtering options.
  
          *nvim-tree.filters.dotfiles*
          Do not show dotfiles: files starting with a `.`
          Toggle via the `toggle_dotfiles` action, default mapping `H`.
           Type: `boolean`, Default: `false`
  
          *nvim-tree.filters.custom*
          Custom list of vim regex for file/directory names that will not be shown.
          Backslashes must be escaped e.g. "^\\.git". See |string-match|.
          Toggle via the `toggle_custom` action, default mapping `U`.
           Type: {string}, Default: `{}`
  
          *nvim-tree.filters.exclude*
          List of directories or files to exclude from filtering: always show them.
          Overrides `git.ignore`, `filters.dotfiles` and `filters.custom`.
           Type: {string}, Default: `{}`
    ]]
  filters = { dotfiles = false, custom = {}, exclude = {} },
  --[[
        *nvim-tree.trash*
        Configuration options for trashing.
  
          *nvim-tree.trash.cmd*
          The command used to trash items (must be installed on your system).
          The default is shipped with glib2 which is a common linux package.
           Type: `string`, Default: `"gio trash"`
  
          *nvim-tree.trash.require_confirm*
          Show a prompt before trashing takes place.
           Type: `boolean`, Default: `true`
    ]]
  trash = { cmd = "trash", require_confirm = true },
  --[[
        *nvim-tree.actions*
        Configuration for various actions.
  
          *nvim-tree.actions.change_dir*
          vim |current-directory| behaviour.
  
          *nvim-tree.actions.change_dir.enable*
          Change the working directory when changing directories in the tree.
            Type: `boolean`, Default: `true`
  
          *nvim-tree.actions.change_dir.global*
          Use `:cd` instead of `:lcd` when changing directories.
          Consider that this might cause issues with the |nvim-tree.sync_root_with_cwd| option.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.actions.change_dir.restrict_above_cwd*
          Restrict changing to a directory above the global current working directory.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.actions.expand_all*
          Configuration for expand_all behaviour.
  
            *nvim-tree.actions.expand_all.max_folder_discovery*
            Limit the number of folders being explored when expanding every folders.
            Avoids hanging neovim when running this action on very large folders.
              Type: `number`, Default: `300`
  
            *nvim-tree.actions.expand_all.exclude*
            A list of directories that should not be expanded automatically.
            E.g `{ ".git", "target", "build" }` etc.
              Type: `table`, Default: `{}`
  
          *nvim-tree.actions.file_popup*
          Configuration for file_popup behaviour.
  
            *nvim-tree.actions.file_popup.open_win_config*
            Floating window config for file_popup. See |nvim_open_win| for more details.
            You shouldn't define `"width"` and `"height"` values here. They will be
            overridden to fit the file_popup content.
              Type: `table`, Default:
                `{`
                  `col = 1,`
                  `row = 1,`
                  `relative = "cursor",`
                  `border = "shadow",`
                  `style = "minimal",`
                `}`
  
          *nvim-tree.actions.open_file*
          Configuration options for opening a file from nvim-tree.
  
            *nvim-tree.actions.open_file.quit_on_open*
            Closes the explorer when opening a file.
            It will also disable preventing a buffer overriding the tree.
              Type: `boolean`, Default: `false`
  
            *nvim-tree.actions.open_file.resize_window*  (previously `view.auto_resize`)
            Resizes the tree when opening a file.
              Type: `boolean`, Default: `true`
  
            *nvim-tree.actions.open_file.window_picker*
            Window picker configuration.
  
              *nvim-tree.actions.open_file.window_picker.enable*
              Enable the feature. If the feature is not enabled, files will open in window
              from which you last opened the tree.
                Type: `boolean`, Default: `true`
  
              *nvim-tree.actions.open_file.window_picker.chars*
              A string of chars used as identifiers by the window picker.
                Type: `string`, Default: `"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"`
  
              *nvim-tree.actions.open_file.window_picker.exclude*
              Table of buffer option names mapped to a list of option values that indicates
              to the picker that the buffer's window should not be selectable.
                Type: `table`
                Default:
                  `{`
                    `filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },`
                    `buftype  = { "nofile", "terminal", "help", }`
                  `}`
  
          *nvim-tree.actions.remove_file.close_window*
          Close any window displaying a file when removing the file from the tree.
            Type: `boolean`, Default: `true`
  
          *nvim-tree.actions.use_system_clipboard*
          A boolean value that toggle the use of system clipboard when copy/paste
          function are invoked. When enabled, copied text will be stored in registers
          '+' (system), otherwise, it will be stored in '1' and '"'.
            Type: `boolean`, Default: `true`
    ]]
  actions = {
    change_dir = { enable = true, global = false, restrict_above_cwd = false },
    expand_all = { max_folder_discovery = 300, exclude = {} },
    --file_popup = { open_win_config = {} },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" }
        }
      }
    },
    remove_file = { close_window = true },
    use_system_clipboard = true
  },
  --[[
        *nvim-tree.live_filter*
        Configurations for the live_filtering feature.
        The live filter allows you to filter the tree nodes dynamically, based on
        regex matching (see |vim.regex|).
        This feature is bound to the `f` key by default.
        The filter can be cleared with the `F` key by default.
  
          *nvim-tree.live_filter.prefix*
          Prefix of the filter displayed in the buffer.
            Type: `string`, Default: `"[FILTER]: "`
  
          *nvim-tree.live_filter.always_show_folders*
          Whether to filter folders or not.
            Type: `boolean`, Default: `true`
    ]]
  live_filter = { prefix = "[FILTER]:", always_show_folders = true },
  --[[
        *nvim-tree.notify*
        Configuration for notification.
  
          *nvim-tree.notify.threshold*
          Specify minimum notification level, uses the values from |vim.log.levels|
            Type: `enum`, Default: `vim.log.levels.INFO`
  
          `ERROR`:   hard errors e.g. failure to read from the file system.
          `WARNING`: non-fatal errors e.g. unable to system open a file.
          `INFO:`    information only e.g. file copy path confirmation.
          `DEBUG:`   not used.
    ]]
  --notify = {threshold = vim.log.levels.INFO},
  --[[
        *nvim-tree.log*
        Configuration for diagnostic logging.
  
          *nvim-tree.log.enable*
          Enable logging to a file `$XDG_CACHE_HOME/nvim/nvim-tree.log`
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.truncate*
          Remove existing log file at startup.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.types*
          Specify which information to log.
  
          *nvim-tree.log.types.all*
          Everything.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.types.profile*
          Timing of some operations.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.types.config*
          Options and mappings, at startup.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.types.copy_paste*
          File copy and paste actions.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.types.dev*
          Used for local development only. Not useful for users.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.types.diagnostics*
          LSP and COC processing, verbose.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.types.git*
          Git processing, verbose.
            Type: `boolean`, Default: `false`
  
          *nvim-tree.log.types.watcher*
          |nvim-tree.filesystem_watchers| processing, verbose.
            Type: `boolean`, Default: `false`
    ]]
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      profile = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      watcher = false,
    }
  }
}

local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found!")
  return
end


return {
  tree.setup(config),
  -- Automatically open the file when created
  require "nvim-tree.events".on_file_created(function(file) vim.cmd("edit " .. file.fname) end)
}
