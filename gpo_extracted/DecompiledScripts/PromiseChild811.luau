local v0 = require(script.Parent.Promise);
local function _(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: WaitForChild ]]
    local l_v1_FirstChild_0 = v1:FindFirstChild(v2);
    local v5 = os.clock();
    while l_v1_FirstChild_0 == nil do
        l_v1_FirstChild_0 = v1:FindFirstChild(v2);
        if os.clock() - v5 <= (v3 or 8) then
            task.wait(0.1);
        else
            break;
        end;
    end;
    return l_v1_FirstChild_0;
end;
return function(v7, v8, v9) --[[ Line: 22 ]]
    -- upvalues: v0 (copy)
    local l_v7_FirstChild_0 = v7:FindFirstChild(v8);
    if l_v7_FirstChild_0 then
        return v0.resolved(l_v7_FirstChild_0);
    else
        return v0.new(function(v11, _) --[[ Line: 28 ]]
            -- upvalues: v7 (copy), v8 (copy), v9 (copy)
            task.spawn(function() --[[ Line: 29 ]]
                -- upvalues: v7 (ref), v8 (ref), v9 (ref), v11 (copy)
                local v13 = v7:WaitForChild(v8, v9);
                if v13 then
                    v11(v13);
                    return;
                else
                    v11("Timed out");
                    return;
                end;
            end);
        end);
    end;
end;