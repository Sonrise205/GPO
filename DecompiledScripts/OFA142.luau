local l_Styles_0 = require(script.Parent.Parent:WaitForChild("Styles"));
OFA = function(v1) --[[ Line: 4 ]]
    -- upvalues: l_Styles_0 (copy)
    task.spawn(function() --[[ Line: 5 ]]
        -- upvalues: l_Styles_0 (ref), v1 (copy)
        l_Styles_0.ChunkCrater(v1, {
            Angle = {
                45, 
                65
            }, 
            Tilt = {
                -15, 
                15
            }, 
            Height = {
                -0.5, 
                0.8
            }, 
            BlockSize = {
                1.25, 
                2
            }, 
            PartCount = 20, 
            Radius = 10, 
            IterateSpeed = {
                Entrance = 0.1, 
                EntranceDivision = 2, 
                Exit = 0.25, 
                ExitDivision = 2
            }
        });
    end);
    task.spawn(function() --[[ Line: 22 ]]
        -- upvalues: l_Styles_0 (ref), v1 (copy)
        l_Styles_0.Break(v1, {
            Radius = 15, 
            PartCount = 15, 
            BlockSize = {
                0.25, 
                3
            }, 
            Height = {
                15, 
                25
            }, 
            Angle = {
                -5, 
                5
            }, 
            Tilt = {
                -5, 
                5
            }, 
            Width = {
                -35, 
                35
            }, 
            IterateSpeed = {
                Entrance = 0.1, 
                EntranceDivision = 2, 
                Exit = 0.25, 
                ExitDivision = 2
            }
        });
    end);
    l_Styles_0.ChunkCrater(v1, {
        Angle = {
            45, 
            65
        }, 
        Tilt = {
            -15, 
            15
        }, 
        Height = {
            -0.5, 
            0.8
        }, 
        BlockSize = {
            2, 
            3
        }, 
        PartCount = 20, 
        Radius = 15, 
        IterateSpeed = {
            Entrance = 0.1, 
            EntranceDivision = 2, 
            Exit = 0.25, 
            ExitDivision = 2
        }
    });
end;
return OFA;