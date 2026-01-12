return {
    Get = function(_) --[[ Line: 3 ]] --[[ Name: Get ]]
        local v1 = {
            Accl = 0.075, 
            Brake = 0.1, 
            Rotate = 0.005, 
            Deep = 5, 
            TiltAngle = 0.05, 
            Type = "Rowboat", 
            ShipWheel = "Rowboat", 
            GuiSize = UDim2.new(15, 0, 4, 0), 
            Offset = Vector3.new(0, 8, 0, 0)
        };
        if _G.checkscript ~= nil then
            _G.checkscript();
        end;
        return v1;
    end
};