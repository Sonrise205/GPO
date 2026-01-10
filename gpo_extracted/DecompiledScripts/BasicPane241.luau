local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Signal");
local v2 = v0("Maid");
local v3 = {};
v3.__index = v3;
v3.ClassName = "BasicPane";
v3.isBasicPane = function(v4) --[[ Line: 36 ]] --[[ Name: isBasicPane ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5 = false;
    if type(v4) == "table" then
        v5 = v2.isMaid(v4._maid) and v1.isSignal(v4.VisibleChanged) and type(v4.SetVisible) == "function" and type(v4.IsVisible) == "function" and type(v4.Show) == "function" and type(v4.Hide) == "function" and type(v4.Toggle) == "function" and type(v4.Destroy) == "function";
    end;
    return v5;
end;
v3.new = function(v6) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    local v7 = setmetatable({}, v3);
    v7._maid = v2.new();
    v7.Maid = v7._maid;
    v7._visible = false;
    v7.VisibleChanged = v1.new();
    v7._maid:GiveTask(v7.VisibleChanged);
    if v6 then
        v7._gui = v6;
        v7.Gui = v6;
        v7._maid:GiveTask(v6);
    end;
    return v7;
end;
v3.SetVisible = function(v8, v9, v10) --[[ Line: 98 ]] --[[ Name: SetVisible ]]
    -- upvalues: v2 (copy)
    assert(type(v9) == "boolean", "Bad isVisible");
    if v8._visible ~= v9 then
        v8._visible = v9;
        local v11 = v2.new();
        v8._maid._paneVisibleMaid = v11;
        v8.VisibleChanged:Fire(v8._visible, v10, v11);
    end;
end;
v3.Show = function(v12, v13) --[[ Line: 114 ]] --[[ Name: Show ]]
    v12:SetVisible(true, v13);
end;
v3.Hide = function(v14, v15) --[[ Line: 122 ]] --[[ Name: Hide ]]
    v14:SetVisible(false, v15);
end;
v3.Toggle = function(v16, v17) --[[ Line: 130 ]] --[[ Name: Toggle ]]
    v16:SetVisible(not v16._visible, v17);
end;
v3.IsVisible = function(v18) --[[ Line: 138 ]] --[[ Name: IsVisible ]]
    return v18._visible;
end;
v3.Destroy = function(v19) --[[ Line: 146 ]] --[[ Name: Destroy ]]
    v19._maid:DoCleaning();
    v19._maid = nil;
    setmetatable(v19, nil);
end;
return v3;