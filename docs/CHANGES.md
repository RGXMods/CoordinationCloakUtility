# v3.7.5 - 2026-08-08

## Changes
- **Full RGX-Framework migration**: Gutted and rebuilt core on RGX-Framework
  - Events → `RGX:RegisterEvent`
  - Timers → `RGX:After` / `RGX:Every`
  - Slash commands → `RGX:RegisterSlashCommand`
  - Minimap button → `RGXMinimap:Create()`
  - Database → `RGX:NewDatabase()`
  - Modular file structure: core, events, commands, minimap, teleport, utils, localization
- Removed manual frame, C_Timer, SLASH_ boilerplate (~600 lines removed)

# v3.7.4 - 2026-08-07

## Changes
- TOC bump: Now retail-only (Interface 120007). Removed Cata/MoP/Retail-era interface entries.

# v3.7.3 - 2026-06-30

## Changes

- Updated for WoW Retail 12.0.7 (Interface 120007).

# v3.7.2 - 2026-04-29

## Changes
- Minimap tooltip: "Teleport Helper" subtitle moved to its own line under the title for cleaner layout.
