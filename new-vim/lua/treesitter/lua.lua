local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "html",
        "css",
        "bash",
        "cpp",
        "c",
        "typescript",
        "lua",
        "rust",
        "javascript"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
