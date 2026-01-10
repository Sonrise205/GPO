local function v4(v0) --[[ Line: 2 ]] --[[ Name: Pool ]]
    local v1 = {};
    for _, v3 in v0 do
        table.insert(v1, {
            Chance = v3.Chance or 100, 
            Items = v3.Items or {
                {
                    Name = v3.Name, 
                    Amount = v3.Amount or 1
                }
            }
        });
    end;
    return {
        ItemPool = v1
    };
end;
return {
    (function(v5) --[[ Line: 18 ]] --[[ Name: FruitPool ]]
        -- upvalues: v4 (copy)
        local v6 = {};
        for _, v8 in v5 do
            table.insert(v6, {
                Chance = 100, 
                Name = v8, 
                Amount = 1
            });
        end;
        return (v4(v6));
    end)({
        "Bari", 
        "Bomb", 
        "Mero", 
        "Gomu", 
        "Horo"
    }), 
    v4({
        {
            Chance = 100, 
            Items = {
                {
                    Name = "2x EXP", 
                    Amount = 60
                }, 
                {
                    Name = "Race Reroll", 
                    Amount = 10
                }
            }
        }
    }), 
    v4({
        {
            Chance = 5, 
            Name = "Race Reroll", 
            Amount = 25
        }, 
        {
            Chance = 35, 
            Name = "Dark Root", 
            Amount = 1
        }, 
        {
            Chance = 50, 
            Name = "2x EXP", 
            Amount = 30
        }, 
        {
            Chance = 100, 
            Name = "SP Reset Essence", 
            Amount = 1
        }
    }), 
    v4({
        {
            Chance = 100, 
            Items = {
                {
                    Name = "2x EXP", 
                    Amount = 60
                }, 
                {
                    Name = "Race Reroll", 
                    Amount = 10
                }
            }
        }
    }), 
    v4({
        {
            Chance = 5, 
            Name = "2x EXP", 
            Amount = 60
        }, 
        {
            Chance = 25, 
            Name = "Race Reroll", 
            Amount = 8
        }, 
        {
            Chance = 100, 
            Name = "SP Reset Essence", 
            Amount = 2
        }
    }), 
    v4({
        {
            Chance = 100, 
            Items = {
                {
                    Name = "2x EXP", 
                    Amount = 60
                }, 
                {
                    Name = "Race Reroll", 
                    Amount = 10
                }
            }
        }
    }), 
    (v4({
        {
            Chance = 100, 
            Name = "Mythical Fruit Chest", 
            Amount = 1
        }
    }))
};