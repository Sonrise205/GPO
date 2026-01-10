return {
    CreateNewSignal = function(_) --[[ Line: 32 ]] --[[ Name: CreateNewSignal ]]
        local v1 = {};
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local v3 = {};
        v1.Connect = function(_, v5) --[[ Line: 38 ]] --[[ Name: Connect ]]
            -- upvalues: l_BindableEvent_0 (copy), v3 (copy)
            if typeof(v5) ~= "function" then
                error("Argument #1 of Connect must be a function, got a " .. typeof(v5), 2);
            end;
            local v6 = l_BindableEvent_0.Event:Connect(v5);
            v3[v6] = true;
            local v8 = {
                disconnect = function(_) --[[ Line: 45 ]] --[[ Name: disconnect ]]
                    -- upvalues: v6 (copy), v3 (ref)
                    v6:Disconnect();
                    v3[v6] = nil;
                end
            };
            v8.Disconnect = v8.disconnect;
            return v8;
        end;
        v1.disconnectAll = function(_) --[[ Line: 55 ]] --[[ Name: disconnectAll ]]
            -- upvalues: v3 (copy)
            for v10, _ in v3 do
                v10:Disconnect();
                v3[v10] = nil;
            end;
        end;
        v1.Wait = function(_) --[[ Line: 62 ]] --[[ Name: Wait ]]
            -- upvalues: l_BindableEvent_0 (copy)
            return l_BindableEvent_0.Event:Wait();
        end;
        v1.fire = function(_, ...) --[[ Line: 66 ]] --[[ Name: fire ]]
            -- upvalues: l_BindableEvent_0 (copy)
            l_BindableEvent_0:Fire(...);
        end;
        v1.Connect = v1.Connect;
        v1.DisconnectAll = v1.disconnectAll;
        v1.Wait = v1.wait;
        v1.Fire = v1.fire;
        return v1;
    end
};