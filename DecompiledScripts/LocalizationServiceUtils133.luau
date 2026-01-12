local v0 = require(script.Parent.loader).load(script);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RunService_0 = game:GetService("RunService");
local v3 = v0("Promise");
return {
    promiseTranslator = function(v4) --[[ Line: 15 ]] --[[ Name: promiseTranslator ]]
        -- upvalues: v3 (copy), l_LocalizationService_0 (copy), l_RunService_0 (copy)
        local v10 = v3.spawn(function(v5, v6) --[[ Line: 16 ]]
            -- upvalues: l_LocalizationService_0 (ref), v4 (copy)
            local v7 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
                -- upvalues: v7 (ref), l_LocalizationService_0 (ref), v4 (ref)
                v7 = l_LocalizationService_0:GetTranslatorForPlayerAsync(v4);
            end);
            if not l_status_0 then
                v6(l_result_0 or "Failed to GetTranslatorForPlayerAsync");
                return;
            elseif v7 then
                assert(typeof(v7) == "Instance", "Bad translator");
                v5(v7);
                return;
            else
                v6("Translator was not returned");
                return;
            end;
        end);
        local v11 = 20;
        if l_RunService_0:IsStudio() then
            v11 = 0.5;
        end;
        task.delay(v11, function() --[[ Line: 43 ]]
            -- upvalues: v10 (copy), v11 (ref)
            if not v10:IsPending() then
                return;
            else
                v10:Reject(("GetTranslatorForPlayerAsync is still pending after %f, using local table"):format(v11));
                return;
            end;
        end);
        return v10:Catch(function(v12) --[[ Line: 52 ]]
            -- upvalues: l_LocalizationService_0 (ref), v4 (copy)
            if v12 ~= "Publishing the game is required to use GetTranslatorForPlayerAsync API." then
                warn(("[LocalizationServiceUtils.promiseTranslator] - %s"):format((tostring(v12))));
            end;
            return (l_LocalizationService_0:GetTranslatorForPlayer(v4));
        end);
    end
};