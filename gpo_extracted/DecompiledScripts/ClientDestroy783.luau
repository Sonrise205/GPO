return {
    start = function(_, v1, v2, v3) --[[ Line: 3 ]] --[[ Name: start ]]
        if v1 == nil then
            return;
        elseif v3 == nil then
            return;
        else
            local _ = v2;
            v2 = v2 - (workspace:GetServerTimeNow() - v3);
            _G.destroy(v1, v2);
            return;
        end;
    end
};