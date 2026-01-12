local v19 = {
    isValueBase = function(v0) --[[ Line: 8 ]] --[[ Name: isValueBase ]]
        local v1 = false;
        if typeof(v0) == "Instance" then
            v1 = v0.ClassName:sub(-5) == "Value";
        end;
        return v1;
    end, 
    getOrCreateValue = function(v2, v3, v4, v5) --[[ Line: 12 ]] --[[ Name: getOrCreateValue ]]
        assert(typeof(v2) == "Instance", "Bad argument 'parent'");
        assert(type(v3) == "string", "Bad argument 'instanceType'");
        assert(type(v4) == "string", "Bad argument 'name'");
        local l_v2_FirstChild_0 = v2:FindFirstChild(v4);
        if l_v2_FirstChild_0 then
            if not l_v2_FirstChild_0:IsA(v3) then
                warn(("[ValueBaseUtils.getOrCreateValue] - Value of type %q of name %q is of type %q in %s instead"):format(v3, v4, l_v2_FirstChild_0.ClassName, l_v2_FirstChild_0:GetFullName()));
            end;
            return l_v2_FirstChild_0;
        else
            local v7 = Instance.new(v3);
            v7.Name = v4;
            v7.Value = v5;
            v7.Parent = v2;
            return v7;
        end;
    end, 
    setValue = function(v8, v9, v10, v11) --[[ Line: 35 ]] --[[ Name: setValue ]]
        assert(typeof(v8) == "Instance", "Bad argument 'parent'");
        assert(type(v9) == "string", "Bad argument 'instanceType'");
        assert(type(v10) == "string", "Bad argument 'name'");
        local l_v8_FirstChild_0 = v8:FindFirstChild(v10);
        if l_v8_FirstChild_0 then
            if not l_v8_FirstChild_0:IsA(v9) then
                warn(("[ValueBaseUtils.setValue] - Value of type %q of name %q is of type %q in %s instead"):format(v9, v10, l_v8_FirstChild_0.ClassName, l_v8_FirstChild_0:GetFullName()));
            end;
            l_v8_FirstChild_0.Value = v11;
            return;
        else
            local v13 = Instance.new(v9);
            v13.Name = v10;
            v13.Value = v11;
            v13.Parent = v8;
            return;
        end;
    end, 
    getValue = function(v14, v15, v16, v17) --[[ Line: 56 ]] --[[ Name: getValue ]]
        assert(typeof(v14) == "Instance", "Bad argument 'parent'");
        assert(type(v15) == "string", "Bad argument 'instanceType'");
        assert(type(v16) == "string", "Bad argument 'name'");
        local l_v14_FirstChild_0 = v14:FindFirstChild(v16);
        if l_v14_FirstChild_0 then
            if l_v14_FirstChild_0:IsA(v15) then
                return l_v14_FirstChild_0.Value;
            else
                warn(("[ValueBaseUtils.getValue] - Value of type %q of name %q is of type %q in %s instead"):format(v15, v16, l_v14_FirstChild_0.ClassName, l_v14_FirstChild_0:GetFullName()));
                return nil;
            end;
        else
            return v17;
        end;
    end
};
v19.createGetSet = function(v20, v21) --[[ Line: 75 ]] --[[ Name: createGetSet ]]
    -- upvalues: v19 (copy)
    assert(type(v20) == "string", "Bad argument 'instanceType'");
    assert(type(v21) == "string", "Bad argument 'name'");
    return function(v22, v23) --[[ Line: 79 ]]
        -- upvalues: v19 (ref), v20 (copy), v21 (copy)
        assert(typeof(v22) == "Instance", "Bad argument 'parent'");
        return v19.getValue(v22, v20, v21, v23);
    end, function(v24, v25) --[[ Line: 83 ]]
        -- upvalues: v19 (ref), v20 (copy), v21 (copy)
        assert(typeof(v24) == "Instance", "Bad argument 'parent'");
        return v19.setValue(v24, v20, v21, v25);
    end, function(v26, v27) --[[ Line: 87 ]]
        -- upvalues: v19 (ref), v20 (copy), v21 (copy)
        return v19.getOrCreateValue(v26, v20, v21, v27);
    end;
end;
return v19;