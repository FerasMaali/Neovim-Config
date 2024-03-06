return {
    {
        "jiangmiao/auto-pairs",
        init = function()
            vim.g.AutoPairsMultilineClose = 0
            vim.g.AutoPairsMapCh = 0
            vim.g.AutoPairsFlyMode = 0
            vim.g.AutoPairsShortcutBackInsert = "<M-b>"
            vim.g.AutoPairsShortcutToggle = "<M-p>"
            vim.g.AutoPairsShortcutFastWrap = false
            vim.g.AutoPairsShortcutJump = false
            vim.g.AutoPairsMoveCharacter = 0
        end,
    },
}
