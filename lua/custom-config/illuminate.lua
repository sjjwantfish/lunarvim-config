local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
    return
end

-- default configuration
illuminate.configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    }
})
