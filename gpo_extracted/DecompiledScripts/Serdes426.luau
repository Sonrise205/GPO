local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local v2 = 0;
local l_Reliable_0 = require(script.Parent.Parent.Event).Reliable;
local v4 = require(script.Parent.Assert);
v0.increment = function(v5, v6) --[[ Line: 10 ]] --[[ Name: increment ]]
    -- upvalues: v4 (copy), l_RunService_0 (copy), v2 (ref), l_Reliable_0 (copy)
    v4(typeof(v5) == "string", "Identifier must be a string type.");
    if l_RunService_0:IsServer() then
        v4(v2 < 255, "reached max 255 identifiers.");
        if not l_Reliable_0:GetAttribute(v5) then
            v2 = v2 + 1;
            l_Reliable_0:SetAttribute(("%*"):format(v2), v5);
            l_Reliable_0:SetAttribute(v5, v2);
        end;
        return l_Reliable_0:GetAttribute(v5);
    else
        local v7 = coroutine.running();
        local v8 = task.delay(v6 or 10, function() --[[ Line: 22 ]]
            -- upvalues: v7 (copy), v5 (copy)
            task.spawn(v7, nil);
            error(("Serdes: %* is taking too long to retrieve, seems like it's not replicated on server."):format(v5), 2);
        end);
        task.spawn(function() --[[ Line: 26 ]]
            -- upvalues: v8 (copy), l_Reliable_0 (ref), v5 (copy), v7 (copy)
            while true do
                if coroutine.status(v8) ~= "dead" and task.wait(0.04) then
                    if l_Reliable_0:GetAttribute(v5) then
                        task.cancel(v8);
                        task.spawn(v7, l_Reliable_0:GetAttribute(v5));
                        return;
                    end;
                else
                    return;
                end;
            end;
        end);
        return coroutine.yield();
    end;
end;
v0.decrement = function() --[[ Line: 40 ]] --[[ Name: decrement ]]
    -- upvalues: l_RunService_0 (copy), v2 (ref), l_Reliable_0 (copy)
    if not l_RunService_0:IsServer() or v2 <= 0 then
        return;
    else
        local l_l_Reliable_0_Attribute_0 = l_Reliable_0:GetAttribute((("%*"):format(v2)));
        if not l_l_Reliable_0_Attribute_0 then
            return;
        else
            l_Reliable_0:SetAttribute(("%*"):format(l_l_Reliable_0_Attribute_0), nil);
            l_Reliable_0:SetAttribute(("%*"):format(v2), nil);
            v2 = v2 - 1;
            l_l_Reliable_0_Attribute_0 = nil;
            return;
        end;
    end;
end;
return v0;