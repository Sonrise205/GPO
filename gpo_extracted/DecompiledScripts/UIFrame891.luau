local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local l_script_FirstChild_0 = script:FindFirstChild(v2.Name);
    if not l_script_FirstChild_0 then
        warn("Missing UIModule for", v2.Name);
    end;
    local v4 = setmetatable(l_script_FirstChild_0 and require(l_script_FirstChild_0) or {}, v0);
    v4.CrewsUI = v1;
    v4.Frame = v2;
    if v4.Setup then
        v4:Setup(v1.UIController);
    end;
    return v4;
end;
v0.SetVisible = function(v5, v6) --[[ Line: 23 ]] --[[ Name: SetVisible ]]
    local v7 = v6 == nil and not v5.Frame.Visible or v6;
    v5.Frame.Visible = v7;
end;
return v0;