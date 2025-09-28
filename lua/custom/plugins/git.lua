-- return { 'tpope/vim-fugitive' }
--

return {
  -- Zeichen im Gutter + Hunk-Ops
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },
      current_line_blame = true,
      on_attach = function(buf)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
        end
        map('n', ']h', gs.next_hunk, 'Next hunk')
        map('n', '[h', gs.prev_hunk, 'Prev hunk')
        map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
        map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
        map('n', '<leader>hp', gs.preview_hunk_inline, 'Preview hunk inline')
        map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage')
        map('n', '<leader>hb', gs.toggle_current_line_blame, 'Toggle blame')
      end,
    },
  },

  -- Magit-ähnliche Oberfläche: Status, Commit, Rebase, Push/Pull
  {
    'NeogitOrg/neogit',
    dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
    config = true,
    keys = {
      {
        '<leader>gg',
        function()
          require('neogit').open()
        end,
        desc = 'Neogit',
      },
    },
  },

  -- Diff-/Merge-UI (2-/3-Way, History, Stash)
  {
    'sindrets/diffview.nvim',
    opts = {
      enhanced_diff_hl = true,
      view = { merge_tool = { layout = 'diff3_mixed' } },
      hooks = {
        diff_buf_read = function()
          vim.opt_local.wrap = false
          vim.opt_local.list = false
        end,
      },
    },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview: Open' },
      { '<leader>gD', '<cmd>DiffviewClose<cr>', desc = 'Diffview: Close' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Diffview: File history' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Diffview: Repo history' },
    },
  },

  -- Harte Merge-Konflikte schnell auflösen (ours/theirs/both/none + Jump)
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    opts = {
      default_mappings = false,
      disable_diagnostics = true,
      list_opener = 'copen',
      highlights = { incoming = 'DiffText', current = 'DiffAdd' },
    },
    keys = {
      { ']x', '<Plug>(git-conflict-next-conflict)', desc = 'Next conflict' },
      { '[x', '<Plug>(git-conflict-prev-conflict)', desc = 'Prev conflict' },
      { '<leader>xo', '<Plug>(git-conflict-ours)', desc = 'Use ours' },
      { '<leader>xt', '<Plug>(git-conflict-theirs)', desc = 'Use theirs' },
      { '<leader>xb', '<Plug>(git-conflict-both)', desc = 'Use both' },
      { '<leader>xn', '<Plug>(git-conflict-none)', desc = 'Use none' },
      { '<leader>xl', '<cmd>GitConflictListQf<cr>', desc = 'List conflicts' },
    },
  },

  -- Telescope Git-Picker (Branches, Commits, Stash, Grep)
  {
    'nvim-telescope/telescope.nvim',
    optional = true,
    keys = {
      {
        '<leader>gs',
        function()
          require('telescope.builtin').git_status()
        end,
        desc = 'Git status',
      },
      {
        '<leader>gc',
        function()
          require('telescope.builtin').git_commits()
        end,
        desc = 'Git commits',
      },
      {
        '<leader>gb',
        function()
          require('telescope.builtin').git_branches()
        end,
        desc = 'Git branches',
      },
      {
        '<leader>gS',
        function()
          require('telescope.builtin').git_stash()
        end,
        desc = 'Git stash',
      },
    },
  },

  -- Optional: PRs/Issues direkt aus Neovim (GitHub)
  -- { "pwntester/octo.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
}
