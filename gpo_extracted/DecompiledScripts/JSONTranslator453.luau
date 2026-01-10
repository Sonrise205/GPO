local v0 = require(script.Parent.loader).load(script);
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v3 = v0("JsonToLocalizationTable");
local v4 = v0("PseudoLocalize");
local v5 = v0("LocalizationServiceUtils");
local v6 = v0("Promise");
local v7 = v0("Observable");
local v8 = v0("Maid");
local v9 = v0("Blend");
local v10 = v0("Rx");
local v11 = {
    ClassName = "JSONTranslator"
};
v11.__index = v11;
v11.new = function(...) --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v3 (copy), l_RunService_0 (copy), v5 (copy), l_Players_0 (copy), v6 (copy), v4 (copy)
    local v12 = setmetatable({}, v11);
    v12._localizationTable = v3.toLocalizationTable(...);
    v12._englishTranslator = v12._localizationTable:GetTranslator("en");
    v12._fallbacks = {};
    if l_RunService_0:IsRunning() then
        v12._promiseTranslator = v5.promiseTranslator(l_Players_0.LocalPlayer);
    else
        v12._promiseTranslator = v6.resolved(v12._englishTranslator);
    end;
    if l_RunService_0:IsStudio() then
        v4.addToLocalizationTable(v12._localizationTable, nil, "en");
    end;
    return v12;
end;
v11.GetLocalizationTable = function(v13) --[[ Line: 66 ]] --[[ Name: GetLocalizationTable ]]
    return v13._localizationTable;
end;
v11.PromiseLoaded = function(v14) --[[ Line: 74 ]] --[[ Name: PromiseLoaded ]]
    return v14._promiseTranslator;
end;
v11.FallbackTo = function(v15, v16) --[[ Line: 85 ]] --[[ Name: FallbackTo ]]
    assert(v16, "Bad translator");
    assert(v16.FormatByKey, "Bad translator");
    table.insert(v15._fallbacks, v16);
end;
v11.PromiseFormatByKey = function(v17, v18, v19) --[[ Line: 98 ]] --[[ Name: PromiseFormatByKey ]]
    -- upvalues: v11 (copy)
    assert(v17 ~= v11, "Construct a new version of this class to use it");
    assert(type(v18) == "string", "Key must be a string");
    return v17._promiseTranslator:Then(function() --[[ Line: 102 ]]
        -- upvalues: v17 (copy), v18 (copy), v19 (copy)
        return v17:FormatByKey(v18, v19);
    end);
end;
v11.ObserveFormatByKey = function(v20, v21, v22) --[[ Line: 113 ]] --[[ Name: ObserveFormatByKey ]]
    -- upvalues: v11 (copy), v9 (copy), v10 (copy), v7 (copy), v8 (copy)
    assert(v20 ~= v11, "Construct a new version of this class to use it");
    assert(type(v21) == "string", "Key must be a string");
    local v23 = nil;
    if v22 then
        local v24 = {};
        for v25, v26 in pairs(v22) do
            v24[v25] = v9.toPropertyObservable(v26) or v10.of(v26);
        end;
        v23 = v10.combineLatest(v24);
    else
        v23 = nil;
    end;
    return v7.new(function(v27) --[[ Line: 129 ]]
        -- upvalues: v8 (ref), v20 (copy), v23 (ref), v21 (copy)
        local v28 = v8.new();
        v28:GivePromise(v20._promiseTranslator:Then(function() --[[ Line: 132 ]]
            -- upvalues: v23 (ref), v28 (copy), v27 (copy), v20 (ref), v21 (ref)
            if v23 then
                v28:GiveTask(v23:Subscribe(function(v29) --[[ Line: 134 ]]
                    -- upvalues: v27 (ref), v20 (ref), v21 (ref)
                    v27:Fire(v20:FormatByKey(v21, v29));
                end));
                return;
            else
                v27:Fire(v20:FormatByKey(v21, nil));
                return;
            end;
        end));
        return v28;
    end);
end;
v11.FormatByKey = function(v30, v31, v32) --[[ Line: 152 ]] --[[ Name: FormatByKey ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy)
    assert(v30 ~= v11, "Construct a new version of this class to use it");
    assert(type(v31) == "string", "Key must be a string");
    if not l_RunService_0:IsRunning() then
        return v30:_formatByKeyTestMode(v31, v32);
    else
        local v33 = v30:_getClientTranslatorOrError();
        local v34 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 163 ]]
            -- upvalues: v34 (ref), v33 (copy), v31 (copy), v32 (copy)
            v34 = v33:FormatByKey(v31, v32);
        end);
        if l_status_0 and not l_result_0 then
            return v34;
        else
            if l_result_0 then
                warn(l_result_0);
            else
                warn("Failed to localize '" .. v31 .. "'");
            end;
            if v33.LocaleId ~= v30._englishTranslator.LocaleId then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 180 ]]
                    -- upvalues: v34 (ref), v30 (copy), v31 (copy), v32 (copy)
                    v34 = v30._englishTranslator:FormatByKey(v31, v32);
                end);
                l_status_0 = l_status_1;
                l_result_0 = l_result_1;
                if l_status_0 and not l_result_0 then
                    return v34;
                end;
            end;
            return v31;
        end;
    end;
end;
v11._getClientTranslatorOrError = function(v39) --[[ Line: 192 ]] --[[ Name: _getClientTranslatorOrError ]]
    assert(v39._promiseTranslator, "ClientTranslator is not initialized");
    if v39._promiseTranslator:IsFulfilled() then
        return assert(v39._promiseTranslator:Wait(), "Failed to get translator");
    else
        error("Translator is not yet acquired yet");
        return nil;
    end;
end;
v11._formatByKeyTestMode = function(v40, v41, v42) --[[ Line: 203 ]] --[[ Name: _formatByKeyTestMode ]]
    local l_Translator_0 = v40._localizationTable:GetTranslator("en");
    local v44 = nil;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 207 ]]
        -- upvalues: v44 (ref), l_Translator_0 (copy), v41 (copy), v42 (copy)
        v44 = l_Translator_0:FormatByKey(v41, v42);
    end);
    if l_status_2 and not l_result_2 then
        return v44;
    else
        for _, v48 in pairs(v40._fallbacks) do
            local v49 = v48:FormatByKey(v41, v42);
            if v49 then
                return v49;
            end;
        end;
        if l_result_2 then
            warn(l_result_2);
        else
            warn("Failed to localize '" .. v41 .. "'");
        end;
        return v41;
    end;
end;
v11.Destroy = function(v50) --[[ Line: 234 ]] --[[ Name: Destroy ]]
    v50._localizationTable:Destroy();
    v50._localizationTable = nil;
    v50._englishTranslator = nil;
    v50._promiseTranslator = nil;
    setmetatable(v50, nil);
end;
return v11;