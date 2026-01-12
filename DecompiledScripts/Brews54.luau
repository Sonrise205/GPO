return {
    ["Basic Fish Luck Brew"] = {
        Icon = "", 
        Description = "Basic Fish Luck Brew", 
        GivenItem = "Basic Fish Luck Brew", 
        UseRequiredItem = true, 
        Requirements = {
            ["Rare Fish"] = 10
        }, 
        Default = true, 
        RequirementsExtra = {
            ["Rare Fish"] = {
                AllowMultiple = true, 
                BaseItem = "Rare Fish"
            }
        }
    }, 
    ["Stench of the Deep"] = {
        Icon = "", 
        Description = "Stench of the Deep", 
        GivenItem = "Stench of the Deep", 
        UseRequiredItem = true, 
        Requirements = {
            ["Rare Fish"] = 3
        }, 
        Default = true, 
        RequirementsExtra = {
            ["Rare Fish"] = {
                AllowMultiple = true, 
                BaseItem = "Rare Fish"
            }
        }
    }, 
    ["Rare Fish Luck Brew"] = {
        Icon = "", 
        Description = "Rare Fish Luck Brew", 
        GivenItem = "Rare Fish Luck Brew", 
        UseRequiredItem = true, 
        Requirements = {
            ["Legendary Fish"] = 3
        }, 
        Default = true, 
        RequirementsExtra = {
            ["Legendary Fish"] = {
                AllowMultiple = true, 
                BaseItem = "Legendary Fish"
            }
        }
    }
};