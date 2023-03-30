require("auto-session").setup {
  log_level = "error",
  post_cwd_changed_hook = function()
        require("lualine").refresh()
      end,
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
  auto_session_enable_last_session = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
}
