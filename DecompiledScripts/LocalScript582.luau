local v0 = _G.stormResolution[1] / 11001;
while true do
    local l_X_0 = _G.stormPart.Mesh.Scale.X;
    local v2 = l_X_0 / (5.25 * v0);
    if game.ReplicatedStorage:FindFirstChild("resizeNum") then
        v2 = l_X_0 / game.ReplicatedStorage.resizeNum.Value;
    end;
    v2 = math.clamp(v2, 12, 100000000000);
    script.Parent.Size = UDim2.new(0, v2, 0, v2);
    task.wait();
end;