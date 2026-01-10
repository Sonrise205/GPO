return function() --[[ Line: 1 ]]
    local l_RunService_0 = game:GetService("RunService");
    local v1 = require(script.Parent.BaseMotor);
    describe("connection management", function() --[[ Line: 6 ]]
        -- upvalues: v1 (copy)
        local v2 = v1.new();
        it("should hook up connections on :start()", function() --[[ Line: 9 ]]
            -- upvalues: v2 (copy)
            v2:start();
            expect((typeof(v2._connection))).to.equal("RBXScriptConnection");
        end);
        it("should remove connections on :stop() or :destroy()", function() --[[ Line: 14 ]]
            -- upvalues: v2 (copy)
            v2:stop();
            expect(v2._connection).to.equal(nil);
        end);
    end);
    it("should call :step() with deltaTime", function() --[[ Line: 20 ]]
        -- upvalues: v1 (copy), l_RunService_0 (copy)
        local v3 = v1.new();
        local v4 = nil;
        v3.step = function(_, ...) --[[ Line: 24 ]] --[[ Name: step ]]
            -- upvalues: v4 (ref), v3 (copy)
            v4 = {
                ...
            };
            v3:stop();
        end;
        v3:start();
        local v6 = l_RunService_0.RenderStepped:Wait();
        l_RunService_0.RenderStepped:Wait();
        expect(v4).to.be.ok();
        expect(v4[1]).to.equal(v6);
    end);
end;