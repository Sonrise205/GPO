return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.assertDeepEqual);
    local v1 = require(script.Parent.createSpy);
    local v2 = require(script.Parent.Logging);
    local v3 = require(script.Parent.SingleEventManager);
    describe("new", function() --[[ Line: 8 ]]
        -- upvalues: v3 (copy)
        it("should create a SingleEventManager", function() --[[ Line: 9 ]]
            -- upvalues: v3 (ref)
            local v4 = v3.new();
            expect(v4).to.be.ok();
        end);
    end);
    describe("connectEvent", function() --[[ Line: 16 ]]
        -- upvalues: v3 (copy), v1 (copy), v0 (copy), v2 (copy)
        it("should connect to events", function() --[[ Line: 17 ]]
            -- upvalues: v3 (ref), v1 (ref)
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v6 = v3.new(l_BindableEvent_0);
            local v7 = v1();
            v6:connectEvent("Event", v7.value);
            v6:resume();
            l_BindableEvent_0:Fire("foo");
            expect(v7.callCount).to.equal(1);
            v7:assertCalledWith(l_BindableEvent_0, "foo");
            l_BindableEvent_0:Fire("bar");
            expect(v7.callCount).to.equal(2);
            v7:assertCalledWith(l_BindableEvent_0, "bar");
            v6:connectEvent("Event", nil);
            l_BindableEvent_0:Fire("baz");
            expect(v7.callCount).to.equal(2);
        end);
        it("should drop events until resumed initially", function() --[[ Line: 39 ]]
            -- upvalues: v3 (ref), v1 (ref)
            local l_BindableEvent_1 = Instance.new("BindableEvent");
            local v9 = v3.new(l_BindableEvent_1);
            local v10 = v1();
            v9:connectEvent("Event", v10.value);
            l_BindableEvent_1:Fire("foo");
            expect(v10.callCount).to.equal(0);
            v9:resume();
            l_BindableEvent_1:Fire("bar");
            expect(v10.callCount).to.equal(1);
            v10:assertCalledWith(l_BindableEvent_1, "bar");
        end);
        it("should invoke suspended events when resumed", function() --[[ Line: 56 ]]
            -- upvalues: v3 (ref), v1 (ref)
            local l_BindableEvent_2 = Instance.new("BindableEvent");
            local v12 = v3.new(l_BindableEvent_2);
            local v13 = v1();
            v12:connectEvent("Event", v13.value);
            v12:resume();
            l_BindableEvent_2:Fire("foo");
            expect(v13.callCount).to.equal(1);
            v13:assertCalledWith(l_BindableEvent_2, "foo");
            v12:suspend();
            l_BindableEvent_2:Fire("bar");
            expect(v13.callCount).to.equal(1);
            v12:resume();
            expect(v13.callCount).to.equal(2);
            v13:assertCalledWith(l_BindableEvent_2, "bar");
        end);
        it("should invoke events triggered during resumption in the correct order", function() --[[ Line: 78 ]]
            -- upvalues: v3 (ref), v1 (ref), v0 (ref)
            local l_BindableEvent_3 = Instance.new("BindableEvent");
            local v15 = v3.new(l_BindableEvent_3);
            local v16 = {};
            local v19 = v1(function(_, v18) --[[ Line: 83 ]]
                -- upvalues: v16 (copy), l_BindableEvent_3 (copy)
                table.insert(v16, v18);
                if v18 == 2 then
                    l_BindableEvent_3:Fire(3);
                    return;
                else
                    if v18 == 3 then
                        l_BindableEvent_3:Fire(4);
                    end;
                    return;
                end;
            end);
            v15:connectEvent("Event", v19.value);
            v15:suspend();
            l_BindableEvent_3:Fire(1);
            l_BindableEvent_3:Fire(2);
            v15:resume();
            expect(v19.callCount).to.equal(4);
            v0(v16, {
                1, 
                2, 
                3, 
                4
            });
        end);
        it("should not invoke events fired during suspension but disconnected before resumption", function() --[[ Line: 104 ]]
            -- upvalues: v3 (ref), v1 (ref)
            local l_BindableEvent_4 = Instance.new("BindableEvent");
            local v21 = v3.new(l_BindableEvent_4);
            local v22 = v1();
            v21:connectEvent("Event", v22.value);
            v21:suspend();
            l_BindableEvent_4:Fire(1);
            v21:connectEvent("Event", nil);
            v21:resume();
            expect(v22.callCount).to.equal(0);
        end);
        it("should not yield events through the SingleEventManager when resuming", function() --[[ Line: 120 ]]
            -- upvalues: v3 (ref)
            local l_BindableEvent_5 = Instance.new("BindableEvent");
            local v24 = v3.new(l_BindableEvent_5);
            v24:connectEvent("Event", function() --[[ Line: 124 ]]
                coroutine.yield();
            end);
            v24:resume();
            local v25 = coroutine.create(function() --[[ Line: 130 ]]
                -- upvalues: l_BindableEvent_5 (copy)
                l_BindableEvent_5:Fire(5);
            end);
            assert(coroutine.resume(v25));
            expect(coroutine.status(v25)).to.equal("dead");
            v24:suspend();
            l_BindableEvent_5:Fire(5);
            v25 = coroutine.create(function() --[[ Line: 140 ]]
                -- upvalues: v24 (copy)
                v24:resume();
            end);
            assert(coroutine.resume(v25));
            expect(coroutine.status(v25)).to.equal("dead");
        end);
        it("should not throw errors through SingleEventManager when resuming", function() --[[ Line: 148 ]]
            -- upvalues: v3 (ref), v2 (ref)
            local l_BindableEvent_6 = Instance.new("BindableEvent");
            local v27 = v3.new(l_BindableEvent_6);
            v27:connectEvent("Event", function() --[[ Line: 154 ]]
                error("Error from SingleEventManager test");
            end);
            v27:resume();
            v27:suspend();
            l_BindableEvent_6:Fire(5);
            local v28 = v2.capture(function() --[[ Line: 167 ]]
                -- upvalues: v27 (copy)
                v27:resume();
            end);
            expect(#v28.errors).to.equal(0);
            expect(#v28.warnings).to.equal(1);
            expect(#v28.infos).to.equal(0);
            expect(v28.warnings[1]:find("Error from SingleEventManager test")).to.be.ok();
        end);
        it("should not overflow with events if manager:resume() is invoked when resuming a suspended event", function() --[[ Line: 178 ]]
            -- upvalues: v3 (ref), v1 (ref)
            local l_BindableEvent_7 = Instance.new("BindableEvent");
            local v30 = v3.new(l_BindableEvent_7);
            local v33 = v1(function(_, v32) --[[ Line: 186 ]]
                -- upvalues: v30 (copy), l_BindableEvent_7 (copy)
                if v32 == 1 then
                    v30:suspend();
                    l_BindableEvent_7:Fire(2);
                    v30:resume();
                end;
            end);
            v30:connectEvent("Event", v33.value);
            v30:suspend();
            l_BindableEvent_7:Fire(1);
            v30:resume();
            expect(v33.callCount).to.equal(2);
        end);
    end);
    describe("connectPropertyChange", function() --[[ Line: 204 ]]
        -- upvalues: v3 (copy), v1 (copy)
        it("should connect to property changes", function() --[[ Line: 208 ]]
            -- upvalues: v3 (ref), v1 (ref)
            local l_Folder_0 = Instance.new("Folder");
            local v35 = v3.new(l_Folder_0);
            local v36 = v1();
            v35:connectPropertyChange("Name", v36.value);
            v35:resume();
            l_Folder_0.Name = "foo";
            expect(v36.callCount).to.equal(1);
            v36:assertCalledWith(l_Folder_0);
            l_Folder_0.Name = "bar";
            expect(v36.callCount).to.equal(2);
            v36:assertCalledWith(l_Folder_0);
            v35:connectPropertyChange("Name");
            l_Folder_0.Name = "baz";
            expect(v36.callCount).to.equal(2);
        end);
        it("should throw an error if the property is invalid", function() --[[ Line: 230 ]]
            -- upvalues: v3 (ref)
            local l_Folder_1 = Instance.new("Folder");
            local v38 = v3.new(l_Folder_1);
            expect(function() --[[ Line: 234 ]]
                -- upvalues: v38 (copy)
                v38:connectPropertyChange("foo", function() --[[ Line: 235 ]]

                end);
            end).to.throw();
        end);
    end);
end;