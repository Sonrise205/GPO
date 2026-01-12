local v0 = require(script.Parent.Symbol);
local v1 = require(script.Parent.strict);
local v2 = newproxy(true);
local v3 = {};
local function _(v4) --[[ Line: 19 ]] --[[ Name: addType ]]
    -- upvalues: v3 (copy), v0 (copy)
    v3[v4] = v0.named("Roact" .. v4);
end;
v3.Binding = v0.named("RoactBinding");
v3.Element = v0.named("RoactElement");
v3.HostChangeEvent = v0.named("RoactHostChangeEvent");
v3.HostEvent = v0.named("RoactHostEvent");
v3.StatefulComponentClass = v0.named("RoactStatefulComponentClass");
v3.StatefulComponentInstance = v0.named("RoactStatefulComponentInstance");
v3.VirtualNode = v0.named("RoactVirtualNode");
v3.VirtualTree = v0.named("RoactVirtualTree");
v3.of = function(v6) --[[ Line: 32 ]] --[[ Name: of ]]
    -- upvalues: v2 (copy)
    if typeof(v6) ~= "table" then
        return nil;
    else
        return v6[v2];
    end;
end;
getmetatable(v2).__index = v3;
getmetatable(v2).__tostring = function() --[[ Line: 42 ]]
    return "RoactType";
end;
v1(v3, "Type");
return v2;