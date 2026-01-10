local v0 = {
    [648454481] = {
        [3978370137] = "First Sea", 
        [7465136166] = "Second Sea", 
        [6811831486] = "Trade Hub", 
        [10218387007] = "VC Trade Hub"
    }, 
    [2097989947] = {
        [5875630735] = "First Sea", 
        [7122743591] = "Second Sea", 
        [6729320818] = "Trade Hub"
    }
};
return {
    GetGameIds = function(_) --[[ Line: 18 ]] --[[ Name: GetGameIds ]]
        -- upvalues: v0 (copy)
        return v0;
    end, 
    GetPlaceIds = function(_) --[[ Line: 22 ]] --[[ Name: GetPlaceIds ]]
        -- upvalues: v0 (copy)
        return v0[game.GameId];
    end
};