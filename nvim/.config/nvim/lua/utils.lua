local M = {}

M.tbl_join = function(list, sep)
    local agg = ""
    for i, v in ipairs(list) do
        if i>0 then
            agg = agg .. sep
        end

        agg = agg .. v
    end

    return agg
end

return M
