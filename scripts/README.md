# SloneWare Scripts

## Fruit Finder v2.2 (Safe Edition)

A UI script for finding and teleporting to fruits in GPO-style Roblox games.

### Safety Features

| Feature | Status | Notes |
|---------|--------|-------|
| No `print`/`warn` | ✅ | No console output |
| No `FireServer` | ✅ | No server communication |
| No HTTP calls | ✅ | No external requests |
| Walk mode default | ✅ | Safer than teleporting |
| Speed mod disabled | ✅ | Must manually enable |
| Safe cleanup | ✅ | Uses `pcall` wrappers |

### Features

- **Fruit Detection**: Scans workspace for Tools with `FruitEater` child
- **Fruit Images**: Shows actual images from `Tool.TextureId`
- **Distance Display**: Real-time, color-coded by proximity
- **Walk Mode** (default): Pathfinding-based walking
- **Teleport Mode**: Checkpoint-based teleportation
- **Auto Pickup**: Triggers ProximityPrompt when close
- **Speed Modifier**: Optional, disabled by default (risky)

### UI Controls

| Button | Function |
|--------|----------|
| 🚶 Walk Mode | Toggle walk/teleport mode |
| ✓ Auto Pickup | Toggle automatic collection |
| ⚠️ Speed Mod | Toggle speed modification (risky) |
| 🔄 Refresh | Manual fruit list refresh |
| ⛔ Stop | Cancel current movement |
| GO | Teleport/walk to fruit |

### Default Settings (Safe)

```lua
useWalking = true       -- Walk instead of teleport
autoPickup = true       -- Try to auto-pickup
enableSpeedMod = false  -- Speed hack disabled
tpDelay = 0.5          -- Delay between checkpoints
scanInterval = 3        -- Refresh every 3 seconds
```

### Pickup Methods

1. `fireproximityprompt()` - Executor function
2. `prompt:InputHoldBegin()/End()` - Direct simulation
3. `fireclickdetector()` - Fallback

### Files

```
/scripts/
├── SloneWareFruitFinder.lua  (941 lines)
└── README.md
```

### Usage

1. Execute the script in your executor
2. Fruits will appear in the list sorted by distance
3. Click "GO" to travel to a fruit
4. Auto-pickup will attempt to collect it

### Risk Levels

| Mode | Risk | Detection |
|------|------|-----------|
| Walking | Low | Normal pathfinding |
| Teleport | Medium | Position changes |
| Speed Mod | High | WalkSpeed changes |

### Disclaimer

⚠️ **Educational purposes only. Use at your own risk.**
