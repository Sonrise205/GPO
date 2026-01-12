return {
    Play = function(_, v1, v2) --[[ Line: 4 ]] --[[ Name: Play ]]
        if not (v2 or {}).Position then
            local _ = Vector3.new();
        end;
        local _ = v1:Clone();
    end, 
    FadeOut = function(_, _, _) --[[ Line: 11 ]] --[[ Name: FadeOut ]]

    end
};