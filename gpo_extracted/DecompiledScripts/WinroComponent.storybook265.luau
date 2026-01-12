local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Theme);
local l_Provider_0 = v2.Provider;
local l_createElement_0 = require(l_Parent_1.Roact).createElement;
local function _(v5) --[[ Line: 10 ]] --[[ Name: SortProps ]]
    table.sort(v5, function(v6, v7) --[[ Line: 11 ]]
        return v6.Name < v7.Name;
    end);
end;
local function v24(v9) --[[ Line: 16 ]] --[[ Name: ParseDocument ]]
    local v10 = "";
    local v11 = {};
    local v12 = {};
    local v13 = {};
    v10 = v9:split("\n")[1];
    for _, v15 in pairs(v9:split("\n")) do
        if v15:find("@prop") then
            v15 = v15:gsub("@prop", "");
            local l_v11_0 = v11;
            if v15:find("@optional") then
                v15 = v15:gsub("@optional", "");
                l_v11_0 = v12;
            end;
            if v15:find("@style") then
                v15 = v15:gsub("@style", "");
                l_v11_0 = v13;
            end;
            local v17, v18, v19 = v15:match("([%w%p]+)%s([%w%p]+)%s(.+)");
            if not v17 or not v18 or not v19 then
                warn("Invalid prop tag:" .. v15);
            else
                table.insert(l_v11_0, {
                    Name = v17, 
                    Type = v18, 
                    Comment = v19
                });
            end;
        end;
    end;
    table.sort(v11, function(v20, v21) --[[ Line: 11 ]]
        return v20.Name < v21.Name;
    end);
    table.sort(v12, function(v22, v23) --[[ Line: 11 ]]
        return v22.Name < v23.Name;
    end);
    return {
        Summary = v10, 
        Docs = {
            Required = v11, 
            Optional = v12, 
            Style = v13
        }
    };
end;
return {
    name = "Winro" .. utf8.char(57344), 
    roact = require(script.Parent.Parent.Roact), 
    storyRoots = {
        script.Parent.App
    }, 
    mapDefinition = function(v25) --[[ Line: 76 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v24 (copy), l_createElement_0 (copy), l_Provider_0 (copy), v2 (copy)
        local v26 = v24(v25.source.Parent:FindFirstChild(v25.source.Name:gsub(".story", "")).Source);
        v25.summary = v26.Summary;
        v25.docs = v26.Docs;
        local v27 = {};
        if typeof(v25.stories) == "function" then
            v27 = {
                name = "story", 
                summary = "", 
                story = function(v28) --[[ Line: 88 ]] --[[ Name: story ]]
                    -- upvalues: l_createElement_0 (ref), l_Provider_0 (ref), v2 (ref), v27 (ref)
                    return l_createElement_0(l_Provider_0, {
                        Theme = v2.Themes[v28.theme .. "Theme"]
                    }, v27.story(v28));
                end
            };
        else
            for v29, v30 in pairs(v25.stories) do
                v27[v29] = {
                    name = v29, 
                    summary = "", 
                    story = function(v31) --[[ Line: 100 ]] --[[ Name: story ]]
                        -- upvalues: l_createElement_0 (ref), l_Provider_0 (ref), v2 (ref), v30 (copy)
                        return l_createElement_0(l_Provider_0, {
                            Theme = v2.Themes[v31.theme .. "Theme"]
                        }, v30.story(v31));
                    end
                };
            end;
        end;
        v25.stories = v27;
        return v25;
    end
};