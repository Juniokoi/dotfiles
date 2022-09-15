local M = {}
M.packages = function(opts)
    local path = opts.path
    local packages = opts.packages or {}

    if packages then
        for key, value in pairs(packages) do
            require(path .. "." .. value)
        end
    end
end

M.req = function(package) 
    local status_ok, name =
        pcall(require, package)
    if not status_ok then
        vim.notify("Error: Could not require package " .. package)
        return {}
    end
    return name
end

return M
