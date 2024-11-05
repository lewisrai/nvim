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
        trigger = {
            signature_help = { enabled = true },
        },
        windows = {
            autocomplete = {
                border = "single",
            },
            documentation = {
                auto_show = true,
                border = "single",
            },
            signature_help = {
                border = "single",
            },
        },
    }
}
