local _ = game:GetService("PhysicsService");
return {
    SetCharacterCollision = function(_, v2, v3) --[[ Line: 5 ]] --[[ Name: SetCharacterCollision ]]
        if v2.PrimaryPart.CollisionGroup == v3 then
            return;
        else
            for _, v5 in ipairs(v2:GetChildren()) do
                if v5:IsA("BasePart") and v5.CollisionGroupId ~= 1 then
                    _G.setCollisionGroup(v5, v3);
                end;
            end;
            return;
        end;
    end
};