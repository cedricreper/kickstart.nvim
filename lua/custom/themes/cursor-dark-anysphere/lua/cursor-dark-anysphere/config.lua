local M = {}

M.default_config = {
    style = 'dark',
    transparent = false,
    transparency_mode = 'blended',
    ending_tildes = false,
    cmp_itemkind_reverse = false,

    transparencies = {
        floats = true,
        popups = true,
        sidebar = false,
        statusline = false,
    },

    styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = { bold = true },
        variables = {},
        operators = {},
        booleans = {},
        strings = {},
        types = {},
        numbers = {},
        parameters = { italic = true },
        function_declarations = { bold = true },
        method_declarations = { bold = true },
        cpp_functions = { bold = true },
        c_functions = { bold = true },
        typescript_properties = { bold = true },
        js_attributes = { italic = true },
        python_keywords = { italic = true },
        markdown_italic = { italic = true },
    },

    colors = {},
    highlights = {},

    plugins = {
        telescope = true,
        nvim_tree = true,
        neo_tree = true,
        nvim_cmp = true,
        lualine = true,
        gitsigns = true,
        treesitter = true,
        indent_blankline = true,
        dashboard = true,
        which_key = true,
        trouble = true,
        todo_comments = true,
        lazy = true,
        mini = true,
        snacks = true,
        dap = true,
        copilot = true,
        oil = true,
        conform = true,
        noice = true,
    },
}

M.config = vim.deepcopy(M.default_config)

function M.setup(opts)
    M.config = vim.deepcopy(M.default_config)
    if opts and type(opts) == "table" then
        M.config = vim.tbl_deep_extend("force", M.config, opts)
    end

    -- Validate transparency_mode
    local valid_modes = { blended = true, transparent = true, opaque = true }
    if not valid_modes[M.config.transparency_mode] then
        M.config.transparency_mode = 'blended'
    end

    -- Handle transparent flag override
    if M.config.transparent == true then
        M.config.transparency_mode = 'transparent'
    end
end

function M.get()
    return M.config
end

return M
