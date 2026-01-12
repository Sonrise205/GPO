local v0 = {};
for _, v2 in pairs(script:GetChildren()) do
    for v3, v4 in pairs(require(v2)) do
        v0[v3] = v4;
        v0[v3].Type = v2.Name;
    end;
end;
return v0;