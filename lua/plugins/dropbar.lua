return {
    {
        "Bekaboo/dropbar.nvim",
        config = function()
            local dropbar = require("dropbar")
            dropbar.setup({
                bar = {
                    ---@type boolean|fun(buf: integer, win: integer, info: table?): boolean
                    enable = function(buf, win, _)
                        if vim.api.nvim_win_get_config(win).zindex then
                            return false
                        end

                        local allowedType = {
                            json = true,
                            yaml = true,
                            terraform = true,
                            markdown = true,
                        }

                        local filetype = vim.bo[buf].filetype

                        return allowedType[filetype]
                    end,
                },
            })
        end,
    },
}
