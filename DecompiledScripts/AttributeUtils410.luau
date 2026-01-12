local v0 = require(script.Parent.loader).load(script);
local l_RunService_0 = game:GetService("RunService");
local v2 = v0("Maid");
return {
    bindToBinder = function(v3, v4, v5) --[[ Line: 23 ]] --[[ Name: bindToBinder ]]
        -- upvalues: v2 (copy), l_RunService_0 (copy)
        assert(v5, "Bad binder");
        assert(typeof(v3) == "Instance", "Bad instance");
        assert(type(v4) == "string", "Bad attributeName");
        local v6 = v2.new();
        local function v7() --[[ Line: 30 ]] --[[ Name: syncAttribute ]]
            -- upvalues: v3 (copy), v4 (copy), l_RunService_0 (ref), v5 (copy)
            if v3:GetAttribute(v4) then
                if l_RunService_0:IsClient() then
                    v5:BindClient(v3);
                    return;
                else
                    v5:Bind(v3);
                    return;
                end;
            elseif l_RunService_0:IsClient() then
                v5:UnbindClient(v3);
                return;
            else
                v5:Unbind(v3);
                return;
            end;
        end;
        v6:GiveTask(v3:GetAttributeChangedSignal(v4):Connect(v7));
        v6:GiveTask(v5:ObserveInstance(v3, function() --[[ Line: 47 ]] --[[ Name: syncBoundClass ]]
            -- upvalues: v5 (copy), v3 (copy), v4 (copy)
            if v5:Get(v3) then
                v3:SetAttribute(v4, true);
                return;
            else
                v3:SetAttribute(v4, false);
                return;
            end;
        end));
        if v5:Get(v3) or v3:GetAttribute(v4) then
            v3:SetAttribute(v4, true);
            if l_RunService_0:IsClient() then
                v5:BindClient(v3);
            else
                v5:Bind(v3);
            end;
        else
            v3:SetAttribute(v4, false);
        end;
        v6:GiveTask(function() --[[ Line: 69 ]]
            -- upvalues: v6 (copy), v3 (copy), v4 (copy)
            v6:DoCleaning();
            v3:SetAttribute(v4, nil);
        end);
        return v6;
    end, 
    initAttribute = function(v8, v9, v10) --[[ Line: 88 ]] --[[ Name: initAttribute ]]
        assert(typeof(v8) == "Instance", "Bad instance");
        assert(typeof(v9) == "string", "Bad attributeName");
        local l_v8_Attribute_0 = v8:GetAttribute(v9);
        if l_v8_Attribute_0 == nil then
            v8:SetAttribute(v9, v10);
            l_v8_Attribute_0 = v10;
        end;
        return l_v8_Attribute_0;
    end, 
    getAttribute = function(v12, v13, v14) --[[ Line: 108 ]] --[[ Name: getAttribute ]]
        local l_v12_Attribute_0 = v12:GetAttribute(v13);
        if l_v12_Attribute_0 == nil then
            return v14;
        else
            return l_v12_Attribute_0;
        end;
    end
};