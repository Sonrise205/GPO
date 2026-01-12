local l_Packages_0 = script.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local function _(v2) --[[ Line: 6 ]] --[[ Name: SortProps ]]
    table.sort(v2, function(v3, v4) --[[ Line: 7 ]]
        return v3.Name < v4.Name;
    end);
end;
local function v21(v6) --[[ Line: 12 ]] --[[ Name: ParseDocument ]]
    local v7 = "";
    local v8 = {};
    local v9 = {};
    local v10 = {};
    v7 = v6:split("\n")[1];
    for _, v12 in pairs(v6:split("\n")) do
        if v12:find("@prop") then
            v12 = v12:gsub("@prop", "");
            local l_v8_0 = v8;
            if v12:find("@optional") then
                v12 = v12:gsub("@optional", "");
                l_v8_0 = v9;
            end;
            if v12:find("@style") then
                v12 = v12:gsub("@style", "");
                l_v8_0 = v10;
            end;
            local v14, v15, v16 = v12:match("([%w%p]+)%s([%w%p]+)%s(.+)");
            if not v14 or not v15 or not v16 then
                warn("Invalid prop tag:" .. v12);
            else
                table.insert(l_v8_0, {
                    Name = v14, 
                    Type = v15, 
                    Comment = v16
                });
            end;
        end;
    end;
    table.sort(v8, function(v17, v18) --[[ Line: 7 ]]
        return v17.Name < v18.Name;
    end);
    table.sort(v9, function(v19, v20) --[[ Line: 7 ]]
        return v19.Name < v20.Name;
    end);
    return {
        Summary = v7, 
        Docs = {
            Required = v8, 
            Optional = v9, 
            Style = v10
        }
    };
end;
return {
    name = "Adonis Modern Theme", 
    roact = v1, 
    storyRoots = {
        script.Parent
    }, 
    mapDefinition = function(v22) --[[ Line: 74 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v21 (copy)
        local v23 = v21(v22.source.Parent:FindFirstChild(v22.source.Name:gsub(".story", "")).Source);
        v22.summary = v23.Summary;
        v22.docs = v23.Docs;
        return v22;
    end
};