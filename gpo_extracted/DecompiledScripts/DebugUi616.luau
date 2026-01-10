local v0 = {};
local v1 = {};
local function v4(v2, v3) --[[ Line: 4 ]] --[[ Name: infoText ]]
    v2.PushConfig({
        TextColor = v2._config.TextDisabledColor
    });
    v2.Text({
        v3
    });
    v2.PopConfig();
end;
local function v8(v5, v6) --[[ Line: 10 ]] --[[ Name: helpMarker ]]
    v5.PushConfig({
        TextColor = v5._config.TextDisabledColor
    });
    local v7 = v5.Text({
        "(?)"
    });
    v5.PopConfig();
    v5.PushConfig({
        ContentWidth = UDim.new(0, 350)
    });
    if v7.hovered() then
        v5.Tooltip({
            v6
        });
    end;
    v5.PopConfig();
end;
local function v18(v9, v10) --[[ Line: 22 ]] --[[ Name: BoneEditor ]]
    -- upvalues: v0 (copy)
    local v11 = v9.Window({
        (("Editing bone: %*"):format(v10.Bone.Name))
    });
    v11.isOpened.value = true;
    v10.Radius = v9.InputNum({
        "Radius", 
        0.1, 
        0, 
        1e999, 
        "%.3f"
    }, {
        number = v10.Radius
    }).number.value;
    v10.RotationLimit = v9.InputNum({
        "Rotation Limit", 
        0.1, 
        0, 
        180, 
        "%.3f"
    }, {
        number = v10.RotationLimit
    }).number.value;
    v10.Anchored = v9.Checkbox({
        "Anchored"
    }, {
        isChecked = v10.Anchored
    }).isChecked.value;
    v9.Text("Axis Lock");
    v9.Indent();
    v9.SameLine();
    v9.Text("X: ");
    local v12 = v9.Checkbox({
        ""
    }, {
        isChecked = v10.AxisLocked[1]
    });
    v9.Text("Y: ");
    local v13 = v9.Checkbox({
        ""
    }, {
        isChecked = v10.AxisLocked[2]
    });
    v9.Text("Z: ");
    local v14 = v9.Checkbox({
        ""
    }, {
        isChecked = v10.AxisLocked[3]
    });
    v9.End();
    v9.End();
    local v15 = v9.State(Vector2.new(v10.XAxisLimits.Min, v10.XAxisLimits.Max));
    local v16 = v9.State(Vector2.new(v10.YAxisLimits.Min, v10.YAxisLimits.Max));
    local v17 = v9.State(Vector2.new(v10.ZAxisLimits.Min, v10.ZAxisLimits.Max));
    v9.Text("Axis Limits");
    v9.Indent();
    v9.DragVector2({
        "X Axis Limit", 
        0.05, 
        nil, 
        nil, 
        {
            "Min: %.2f", 
            "Max: %.2f"
        }
    }, {
        number = v15
    });
    v9.DragVector2({
        "Y Axis Limit", 
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
    v9.DragVector2({
        "Z Axis Limit", 
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
    v9.End();
    v9.End();
    v10.AxisLocked[1] = v12.isChecked.value;
    v10.AxisLocked[2] = v13.isChecked.value;
    v10.AxisLocked[3] = v14.isChecked.value;
    v10.XAxisLimits = NumberRange.new(v15:get().X, v15:get().Y);
    v10.YAxisLimits = NumberRange.new(v16:get().X, v16:get().Y);
    v10.ZAxisLimits = NumberRange.new(v17:get().X, v17:get().Y);
    if v11.closed() then
        v0[v10] = nil;
    end;
end;
local function v26(v19, v20) --[[ Line: 77 ]] --[[ Name: ColliderEditor ]]
    -- upvalues: v1 (copy)
    local v21 = v19.Window({
        (("Editing collider of type: %*"):format(v20.Type))
    });
    v21.isOpened.value = true;
    local v22 = v19.State(v20.Type);
    local v23 = v19.State(v20.Scale);
    local v24 = v19.State(v20.Offset);
    local v25 = v19.State(v20.Rotation);
    v19.Combo({
        "Collider Type"
    }, {
        index = v22
    });
    v19.Selectable({
        "Box", 
        "Box"
    }, {
        index = v22
    });
    v19.Selectable({
        "Sphere", 
        "Sphere"
    }, {
        index = v22
    });
    v19.Selectable({
        "Capsule", 
        "Capsule"
    }, {
        index = v22
    });
    v19.End();
    v19.DragVector3({
        "Scale", 
        0.1, 
        0, 
        nil
    }, {
        number = v23
    });
    v19.DragVector3({
        "Offset", 
        0.1, 
        nil, 
        nil
    }, {
        number = v24
    });
    v19.DragVector3({
        "Rotation", 
        0.5, 
        -180, 
        180
    }, {
        number = v25
    });
    v20.Type = v22:get();
    v20.Scale = v23:get();
    v20.Offset = v24:get();
    v20.Rotation = v25:get();
    v19.End();
    if v21.closed() then
        v1[v20] = nil;
    end;
end;
return function(v27, v28, v29) --[[ Line: 108 ]]
    -- upvalues: v0 (copy), v18 (copy), v1 (copy), v26 (copy), v8 (copy), v4 (copy)
    local v30 = {};
    for _, v32 in v28.BoneTrees do
        local l_RootPart_0 = v32.RootPart;
        local v34 = v30[l_RootPart_0];
        if not v34 then
            v30[l_RootPart_0] = {};
            v34 = v30[l_RootPart_0];
        end;
        table.insert(v34, v32);
    end;
    for v35, _ in v0 do
        local v37 = ("%* - %*"):format(v28.ID, v35.ParentIndex + 1);
        v27.PushId(v37);
        v18(v27, v35);
        v27.PopId();
    end;
    for v38, _ in v1 do
        local l_GUID_0 = v38.GUID;
        v27.PushId(l_GUID_0);
        v26(v27, v38);
        v27.PopId();
    end;
    local v41 = #v28.BoneTrees;
    local v42 = #v28.ColliderObjects;
    local v43 = ("%* BoneTree%*"):format(v41, v41 == 1 and "" or "s");
    local v44 = ("%* Collider%*"):format(v42, v42 == 1 and "" or "s");
    v27.Window({
        ("SmartBone Runtime Editor. %*, %*"):format(v43, v44); 
        [v27.Args.Window.NoClose] = true
    });
    v27.Tree({
        "Debug Gizmos", 
        true
    }, {
        isUncollapsed = true
    });
    v27.SameLine();
    v27.Checkbox({
        "Draw Internal Bone"
    }, {
        isChecked = v29.DRAW_BONE
    });
    v8(v27, "Draws a sphere with the specified radius of the bone around where SmartBone believes the bone is.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Physical Bone"
    }, {
        isChecked = v29.DRAW_PHYSICAL_BONE
    });
    v8(v27, "Draws the actual bone objects CFrame with axis arrows.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Root Part"
    }, {
        isChecked = v29.DRAW_ROOT_PART
    });
    v8(v27, "Draws a bounding box and fills in the root part.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Bounding Box"
    }, {
        isChecked = v29.DRAW_BOUNDING_BOX
    });
    v8(v27, "Draws the bounding box used for frustum culling");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Axis Limits"
    }, {
        isChecked = v29.DRAW_AXIS_LIMITS
    });
    v8(v27, "Draws the axis limits for each bone.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Rotation Limits"
    }, {
        isChecked = v29.DRAW_ROTATION_LIMITS
    });
    v8(v27, "Draws the rotation limits for each bone.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Acceleration Info"
    }, {
        isChecked = v29.DRAW_ACCELERATION_INFO
    });
    v8(v27, "Draws the acceleration and the required values to derive it.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Colliders"
    }, {
        isChecked = v29.DRAW_COLLIDERS
    });
    v8(v27, "Draws all the colliders this root object can collide with.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Collider Influence"
    }, {
        isChecked = v29.DRAW_COLLIDER_INFLUENCE
    });
    v8(v27, "Shows the sphere of influence around each collider.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Collider Awake"
    }, {
        isChecked = v29.DRAW_COLLIDER_AWAKE
    });
    v8(v27, "Shows if a collider is awake or asleep.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Collider Broadphase"
    }, {
        isChecked = v29.DRAW_COLLIDER_BROADPHASE
    });
    v8(v27, "Shows if a collider isn't reaching narrowphase.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Fill Colliders"
    }, {
        isChecked = v29.DRAW_FILL_COLLIDERS
    });
    v8(v27, "Fills all colliders this root object can collide with.");
    v27.End();
    v27.SameLine();
    v27.Checkbox({
        "Draw Contacts"
    }, {
        isChecked = v29.DRAW_CONTACTS
    });
    v8(v27, "Draws the position and normal of the points which bones collide with colliders.");
    v27.End();
    v27.End();
    v27.Separator();
    v4(v27, "Simulated Objects");
    for v45, v46 in v30 do
        v27.Tree((("%* - Root Part"):format(v45.Name)));
        for v47, v48 in v46 do
            v27.Tree((("BoneTree #%*"):format(v47)));
            local v49 = string.format("%.1f", v48.UpdateRate);
            local v50 = string.format("%.1f", v48.Settings.UpdateRate);
            v4(v27, (("Throttled Update Rate: %* / %* fps"):format(v49, v50)));
            v4(v27, (("In View: %*"):format(v48.InView)));
            local v51 = v27.State(v48.Settings.Constraint);
            local v52 = v27.State(v48.Settings.WindType);
            local v53 = v27.State(v48.Settings.UpdateRate);
            local v54 = v27.State(v48.Settings.ActivationDistance);
            local v55 = v27.State(v48.Settings.ThrottleDistance);
            v27.SameLine();
            v8(v27, "The constraint used, distance is more flowy while spring is more rigid.");
            v27.Combo({
                "Constraint Type"
            }, {
                index = v51
            });
            v27.Selectable({
                "Distance", 
                "Distance"
            }, {
                index = v51
            });
            v27.Selectable({
                "Spring", 
                "Spring"
            }, {
                index = v51
            });
            v27.End();
            v27.End();
            v27.SameLine();
            v8(v27, "The wind solver used, sine is a smoother wind, noise is more chaotic and hybrid is a mix of the two.");
            v27.Combo({
                "Wind Type"
            }, {
                index = v52
            });
            v27.Selectable({
                "Sine", 
                "Sine"
            }, {
                index = v52
            });
            v27.Selectable({
                "Noise", 
                "Noise"
            }, {
                index = v52
            });
            v27.Selectable({
                "Hybrid", 
                "Hybrid"
            }, {
                index = v52
            });
            v27.End();
            v27.End();
            v27.SameLine();
            v8(v27, "The target update rate for the bone tree");
            v27.SliderNum({
                "Update Rate", 
                5, 
                0, 
                120
            }, {
                number = v53
            });
            v27.End();
            v27.SameLine();
            v8(v27, "The distance at which the bone tree stops updating");
            v27.SliderNum({
                "Activation Distance", 
                1, 
                0, 
                500
            }, {
                number = v54
            });
            v27.End();
            v27.SameLine();
            v8(v27, "The distance at which the bone tree starts throttling its update rate");
            v27.SliderNum({
                "Throttle Distance", 
                1, 
                0, 
                500
            }, {
                number = v55
            });
            v27.End();
            v48.Settings.Constraint = v51:get();
            v48.Settings.WindType = v52:get();
            v48.Settings.UpdateRate = v53:get();
            v48.Settings.ActivationDistance = v54:get();
            v48.Settings.ThrottleDistance = v55:get();
            v27.Table({
                4, 
                false, 
                false, 
                false
            });
            v27.NextColumn();
            v27.Text("Bone #");
            v27.NextColumn();
            v27.Text("Bone Name");
            v27.NextColumn();
            v27.Text("Parent #");
            v27.NextColumn();
            v27.Text("Edit");
            v27.End();
            v27.Table({
                4
            });
            for v56, v57 in v48.Bones do
                v27.NextColumn();
                v27.Text((tostring(v56)));
                v27.NextColumn();
                v27.Text(v57.Bone.Name);
                v27.NextColumn();
                v27.Text((tostring(v57.ParentIndex)));
                v27.NextColumn();
                v27.SameLine();
                v27.Text("");
                if v27.SmallButton({
                    "Edit"
                }).clicked() then
                    v0[v57] = true;
                end;
                v27.End();
            end;
            v27.End();
            v27.End();
        end;
        v27.End();
    end;
    v4(v27, "Active Colliders");
    for _, v59 in v28.ColliderObjects do
        v27.Tree({
            v59.m_Object.Name
        });
        v4(v27, "Colliders adorned to this object");
        v27.Table({
            5, 
            false, 
            false, 
            false
        });
        v27.NextColumn();
        v27.Text("Type");
        v27.NextColumn();
        v27.Text("Scale");
        v27.NextColumn();
        v27.Text("Offset");
        v27.NextColumn();
        v27.Text("Rotation");
        v27.NextColumn();
        v27.Text("Edit");
        v27.End();
        v27.Table({
            5
        });
        for _, v61 in v59.Colliders do
            v27.NextColumn();
            v27.Text((tostring(v61.Type)));
            v27.NextColumn();
            v27.Text((tostring(v61.Scale)));
            v27.NextColumn();
            v27.Text((tostring(v61.Offset)));
            v27.NextColumn();
            v27.Text((tostring(v61.Rotation)));
            v27.NextColumn();
            v27.SameLine();
            v27.Text("");
            if v27.SmallButton({
                "Edit"
            }).clicked() then
                v1[v61] = true;
            end;
            v27.End();
        end;
        v27.End();
        v27.End();
    end;
    v27.End();
end;