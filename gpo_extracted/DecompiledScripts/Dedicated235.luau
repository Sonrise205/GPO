--!native
local v0 = {};
v0.__index = v0;
local l_create_0 = buffer.create;
local l_copy_0 = buffer.copy;
local l_writei8_0 = buffer.writei8;
local l_writei16_0 = buffer.writei16;
local l_writei32_0 = buffer.writei32;
local l_writeu8_0 = buffer.writeu8;
local l_writeu16_0 = buffer.writeu16;
local l_writeu32_0 = buffer.writeu32;
local l_writef32_0 = buffer.writef32;
local l_writef64_0 = buffer.writef64;
local l_writestring_0 = buffer.writestring;
local v12 = {
    point = 0, 
    next = 0, 
    size = 128, 
    bufferSize = 128
};
v0.copy = function(v13, v14, v15, v16, v17, v18) --[[ Line: 26 ]] --[[ Name: copy ]]
    -- upvalues: l_copy_0 (copy), l_create_0 (copy), v12 (copy)
    if not v15 then
        l_copy_0(l_create_0(v18 or v12.size), v14, v16 or v13.buffer, v17, v18);
        return;
    else
        l_copy_0(v15, v14, v16 or v13.buffer, v17, v18);
        return;
    end;
end;
v0.alloc = function(v19, v20) --[[ Line: 34 ]] --[[ Name: alloc ]]
    -- upvalues: l_create_0 (copy), l_copy_0 (copy)
    local l_size_0 = v19.size;
    local l_buffer_0 = v19.buffer;
    while l_size_0 <= v19.next + v20 do
        l_size_0 = math.floor(l_size_0 * 1.25);
    end;
    local v23 = l_create_0(l_size_0);
    l_copy_0(v23, 0, l_buffer_0);
    l_buffer_0 = v23;
    v19.point = v19.next;
    v19.buffer = l_buffer_0;
    v19.next = v19.next + v20;
end;
v0.build = function(v24) --[[ Line: 51 ]] --[[ Name: build ]]
    -- upvalues: l_create_0 (copy), l_copy_0 (copy)
    local v25 = v24.next > v24.point and v24.next or v24.point;
    local v26 = l_create_0(v25);
    l_copy_0(v26, 0, v24.buffer, 0, v25);
    return v26;
end;
v0.buildAndRemove = function(v27) --[[ Line: 59 ]] --[[ Name: buildAndRemove ]]
    -- upvalues: l_create_0 (copy), l_copy_0 (copy)
    local v28 = v27.next > v27.point and v27.next or v27.point;
    local v29 = l_create_0(v28);
    local v30 = #v27.ref > 0 and table.clone(v27.ref) or nil;
    l_copy_0(v29, 0, v27.buffer, 0, v28);
    v27:remove();
    return v29, v30;
end;
v0.wi8 = function(v31, v32, v33) --[[ Line: 70 ]] --[[ Name: wi8 ]]
    -- upvalues: l_writei8_0 (copy)
    if not v32 then
        return;
    else
        v31:alloc(v33 or 1);
        l_writei8_0(v31.buffer, v31.point, v32);
        return;
    end;
end;
v0.wi16 = function(v34, v35, v36) --[[ Line: 76 ]] --[[ Name: wi16 ]]
    -- upvalues: l_writei16_0 (copy)
    if not v35 then
        return;
    else
        v34:alloc(v36 or 2);
        l_writei16_0(v34.buffer, v34.point, v35);
        return;
    end;
end;
v0.wi32 = function(v37, v38, v39) --[[ Line: 82 ]] --[[ Name: wi32 ]]
    -- upvalues: l_writei32_0 (copy)
    if not v38 then
        return;
    else
        v37:alloc(v39 or 4);
        l_writei32_0(v37.buffer, v37.point, v38);
        return;
    end;
end;
v0.wu8 = function(v40, v41, v42) --[[ Line: 88 ]] --[[ Name: wu8 ]]
    -- upvalues: l_writeu8_0 (copy)
    if not v41 then
        return;
    else
        v40:alloc(v42 or 1);
        l_writeu8_0(v40.buffer, v40.point, v41);
        return;
    end;
end;
v0.wu16 = function(v43, v44, v45) --[[ Line: 94 ]] --[[ Name: wu16 ]]
    -- upvalues: l_writeu16_0 (copy)
    if not v44 then
        return;
    else
        v43:alloc(v45 or 2);
        l_writeu16_0(v43.buffer, v43.point, v44);
        return;
    end;
end;
v0.wu32 = function(v46, v47, v48) --[[ Line: 100 ]] --[[ Name: wu32 ]]
    -- upvalues: l_writeu32_0 (copy)
    if not v47 then
        return;
    else
        v46:alloc(v48 or 4);
        l_writeu32_0(v46.buffer, v46.point, v47);
        return;
    end;
end;
v0.wf32 = function(v49, v50, v51) --[[ Line: 106 ]] --[[ Name: wf32 ]]
    -- upvalues: l_writef32_0 (copy)
    if not v50 then
        return;
    else
        v49:alloc(v51 or 4);
        l_writef32_0(v49.buffer, v49.point, v50);
        return;
    end;
end;
v0.wf64 = function(v52, v53, v54) --[[ Line: 112 ]] --[[ Name: wf64 ]]
    -- upvalues: l_writef64_0 (copy)
    if not v53 then
        return;
    else
        v52:alloc(v54 or 8);
        l_writef64_0(v52.buffer, v52.point, v53);
        return;
    end;
end;
v0.wstring = function(v55, v56) --[[ Line: 118 ]] --[[ Name: wstring ]]
    -- upvalues: l_writestring_0 (copy)
    if not v56 then
        return;
    else
        v55:alloc(#v56);
        l_writestring_0(v55.buffer, v55.point, v56);
        return;
    end;
end;
v0.wType = function(v57, v58) --[[ Line: 124 ]] --[[ Name: wType ]]
    -- upvalues: l_writeu8_0 (copy)
    l_writeu8_0(v57.buffer, v57.point, v58);
    v57.point = v57.point + 1;
end;
v0.wRef = function(v59, v60, v61) --[[ Line: 129 ]] --[[ Name: wRef ]]
    -- upvalues: l_writeu8_0 (copy)
    if not v60 then
        return;
    else
        v59:alloc(v61 or 1);
        table.insert(v59.ref, v60);
        local v62 = #v59.ref;
        l_writeu8_0(v59.buffer, v59.point, v62);
        v59.point = v59.point + 1;
        return;
    end;
end;
v0.pack = function(v63, v64) --[[ Line: 138 ]] --[[ Name: pack ]]
    if typeof(v64) == "nil" then
        v63:wi8(0);
        return;
    elseif typeof(v64) == "Instance" then
        v63:wi8(-1);
        v63:wRef(v64);
        return;
    elseif typeof(v64) == "table" then
        local v65 = true;
        local v66 = 0;
        for v67 in v64 do
            v66 = v66 + 1;
            if typeof(v67) ~= "number" or math.floor(v67) ~= v67 then
                v65 = false;
            end;
        end;
        if v65 then
            v63:wi8(-2);
            v63:wu16(v66);
            for _, v69 in v64 do
                v63:pack(v69);
            end;
            return;
        else
            v63:wi8(-3);
            v63:wu16(v66);
            for v70, v71 in v64 do
                v63:pack(v70);
                v63:pack(v71);
            end;
            return;
        end;
    elseif typeof(v64) == "EnumItem" then
        v63:wi8(-4);
        v63:wi8(#("%*"):format(v64.EnumType));
        v63:wstring((("%*"):format(v64.EnumType)));
        v63:wu8(v64.Value);
        return;
    elseif typeof(v64) == "BrickColor" then
        v63:wi8(-5);
        v63:wi16(v64.Number);
        return;
    elseif typeof(v64) == "Enum" then
        v63:wi8(-6);
        v63:wi8(#("%*"):format(v64));
        v63:wstring((("%*"):format(v64)));
        return;
    elseif typeof(v64) == "number" then
        if math.floor(v64) == v64 then
            if v64 >= 0 and v64 <= 255 then
                v63:wi8(1);
                v63:wu8(v64);
                return;
            elseif v64 >= -32768 and v64 <= 32767 then
                v63:wi8(2);
                v63:wi16(v64);
                return;
            elseif v64 >= -2147483647 and v64 <= 2147483647 then
                v63:wi8(3);
                v63:wi32(v64);
                return;
            else
                v63:wi8(4);
                v63:wf64(v64);
                return;
            end;
        else
            v63:wi8(4);
            v63:wf64(v64);
            return;
        end;
    elseif typeof(v64) == "boolean" then
        v63:wi8(5);
        v63:wu8(v64 and 1 or 0);
        return;
    elseif typeof(v64) == "string" then
        local v72 = #v64;
        if v72 <= 255 then
            v63:wi8(6);
            v63:wu8(v72);
        elseif v72 <= 65535 then
            v63:wi8(7);
            v63:wu16(v72);
        else
            v63:wi8(8);
            v63:wi32(v72);
        end;
        v63:wstring(v64);
        return;
    elseif typeof(v64) == "Vector3" then
        v63:wi8(9);
        v63:wf32(v64.X);
        v63:wf32(v64.Y);
        v63:wf32(v64.Z);
        return;
    elseif typeof(v64) == "Vector2" then
        v63:wi8(10);
        v63:wf32(v64.X);
        v63:wf32(v64.Y);
        return;
    elseif typeof(v64) == "CFrame" then
        v63:wi8(11);
        for _, v74 in {
            v64:GetComponents()
        } do
            v63:wf32(v74);
        end;
        return;
    elseif typeof(v64) == "Color3" then
        v63:wi8(12);
        v63:wu8(v64.R * 255);
        v63:wu8(v64.G * 255);
        v63:wu8(v64.B * 255);
        return;
    else
        warn((("Unsupported data type: %* value: %*"):format(typeof(v64), v64)));
        return;
    end;
end;
v0.flush = function(v75) --[[ Line: 239 ]] --[[ Name: flush ]]
    -- upvalues: v12 (copy), l_create_0 (copy)
    v75.point = v12.point;
    v75.next = v12.next;
    v75.size = v12.size;
    v75.buffer = l_create_0(v12.bufferSize);
    table.clear(v75.ref);
end;
v0.new = function() --[[ Line: 247 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), l_create_0 (copy), v0 (copy)
    return (setmetatable({
        point = v12.point, 
        next = v12.next, 
        size = v12.size, 
        buffer = l_create_0(v12.bufferSize), 
        ref = {}
    }, v0));
end;
v0.remove = function(v76) --[[ Line: 257 ]] --[[ Name: remove ]]
    v76:flush();
    table.clear(v76);
    setmetatable(v76, nil);
end;
return v0.new;