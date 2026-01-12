# SloneWare Scripts

## Fruit Finder (`SloneWareFruitFinder.lua`)

A UI script for finding and teleporting to fruits in GPO-style Roblox games.

### Features

| Feature | Description |
|---------|-------------|
| **Fruit Detection** | Scans workspace for Tools with `FruitEater` child |
| **Fruit Images** | Shows actual fruit images from `Tool.TextureId` |
| **Distance Display** | Real-time distance updates, color-coded by proximity |
| **Teleport Mode** | Instant teleport with pathfinding and checkpoints |
| **Walk Mode** | Safer pathfinding-based walking |
| **Auto Pickup** | Automatically triggers ProximityPrompt when close |
| **WalkSpeed Slider** | Adjust character speed (0-200) with visual slider |
| **Path Tracers** | Visual path lines using Catmull-Rom splines |
| **Pulse Circle** | Animated destination indicator |

### UI Controls

- **🚀 Mode Toggle**: Switch between Teleport and Walking mode
- **✅ Auto Pickup**: Toggle automatic fruit collection
- **🏃 WalkSpeed Slider**: Drag to adjust speed, Reset button to restore default
- **🔄 Refresh**: Manually refresh fruit list
- **⛔ Stop**: Cancel current movement
- **⏱️ TP Delay**: Adjust delay between teleport checkpoints
- **−/+**: Minimize/maximize window
- **×**: Close script

### How It Works

1. Scans `workspace:GetChildren()` for Tools with `FruitEater`
2. Also checks `workspace.Env.Settings` for fruit models
3. Displays fruits sorted by distance
4. Uses PathfindingService to compute path
5. Teleports in checkpoints or walks along waypoints
6. Attempts pickup via `fireproximityprompt` or direct prompt manipulation

### Pickup Methods (in order of attempt)

1. `fireproximityprompt()` - Executor function (most reliable)
2. `prompt:InputHoldBegin()/InputHoldEnd()` - Direct simulation
3. `fireclickdetector()` - Fallback for ClickDetector

### Safety Notes

⚠️ **This script is for educational purposes only**

- Teleporting may be detected by anti-cheat systems
- WalkSpeed modification can trigger detection
- Use at your own risk in any game
- Walking mode is generally safer than teleport mode

### Requirements

- Roblox executor with Drawing library support
- `fireproximityprompt` function (executor-provided)
- Game must use the GPO fruit structure (Tool with FruitEater child)
