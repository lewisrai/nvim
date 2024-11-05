return {
    'saghen/blink.cmp',
    version = 'v0.*',
    opts = {
        keymap = { preset = 'enter' },
        accept = {
            auto_brackets = { enabled = true },
        },
        sources = {
            providers = {
                snippets = {
                    opts = {
                        friendly_snippets = false,
                    },
                },
            },
        },
        windows = {
            autocomplete = {
                border = "single",
            },
            documentation = {
                auto_show = true,
                border = "single",
            },
        },
    }
}
