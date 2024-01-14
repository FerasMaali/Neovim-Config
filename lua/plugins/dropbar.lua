return {
    {
        "Bekaboo/dropbar.nvim",
        config = function()
            local dropbar = require("dropbar")
            dropbar.setup({
                general = {
                    ---@type boolean|fun(buf: integer, win: integer, info: table?): boolean
                    enable = function(buf, win, _)
                        if vim.b.dropbar_enabled then
                            return true
                        end

                        if vim.api.nvim_win_get_config(win).zindex then
                            return false
                        end

                        if vim.wo[win].diff then
                            return false
                        end

                        local allowedType = {
                            json = true,
                            yaml = true,
                            terraform = true,
                        }

                        local filetype = vim.bo[buf].filetype

                        return allowedType[filetype]
                    end,
                },
            })

            vim.keymap.set("n", "<leader>ub", function()
                vim.b.dropbar_enabled = true
                dropbar.setup()
            end, {
                noremap = true,
                silent = true,
                buffer = true,
                desc = "Enable dropbar for the current buffer",
            })
        end,
    },
}
