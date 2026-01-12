return require((function(v0) --[[ Line: 8 ]] --[[ Name: waitForValue ]]
    local l_Value_0 = v0.Value;
    if l_Value_0 then
        return l_Value_0;
    else
        return v0.Changed:Wait();
    end;
end)(script:WaitForChild("BounceTarget")));