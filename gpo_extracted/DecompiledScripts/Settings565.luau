return {
    Get = function(_) --[[ Line: 3 ]] --[[ Name: Get ]]
        local v1 = {
            Accl = 0.2, 
            Brake = 0.3, 
            Rotate = 0.005, 
            Deep = 10, 
            TiltAngle = 0.05, 
            Type = "Caravel", 
            ShipWheel = "WheelShip"
        };
        if _G.checkscript ~= nil then
            _G.checkscript();
        end;
        return v1;
    end
};