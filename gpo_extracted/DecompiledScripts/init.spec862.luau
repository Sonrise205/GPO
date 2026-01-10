local function v3(v0, v1) --[[ Line: 1 ]] --[[ Name: AwaitCondition ]]
    local v2 = os.clock();
    v1 = v1 or 10;
    while true do
        if v0() then
            return true;
        elseif v1 < os.clock() - v2 then
            return false;
        else
            task.wait();
        end;
    end;
end;
return function() --[[ Line: 15 ]]
    -- upvalues: v3 (copy)
    local v4 = require(script.Parent);
    local v5 = nil;
    local function _(v6) --[[ Line: 20 ]] --[[ Name: NumConns ]]
        -- upvalues: v5 (ref)
        return #(v6 or v5):GetConnections();
    end;
    beforeEach(function() --[[ Line: 25 ]]
        -- upvalues: v5 (ref), v4 (copy)
        v5 = v4.new();
    end);
    afterEach(function() --[[ Line: 29 ]]
        -- upvalues: v5 (ref)
        v5:Destroy();
    end);
    describe("Constructor", function() --[[ Line: 33 ]]
        -- upvalues: v4 (copy), v5 (ref), v3 (ref)
        it("should create a new signal and fire it", function() --[[ Line: 34 ]]
            -- upvalues: v4 (ref), v5 (ref)
            expect(v4.Is(v5)).to.equal(true);
            task.defer(function() --[[ Line: 36 ]]
                -- upvalues: v5 (ref)
                v5:Fire(10, 20);
            end);
            local v8, v9 = v5:Wait();
            expect(v8).to.equal(10);
            expect(v9).to.equal(20);
        end);
        it("should create a proxy signal and connect to it", function() --[[ Line: 44 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local v10 = v4.Wrap(game:GetService("RunService").Heartbeat);
            expect(v4.Is(v10)).to.equal(true);
            local v11 = false;
            v10:Connect(function() --[[ Line: 48 ]]
                -- upvalues: v11 (ref)
                v11 = true;
            end);
            expect(v3(function() --[[ Line: 51 ]]
                -- upvalues: v11 (ref)
                return v11;
            end, 2)).to.equal(true);
            v10:Destroy();
        end);
    end);
    describe("FireDeferred", function() --[[ Line: 58 ]]
        -- upvalues: v5 (ref), v3 (ref)
        it("should be able to fire primitive argument", function() --[[ Line: 59 ]]
            -- upvalues: v5 (ref), v3 (ref)
            local v12 = nil;
            v5:Connect(function(v13) --[[ Line: 62 ]]
                -- upvalues: v12 (ref)
                v12 = v13;
            end);
            v5:FireDeferred(10);
            expect(v3(function() --[[ Line: 66 ]]
                -- upvalues: v12 (ref)
                return v12 == 10;
            end, 1)).to.equal(true);
        end);
        it("should be able to fire a reference based argument", function() --[[ Line: 71 ]]
            -- upvalues: v5 (ref), v3 (ref)
            local v14 = {
                10, 
                20
            };
            local v15 = nil;
            v5:Connect(function(v16) --[[ Line: 74 ]]
                -- upvalues: v15 (ref)
                v15 = v16;
            end);
            v5:FireDeferred(v14);
            expect(v3(function() --[[ Line: 78 ]]
                -- upvalues: v14 (copy), v15 (ref)
                return v14 == v15;
            end, 1)).to.equal(true);
        end);
    end);
    describe("Fire", function() --[[ Line: 84 ]]
        -- upvalues: v5 (ref)
        it("should be able to fire primitive argument", function() --[[ Line: 85 ]]
            -- upvalues: v5 (ref)
            local v17 = nil;
            v5:Connect(function(v18) --[[ Line: 88 ]]
                -- upvalues: v17 (ref)
                v17 = v18;
            end);
            v5:Fire(10);
            expect(v17).to.equal(10);
        end);
        it("should be able to fire a reference based argument", function() --[[ Line: 95 ]]
            -- upvalues: v5 (ref)
            local v19 = {
                10, 
                20
            };
            local v20 = nil;
            v5:Connect(function(v21) --[[ Line: 98 ]]
                -- upvalues: v20 (ref)
                v20 = v21;
            end);
            v5:Fire(v19);
            expect(v20).to.equal(v19);
        end);
    end);
    describe("ConnectOnce", function() --[[ Line: 106 ]]
        -- upvalues: v5 (ref)
        it("should only capture first fire", function() --[[ Line: 107 ]]
            -- upvalues: v5 (ref)
            local v22 = nil;
            local v24 = v5:ConnectOnce(function(v23) --[[ Line: 109 ]]
                -- upvalues: v22 (ref)
                v22 = v23;
            end);
            expect(v24.Connected).to.equal(true);
            v5:Fire(10);
            expect(v24.Connected).to.equal(false);
            v5:Fire(20);
            expect(v22).to.equal(10);
        end);
    end);
    describe("Wait", function() --[[ Line: 120 ]]
        -- upvalues: v5 (ref)
        it("should be able to wait for a signal to fire", function() --[[ Line: 121 ]]
            -- upvalues: v5 (ref)
            task.defer(function() --[[ Line: 122 ]]
                -- upvalues: v5 (ref)
                v5:Fire(10, 20, 30);
            end);
            local v25, v26, v27 = v5:Wait();
            expect(v25).to.equal(10);
            expect(v26).to.equal(20);
            expect(v27).to.equal(30);
        end);
    end);
    describe("DisconnectAll", function() --[[ Line: 132 ]]
        -- upvalues: v5 (ref)
        it("should disconnect all connections", function() --[[ Line: 133 ]]
            -- upvalues: v5 (ref)
            v5:Connect(function() --[[ Line: 134 ]]

            end);
            v5:Connect(function() --[[ Line: 135 ]]

            end);
            expect(#(nil or v5):GetConnections()).to.equal(2);
            v5:DisconnectAll();
            expect(#(nil or v5):GetConnections()).to.equal(0);
        end);
    end);
    describe("Disconnect", function() --[[ Line: 142 ]]
        -- upvalues: v5 (ref), v3 (ref)
        it("should disconnect connection", function() --[[ Line: 143 ]]
            -- upvalues: v5 (ref)
            local v28 = v5:Connect(function() --[[ Line: 144 ]]

            end);
            expect(#(nil or v5):GetConnections()).to.equal(1);
            v28:Disconnect();
            expect(#(nil or v5):GetConnections()).to.equal(0);
        end);
        it("should still work if connections disconnected while firing", function() --[[ Line: 150 ]]
            -- upvalues: v5 (ref)
            local v29 = 0;
            local v30 = nil;
            v5:Connect(function() --[[ Line: 153 ]]
                -- upvalues: v29 (ref)
                v29 = v29 + 1;
            end);
            v30 = v5:Connect(function() --[[ Line: 156 ]]
                -- upvalues: v30 (ref), v29 (ref)
                v30:Disconnect();
                v29 = v29 + 1;
            end);
            v5:Connect(function() --[[ Line: 160 ]]
                -- upvalues: v29 (ref)
                v29 = v29 + 1;
            end);
            v5:Fire();
            expect(v29).to.equal(3);
        end);
        it("should still work if connections disconnected while firing deferred", function() --[[ Line: 167 ]]
            -- upvalues: v5 (ref), v3 (ref)
            local v31 = 0;
            local v32 = nil;
            v5:Connect(function() --[[ Line: 170 ]]
                -- upvalues: v31 (ref)
                v31 = v31 + 1;
            end);
            v32 = v5:Connect(function() --[[ Line: 173 ]]
                -- upvalues: v32 (ref), v31 (ref)
                v32:Disconnect();
                v31 = v31 + 1;
            end);
            v5:Connect(function() --[[ Line: 177 ]]
                -- upvalues: v31 (ref)
                v31 = v31 + 1;
            end);
            v5:FireDeferred();
            expect(v3(function() --[[ Line: 181 ]]
                -- upvalues: v31 (ref)
                return v31 == 3;
            end)).to.equal(true);
        end);
    end);
end;