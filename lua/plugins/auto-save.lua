return {
    {
        "Pocco81/auto-save.nvim",
        config = function()
            local autosave = require("auto-save")
            local utils = require("auto-save.utils.data")
            local disallowed_filetypes = utils.set_of({})

            autosave.setup({
                enabled = true,
                execution_message = {
                    message = "",
                },
                trigger_events = { "InsertLeave", "TextChanged" },
                condition = function(buf)
                    local fn = vim.fn
                    local filetype = fn.getbufvar(buf, "&filetype")
                    local modifiable = fn.getbufvar(buf, "&modifiable")
                    local file_path = vim.api.nvim_buf_get_name(0)

                    if modifiable ~= 1 then
                        return false
                    end

                    if disallowed_filetypes[filetype] ~= nil then
                        return false
                    end

                    -- Prevent autosave on not-saved-to-disk files
                    if fn.filereadable(vim.api.nvim_buf_get_name(buf)) == 0 then
                        return false
                    end

                    local dontSavePatterns = {

                        -- kubectl-edit files
                        "^/tmp/kubectl.edit.*.yaml$",

                        -- neovim plugins file
                        ".*/load.plugins.lua",
                    }

                    for _, pattern in ipairs(dontSavePatterns) do
                        if string.find(file_path, pattern) then
                            return false
                        end
                    end

                    return true
                end,
            })
        end,
    },
}
