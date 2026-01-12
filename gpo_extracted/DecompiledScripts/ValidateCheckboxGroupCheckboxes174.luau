local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
return v1.table(v1.strictInterface({
    Selected = v1.string, 
    Label = v1.optional(v1.string), 
    OnClicked = v1.callback
}));