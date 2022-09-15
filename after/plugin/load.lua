function load_packages(opts)
    local path = opts.path
    local packages = opts.packages

    for k, v in pairs(packages) do
        require(path .. v)
    end
end


function req(package) 
    local status_ok, name =
        pcall(require, package)
    if not status_ok then
        vim.notify("Error: Could not require package " .. package)
        return {}
    end
    return name
end
