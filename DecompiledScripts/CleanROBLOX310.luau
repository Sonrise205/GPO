local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local function _(v3) --[[ Line: 5 ]] --[[ Name: ClearPlayer ]]
    -- upvalues: l_RunService_0 (copy)
    task.delay(1, function() --[[ Line: 6 ]]
        -- upvalues: l_RunService_0 (ref), v3 (copy)
        l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-friendstatuslabel-" .. v3.Name);
        l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-blockbutton-" .. v3.Name);
        l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-mutestatusbutton-" .. v3.Name);
        l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-reportplayer-" .. v3.Name);
        l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-inspect-" .. v3.Name);
        l_RunService_0:UnbindFromRenderStep("utility-focus-state-sharegame");
        l_RunService_0:UnbindFromRenderStep("utility-focus-state-muteall");
    end);
end;
l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 17 ]]
    -- upvalues: l_Players_0 (copy), l_RunService_0 (copy)
    for _, v6 in ipairs(l_Players_0:GetPlayers()) do
        task.delay(1, function() --[[ Line: 6 ]]
            -- upvalues: l_RunService_0 (ref), v6 (copy)
            l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-friendstatuslabel-" .. v6.Name);
            l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-blockbutton-" .. v6.Name);
            l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-mutestatusbutton-" .. v6.Name);
            l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-reportplayer-" .. v6.Name);
            l_RunService_0:UnbindFromRenderStep("utility-focus-state" .. "-inspect-" .. v6.Name);
            l_RunService_0:UnbindFromRenderStep("utility-focus-state-sharegame");
            l_RunService_0:UnbindFromRenderStep("utility-focus-state-muteall");
        end);
    end;
end);