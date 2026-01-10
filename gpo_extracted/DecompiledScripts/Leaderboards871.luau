local _ = game:GetService("TweenService");
local _ = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local _ = l_Players_0.LocalPlayer;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.CrewUtils);
local l_Client_0 = l_Modules_0.Client;
local v10 = require(l_Client_0.ItemDisplay);
local v11 = {};
local _ = {};
v11.Setup = function(v13) --[[ Line: 20 ]] --[[ Name: Setup ]]
    -- upvalues: l_HttpService_0 (copy), l_ReplicatedStorage_0 (copy), v10 (copy)
    local _ = v13.CrewsUI;
    local l_Frame_0 = v13.Frame;
    local l_List_0 = l_Frame_0:WaitForChild("Frame"):WaitForChild("List");
    local l_Title_0 = l_Frame_0:WaitForChild("Title");
    local v18 = {};
    local function v29(v19, v20) --[[ Line: 29 ]] --[[ Name: AddCrew ]]
        -- upvalues: v18 (copy), l_List_0 (copy)
        local l_CrewName_0 = v20.CrewName;
        local l_CrewImage_0 = v20.CrewImage;
        local l_Infamy_0 = v20.Infamy;
        local l_Members_0 = v20.Members;
        local v25 = v18[l_CrewName_0] or script.CrewTemplate:Clone();
        v25.LayoutOrder = v19;
        v25.Parent = l_List_0;
        v25.Name = l_CrewName_0;
        local l_Info_0 = v25.Info;
        l_Info_0.Rank.Text = "#" .. v19;
        l_Info_0.Portrait.Image = ("https://www.roblox.com/asset-thumbnail/image?assetId=%*&width=420&height=420&format=png"):format(l_CrewImage_0);
        l_Info_0.Crew.Text = l_CrewName_0;
        l_Info_0.Infamy.Text = l_Infamy_0 .. " Infamy";
        local v27 = {
            Marine = "<font color=\"rgb(51, 184, 255)\">Marines</font>", 
            Pirate = "<font color=\"rgb(255, 0, 0)\">Pirates</font>"
        };
        local v28 = "Pirate";
        if v20.IsMarineFaction == true then
            v28 = "Marine";
        end;
        l_Info_0.Members.Text = l_Members_0 .. " " .. v27[v28];
        v18[l_CrewName_0] = v25;
    end;
    local function _(v30) --[[ Line: 72 ]] --[[ Name: RemoveCrew ]]
        -- upvalues: v18 (copy)
        if v18[v30] then
            v18[v30]:Destroy();
            v18[v30] = nil;
        end;
    end;
    local function v39(v32) --[[ Line: 79 ]] --[[ Name: UpdateList ]]
        -- upvalues: l_HttpService_0 (ref), v29 (copy), v18 (copy)
        local v33 = l_HttpService_0:JSONDecode(v32);
        local v34 = {};
        for v35, v36 in pairs(v33) do
            if v35 < 51 then
                v29(v35, v36);
                v34[v36.CrewName] = true;
            else
                break;
            end;
        end;
        for v37, _ in pairs(v18) do
            if v34[v37] == nil and v18[v37] then
                v18[v37]:Destroy();
                v18[v37] = nil;
            end;
        end;
    end;
    local v40 = {
        [1] = "January", 
        [2] = "February", 
        [3] = "March", 
        [4] = "April", 
        [5] = "May", 
        [6] = "June", 
        [7] = "July", 
        [8] = "August", 
        [9] = "September", 
        [10] = "October", 
        [11] = "November", 
        [12] = "December"
    };
    task.spawn(function() --[[ Line: 112 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v39 (copy), v40 (copy), l_Title_0 (copy), v10 (ref), l_Frame_0 (copy)
        local v41 = l_ReplicatedStorage_0:WaitForChild("CrewsInServer", 360);
        local function v43() --[[ Line: 116 ]] --[[ Name: Top50Updated ]]
            -- upvalues: v41 (copy), v39 (ref)
            local l_v41_Attribute_0 = v41:GetAttribute("CurrentTop50");
            if l_v41_Attribute_0 then
                v39(l_v41_Attribute_0);
            end;
        end;
        local function v44() --[[ Line: 123 ]] --[[ Name: UpdateTitle ]]
            -- upvalues: v40 (ref), v41 (copy), l_Title_0 (ref)
            l_Title_0.Text = "<font color=\"rgb(255,176,0)\">Top Crews</font> (" .. (v40[v41:GetAttribute("Month")] or "Month") .. " " .. (v41:GetAttribute("Year") or "") .. ") (10k+ Infamy)";
        end;
        l_Title_0.Text = "<font color=\"rgb(255,176,0)\">Top Crews</font> (" .. (v40[v41:GetAttribute("Month")] or "Month") .. " " .. (v41:GetAttribute("Year") or "") .. ") (10k+ Infamy)";
        v41:GetAttributeChangedSignal("Month"):Connect(v44);
        v41:GetAttributeChangedSignal("Year"):Connect(v44);
        local l_v41_Attribute_1 = v41:GetAttribute("CurrentTop50");
        if l_v41_Attribute_1 then
            v39(l_v41_Attribute_1);
        end;
        v41:GetAttributeChangedSignal("CurrentTop50"):Connect(v43);
        l_v41_Attribute_1 = {};
        local v46 = game:GetService("HttpService"):JSONDecode(v41:GetAttribute("Rewards"));
        for v47 = 1, #v46 do
            l_v41_Attribute_1[v46[v47]] = 1;
        end;
        local v48 = v10.new({
            Gui = l_Frame_0.Parent.Parent.Parent, 
            Trade = false
        });
        v48:AddItemsWithDictionary(l_Frame_0.Rewards.Items, l_v41_Attribute_1, 3);
        l_Frame_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 144 ]]
            -- upvalues: l_Frame_0 (ref), v48 (copy)
            if l_Frame_0.Visible == true then
                v48:StartRotation();
                return;
            else
                v48:StopRotation();
                return;
            end;
        end);
        local function _() --[[ Line: 152 ]] --[[ Name: NextUpdateChanged ]]
            -- upvalues: v41 (copy), l_Frame_0 (ref)
            if v41:GetAttribute("NextUpdate") then
                l_Frame_0.Refresh.Text = "\240\159\148\132 " .. math.floor((v41:GetAttribute("NextUpdate")));
            end;
        end;
        if v41:GetAttribute("NextUpdate") then
            l_Frame_0.Refresh.Text = "\240\159\148\132 " .. math.floor((v41:GetAttribute("NextUpdate")));
        end;
        task.spawn(function() --[[ Line: 160 ]]
            -- upvalues: l_Frame_0 (ref), v41 (copy)
            while true do
                l_Frame_0.Refresh.Text = "\240\159\148\132 " .. math.floor((v41:GetAttribute("NextUpdate")));
                task.wait(1);
            end;
        end);
    end);
end;
return v11;