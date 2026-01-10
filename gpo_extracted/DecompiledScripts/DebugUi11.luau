local v0 = {};
local v1 = {};
local v2 = {
    {
        "Draw Internal Bone", 
        "Draws a sphere with the specified radius of the bone around where SmartBone believes the bone is.", 
        "DRAW_BONE"
    }, 
    {
        "Draw Physical Bone", 
        "Draws the actual bone objects CFrame with axis arrows.", 
        "DRAW_PHYSICAL_BONE"
    }, 
    {
        "Draw Root Part", 
        "Draws a bounding box and fills in the root part.", 
        "DRAW_ROOT_PART"
    }, 
    {
        "Draw Bounding Box", 
        "Draws the bounding box used for frustum culling.", 
        "DRAW_BOUNDING_BOX"
    }, 
    {
        "Draw Axis Limits", 
        "Draws the axis limits for each bone.", 
        "DRAW_AXIS_LIMITS"
    }, 
    {
        "Draw Rotation Limits", 
        "Draws the rotation limits for each bone.", 
        "DRAW_ROTATION_LIMITS"
    }, 
    {
        "Draw Acceleration Info", 
        "Draws the acceleration and the required values to derive it.", 
        "DRAW_ACCELERATION_INFO"
    }, 
    {
        "Draw Colliders", 
        "Draws all the colliders this root object can collide with.", 
        "DRAW_COLLIDERS"
    }, 
    {
        "Draw Collider Influence", 
        "Shows the sphere of influence around each collider.", 
        "DRAW_COLLIDER_INFLUENCE"
    }, 
    {
        "Draw Collider Awake", 
        "Shows if a collider is awake or asleep.", 
        "DRAW_COLLIDER_AWAKE"
    }, 
    {
        "Draw Collider BroadPhase", 
        "Shows if a collider isn't reaching NarrowPhase.", 
        "DRAW_COLLIDER_BROADPHASE"
    }, 
    {
        "Draw Fill Colliders", 
        "Fills all colliders this root object can collide with.", 
        "DRAW_FILL_COLLIDERS"
    }, 
    {
        "Draw Contacts", 
        "Draws the position and normal of the points which bones collide with colliders.", 
        "DRAW_CONTACTS"
    }
};
local function v5(v3, v4) --[[ Line: 25 ]] --[[ Name: infoText ]]
    v3.PushConfig({
        TextColor = v3._config.TextDisabledColor
    });
    v3.Text({
        v4
    });
    v3.PopConfig();
end;
local function v9(v6, v7) --[[ Line: 31 ]] --[[ Name: helpMarker ]]
    v6.PushConfig({
        TextColor = v6._config.TextDisabledColor
    });
    local v8 = v6.Text({
        "(?)"
    });
    v6.PopConfig();
    v6.PushConfig({
        ContentWidth = UDim.new(0, 350)
    });
    if v8.hovered() then
        v6.Tooltip({
            v7
        });
    end;
    v6.PopConfig();
end;
local function v19(v10, v11) --[[ Line: 43 ]] --[[ Name: BoneEditor ]]
    -- upvalues: v0 (copy)
    local v12 = v10.Window({
        (("Editing bone: %*"):format(v11.Bone.Name))
    });
    v12.isOpened.value = true;
    v11.Radius = v10.InputNum({
        "Radius", 
        0.1, 
        0, 
        1e999, 
        "%.3f"
    }, {
        number = v11.Radius
    }).number.value;
    v11.RotationLimit = v10.InputNum({
        "Rotation Limit", 
        0.1, 
        0, 
        180, 
        "%.3f"
    }, {
        number = v11.RotationLimit
    }).number.value;
    v11.Anchored = v10.Checkbox({
        "Anchored"
    }, {
        isChecked = v11.Anchored
    }).isChecked.value;
    v10.Text("Axis Lock");
    v10.Indent();
    v10.SameLine();
    v10.Text("X: ");
    local v13 = v10.Checkbox({
        ""
    }, {
        isChecked = v11.AxisLocked[1]
    });
    v10.Text("Y: ");
    local v14 = v10.Checkbox({
        ""
    }, {
        isChecked = v11.AxisLocked[2]
    });
    v10.Text("Z: ");
    local v15 = v10.Checkbox({
        ""
    }, {
        isChecked = v11.AxisLocked[3]
    });
    v10.End();
    v10.End();
    local v16 = v10.State(Vector2.new(v11.XAxisLimits.Min, v11.XAxisLimits.Max));
    local v17 = v10.State(Vector2.new(v11.YAxisLimits.Min, v11.YAxisLimits.Max));
    local v18 = v10.State(Vector2.new(v11.ZAxisLimits.Min, v11.ZAxisLimits.Max));
    v10.Text("Axis Limits");
    v10.Indent();
    v10.DragVector2({
        "X Axis Limit", 
        0.05, 
        nil, 
        nil, 
        {
            "Min: %.2f", 
            "Max: %.2f"
        }
    }, {
        number = v16
    });
    v10.DragVector2({
        "Y Axis Limit", 
        0.05, 
        nil, 
        nil, 
        {
            "Min: %.2f", 
            "Max: %.2f"
        }
    }, {
        number = v17
    });
    v10.DragVector2({
        "Z Axis Limit", 
        0.05, 
        nil, 
        nil, 
        {
            "Min: %.2f", 
            "Max: %.2f"
        }
    }, {
        number = v18
    });
    v10.End();
    v10.End();
    v11.AxisLocked[1] = v13.isChecked.value;
    v11.AxisLocked[2] = v14.isChecked.value;
    v11.AxisLocked[3] = v15.isChecked.value;
    v11.XAxisLimits = NumberRange.new(v16:get().X, v16:get().Y);
    v11.YAxisLimits = NumberRange.new(v17:get().X, v17:get().Y);
    v11.ZAxisLimits = NumberRange.new(v18:get().X, v18:get().Y);
    if v12.closed() then
        v0[v11] = nil;
    end;
end;
local function v27(v20, v21) --[[ Line: 98 ]] --[[ Name: ColliderEditor ]]
    -- upvalues: v1 (copy)
    local v22 = v20.Window({
        (("Editing collider of type: %*"):format(v21.Type))
    });
    v22.isOpened.value = true;
    local v23 = v20.State(v21.Type);
    local v24 = v20.State(v21.Scale);
    local v25 = v20.State(v21.Offset);
    local v26 = v20.State(v21.Rotation);
    v20.Combo({
        "Collider Type"
    }, {
        index = v23
    });
    v20.Selectable({
        "Box", 
        "Box"
    }, {
        index = v23
    });
    v20.Selectable({
        "Sphere", 
        "Sphere"
    }, {
        index = v23
    });
    v20.Selectable({
        "Capsule", 
        "Capsule"
    }, {
        index = v23
    });
    v20.End();
    v20.DragVector3({
        "Scale", 
        0.1, 
        0, 
        nil
    }, {
        number = v24
    });
    v20.DragVector3({
        "Offset", 
        0.1, 
        nil, 
        nil
    }, {
        number = v25
    });
    v20.DragVector3({
        "Rotation", 
        0.5, 
        -180, 
        180
    }, {
        number = v26
    });
    v21.Type = v23:get();
    v21.Scale = v24:get();
    v21.Offset = v25:get();
    v21.Rotation = v26:get();
    v20.End();
    if v22.closed() then
        v1[v21] = nil;
    end;
end;
return function(v28, v29, v30) --[[ Line: 129 ]]
    -- upvalues: v0 (copy), v19 (copy), v1 (copy), v27 (copy), v2 (copy), v9 (copy), v5 (copy)
    local v31 = {};
    for _, v33 in v29.BoneTrees do
        local l_RootPart_0 = v33.RootPart;
        local v35 = v31[l_RootPart_0];
        if not v35 then
            v31[l_RootPart_0] = {};
            v35 = v31[l_RootPart_0];
        end;
        table.insert(v35, v33);
    end;
    for v36, _ in v0 do
        local v38 = ("%* - %*"):format(v29.ID, v36.ParentIndex + 1);
        v28.PushId(v38);
        v19(v28, v36);
        v28.PopId();
    end;
    for v39, _ in v1 do
        local l_GUID_0 = v39.GUID;
        v28.PushId(l_GUID_0);
        v27(v28, v39);
        v28.PopId();
    end;
    local v42 = #v29.BoneTrees;
    local v43 = #v29.ColliderObjects;
    local v44 = ("%* BoneTree%*"):format(v42, v42 == 1 and "" or "s");
    local v45 = ("%* Collider%*"):format(v43, v43 == 1 and "" or "s");
    v28.Window({
        ("SmartBone Runtime Editor. %*, %*"):format(v44, v45); 
        [v28.Args.Window.NoClose] = true
    });
    v28.Tree({
        "Debug Gizmos", 
        true
    }, {
        isUncollapsed = true
    });
    for _, v47 in v2 do
        v28.SameLine();
        v28.Checkbox({
            v47[1]
        }, {
            isChecked = v30[v47[3]]
        });
        v9(v28, v47[2]);
        v28.End();
    end;
    v28.End();
    v28.Separator();
    v5(v28, "Simulated Objects");
    for v48, v49 in v31 do
        v28.Tree((("%* - Root Part"):format(v48.Name)));
        for v50, v51 in v49 do
            v28.Tree((("BoneTree #%*"):format(v50)));
            local v52 = string.format("%.1f", v51.UpdateRate);
            local v53 = string.format("%.1f", v51.Settings.UpdateRate);
            v5(v28, (("Throttled Update Rate: %* / %* fps"):format(v52, v53)));
            v5(v28, (("In View: %*"):format(v51.InView)));
            local v54 = v28.State(v51.Settings.Constraint);
            local v55 = v28.State(v51.Settings.WindType);
            local v56 = v28.State(v51.Settings.UpdateRate);
            local v57 = v28.State(v51.Settings.ActivationDistance);
            local v58 = v28.State(v51.Settings.ThrottleDistance);
            v28.SameLine();
            v9(v28, "The constraint used, distance is more flowy while spring is more rigid.");
            v28.Combo({
                "Constraint Type"
            }, {
                index = v54
            });
            v28.Selectable({
                "Distance", 
                "Distance"
            }, {
                index = v54
            });
            v28.Selectable({
                "Spring", 
                "Spring"
            }, {
                index = v54
            });
            v28.End();
            v28.End();
            v28.SameLine();
            v9(v28, "The wind solver used, sine is a smoother wind, noise is more chaotic and hybrid is a mix of the two.");
            v28.Combo({
                "Wind Type"
            }, {
                index = v55
            });
            v28.Selectable({
                "Sine", 
                "Sine"
            }, {
                index = v55
            });
            v28.Selectable({
                "Noise", 
                "Noise"
            }, {
                index = v55
            });
            v28.Selectable({
                "Hybrid", 
                "Hybrid"
            }, {
                index = v55
            });
            v28.End();
            v28.End();
            v28.SameLine();
            v9(v28, "The target update rate for the bone tree");
            v28.SliderNum({
                "Update Rate", 
                5, 
                0, 
                120
            }, {
                number = v56
            });
            v28.End();
            v28.SameLine();
            v9(v28, "The distance at which the bone tree stops updating");
            v28.SliderNum({
                "Activation Distance", 
                1, 
                0, 
                500
            }, {
                number = v57
            });
            v28.End();
            v28.SameLine();
            v9(v28, "The distance at which the bone tree starts throttling its update rate");
            v28.SliderNum({
                "Throttle Distance", 
                1, 
                0, 
                500
            }, {
                number = v58
            });
            v28.End();
            v51.Settings.Constraint = v54:get();
            v51.Settings.WindType = v55:get();
            v51.Settings.UpdateRate = v56:get();
            v51.Settings.ActivationDistance = v57:get();
            v51.Settings.ThrottleDistance = v58:get();
            v28.Table({
                4, 
                false, 
                false, 
                false
            });
            v28.NextColumn();
            v28.Text("Bone #");
            v28.NextColumn();
            v28.Text("Bone Name");
            v28.NextColumn();
            v28.Text("Parent #");
            v28.NextColumn();
            v28.Text("Edit");
            v28.End();
            v28.Table({
                4
            });
            for v59, v60 in v51.Bones do
                v28.NextColumn();
                v28.Text((tostring(v59)));
                v28.NextColumn();
                v28.Text(v60.Bone.Name);
                v28.NextColumn();
                v28.Text((tostring(v60.ParentIndex)));
                v28.NextColumn();
                v28.SameLine();
                v28.Text("");
                if v28.SmallButton({
                    "Edit"
                }).clicked() then
                    v0[v60] = true;
                end;
                v28.End();
            end;
            v28.End();
            v28.End();
        end;
        v28.End();
    end;
    v5(v28, "Active Colliders");
    for _, v62 in v29.ColliderObjects do
        v28.Tree({
            v62.m_Object.Name
        });
        v5(v28, "Colliders adorned to this object");
        v28.Table({
            5, 
            false, 
            false, 
            false
        });
        v28.NextColumn();
        v28.Text("Type");
        v28.NextColumn();
        v28.Text("Scale");
        v28.NextColumn();
        v28.Text("Offset");
        v28.NextColumn();
        v28.Text("Rotation");
        v28.NextColumn();
        v28.Text("Edit");
        v28.End();
        v28.Table({
            5
        });
        for _, v64 in v62.Colliders do
            v28.NextColumn();
            v28.Text((tostring(v64.Type)));
            v28.NextColumn();
            v28.Text((tostring(v64.Scale)));
            v28.NextColumn();
            v28.Text((tostring(v64.Offset)));
            v28.NextColumn();
            v28.Text((tostring(v64.Rotation)));
            v28.NextColumn();
            v28.SameLine();
            v28.Text("");
            if v28.SmallButton({
                "Edit"
            }).clicked() then
                v1[v64] = true;
            end;
            v28.End();
        end;
        v28.End();
        v28.End();
    end;
    v28.End();
end;