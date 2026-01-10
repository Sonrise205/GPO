client = nil;
service = nil;
local l_AdonisModernComponents_0 = script.Parent.Components.AdonisModernComponents;
local l_Packages_0 = l_AdonisModernComponents_0.Parent.Packages;
local v2 = require(l_Packages_0.Maid);
local v3 = require(l_Packages_0.Signal);
local v4 = require(l_Packages_0.Roact);
local l_createElement_0 = v4.createElement;
local v6 = require(l_AdonisModernComponents_0.FadeInOutAnimationWrapper);
local v7 = require(l_AdonisModernComponents_0.Message);
return function(v8) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v3 (copy), l_createElement_0 (copy), v6 (copy), v7 (copy), v4 (copy)
    local v9 = v2.new();
    local v10 = v3.new();
    local v11 = v3.new();
    v9.FadeInSignal = v10;
    v9.FadeOutSignal = v11;
    local v12 = l_createElement_0("ScreenGui", {
        DisplayOrder = v8.DisplayOrder or 100, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        AnimationContainer = l_createElement_0(v6, {
            FadeInSignal = v10, 
            FadeOutSignal = v11, 
            FadeInVelocity = 3, 
            FadeOutVelocity = 4, 
            OnFadeOutCompleted = function() --[[ Line: 36 ]] --[[ Name: OnFadeOutCompleted ]]
                -- upvalues: v9 (copy)
                v9:Destroy();
            end
        }, {
            Message = l_createElement_0(v7, {
                Condensed = true, 
                BodyText = v8.Message, 
                Image = v8.Image, 
                TitleText = v8.Title
            })
        })
    });
    local v13 = {
        Type = "Small Screen Message", 
        Title = v8.Title, 
        Message = v8.Message, 
        Icon = v8.Image, 
        Time = os.date("%X"), 
        Function = nil
    };
    table.insert(client.Variables.CommunicationsHistory, v13);
    service.Events.CommsPanel:Fire(v13);
    local v14 = v4.mount(v12, service.UnWrap(service.PlayerGui), "AdonisUI.Notification");
    v9.RemoveHandle = function() --[[ Line: 66 ]]
        -- upvalues: v14 (ref), v4 (ref)
        v14 = v4.unmount(v14);
    end;
    v10:Fire();
    if v8.Time then
        task.wait(v8.Time);
    else
        task.wait(("%s%s"):format(v8.Message or "", v8.Title or ""):len() / 19 + 2.5);
    end;
    v11:Fire();
end;