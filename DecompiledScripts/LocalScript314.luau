while true do
    task.wait();
    local l_X_0 = _G.stormPart.Mesh.Scale.X;
    local v1 = l_X_0 / 5.25;
    if game.ReplicatedStorage:FindFirstChild("resizeNum") then
        v1 = l_X_0 / game.ReplicatedStorage.resizeNum.Value;
    end;
    v1 = math.clamp(v1, 12, 100000000000);
    script.Parent.Size = UDim2.new(0, v1, 0, v1);
end;