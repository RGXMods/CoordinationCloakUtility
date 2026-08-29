<div align="center">

<img src="media/ccu_logo.png" alt="Coordination Cloak Utility logo" width="320">

# Coordination Cloak Utility

### One-click access to World of Warcraft teleportation cloaks

[![Release](https://img.shields.io/github/v/release/RGXMods/CoordinationCloakUtility?style=for-the-badge&logo=github&color=8b0941)](https://github.com/RGXMods/CoordinationCloakUtility/releases)
[![WoW Retail](https://img.shields.io/badge/WoW-Retail-148eff?style=for-the-badge&logo=worldofwarcraft&logoColor=white)](https://worldofwarcraft.blizzard.com/)
[![License](https://img.shields.io/github/license/RGXMods/CoordinationCloakUtility?style=for-the-badge&color=2dc26b)](LICENSE)

[![CurseForge](https://img.shields.io/badge/CurseForge-Download-f16436?style=flat-square&logo=curseforge&logoColor=white)](https://www.curseforge.com/wow/addons/ccu-coordination-cloak-utility)
[![Wago](https://img.shields.io/badge/Wago-Download-b96ad9?style=flat-square)](https://addons.wago.io/addons/ccu)
[![Discord](https://img.shields.io/badge/Discord-RealmGX-5865f2?style=flat-square&logo=discord&logoColor=white)](https://discord.gg/N7kdKAHVVF)

**[Features](#features) | [Installation](#installation) | [Usage](#usage) | [Supported Cloaks](#supported-cloaks) | [Support](#support-and-contributing)**

</div>

---

## Overview

**Coordination Cloak Utility (CCU)** automates the repetitive parts of using
teleportation cloaks. It finds a supported cloak in your bags, equips it,
provides a secure use button, and restores the cloak you were wearing after
the teleport completes.

Use `/ccu` for the popup button or click the movable minimap button to keep the
same flow close at hand. CCU respects combat restrictions and cloak cooldowns.

## Features

- **Smart cloak detection:** Finds supported teleportation cloaks in your bags.
- **Secure use button:** Uses the equipped back-slot cloak through a protected
  click action.
- **Automatic restoration:** Remembers your original back-slot item and
  re-equips it after zoning.
- **Combat safety:** Refuses protected gear changes while you are in combat.
- **Cooldown awareness:** Reports cooldown state rather than trying an
  unavailable cloak.
- **Item selection:** Chooses among usable supported cloaks when more than one
  is available.
- **Movable minimap button:** Left-click starts the cloak flow, left-drag moves
  the icon, and Ctrl+Right-click hides it.
- **Persistent settings:** Remembers minimap position, minimap visibility, and
  welcome-message preference.
- **Localization:** Ships translations for English, German, Spanish, French,
  Italian, Korean, Portuguese, Russian, Simplified Chinese, and Traditional
  Chinese.

## Supported Cloaks

CCU recognizes these teleportation-cloak families and their supported
variants:

| Cloak | Faction or Source |
|---|---|
| [Cloak of Coordination](https://www.wowhead.com/item=65360) | Guild |
| [Wrap of Unity](https://www.wowhead.com/item=63206) | Alliance |
| [Shroud of Cooperation](https://www.wowhead.com/item=63352) | Horde |

The cloak's normal in-game cooldown still applies; CCU does not bypass item
cooldowns or Blizzard's equipment restrictions.

## Compatibility

Coordination Cloak Utility supports **World of Warcraft Retail**. The current
interface value is maintained in
[`CoordinationCloakUtility.toc`](CoordinationCloakUtility.toc), which is the
source of truth as Retail clients update.

CCU is not currently packaged for Classic clients.

### Requirements

- World of Warcraft Retail
- [RGX-Framework](https://github.com/RGXMods/RGX-Framework) as a required addon
- At least one supported teleportation cloak in your bags

## Installation

### Addon Manager

Install CCU from
[CurseForge](https://www.curseforge.com/wow/addons/ccu-coordination-cloak-utility),
[Wago](https://addons.wago.io/addons/ccu), or
[GitHub Releases](https://github.com/RGXMods/CoordinationCloakUtility/releases).
Ensure your addon manager also installs RGX-Framework.

The Wago project ID shipped in the addon metadata is `qGZRLqGd`.

### Manual Installation

1. Download Coordination Cloak Utility and RGX-Framework.
2. Extract both addons into:

   ```text
   World of Warcraft/_retail_/Interface/AddOns/
   ```

3. Confirm the folders are named `CoordinationCloakUtility` and
   `RGX-Framework`.
4. Restart WoW or run `/reload`, then enable both addons at character select.

## Usage

1. Keep a supported teleportation cloak in your bags.
2. Type `/ccu` or left-click the minimap button.
3. If needed, CCU equips an available cloak and presents its secure use
   action.
4. Activate the cloak and complete the teleport.
5. CCU restores the previously equipped cloak after zoning.

### Slash Commands

| Command | Description |
|---|---|
| `/ccu` | Trigger cloak detection and the teleport flow |
| `/ccu help` | Show command help |
| `/ccu welcome` | Toggle the login welcome message |
| `/ccu icon on` | Show the minimap button |
| `/ccu icon off` | Hide the minimap button |

### Minimap Controls

| Action | Result |
|---|---|
| Left-click | Equip or use a supported teleport cloak |
| Left-drag | Move the button around the minimap |
| Ctrl+Right-click | Hide the minimap button |

Use `/ccu icon on` to restore a hidden minimap button.

## Troubleshooting

### No Usable Cloak Is Found

- Confirm a supported cloak is in your bags rather than the bank.
- Check the item's normal cooldown.
- Wait briefly if item information is still loading, then try `/ccu` again.

### The Cloak Does Not Equip or Restore

- Leave combat before starting the cloak flow; WoW blocks protected equipment
  changes in combat.
- Confirm the back-slot item is not locked by another pending action.
- Run `/reload` if equipment state remains stale after another addon changes
  gear.

### The Minimap Button Is Missing

- Run `/ccu icon on`.
- Confirm both CCU and RGX-Framework are enabled.
- Reset the UI with `/reload` after an addon update.

## Support and Contributing

- Use [GitHub Issues](https://github.com/RGXMods/CoordinationCloakUtility/issues)
  for reproducible bugs and user-facing feature requests.
- Join the [RealmGX Discord](https://discord.gg/N7kdKAHVVF) for setup help and
  feedback.
- Include the cloak item, cooldown state, combat state, and reproduction steps
  in bug reports.
- See [release history](docs/CHANGES.md) for current changes.

Development is maintained in the
[RGXMods GitLab repository](https://gitlab.dicematrix.cloud/rgxmods/warcraft/CoordinationCloakUtility),
the source of truth for code and CI/CD. Public packages and release notes are
published through [RGXMods GitHub Releases](https://github.com/RGXMods/CoordinationCloakUtility/releases).

Personal support for the author is available through
[GitHub Sponsors](https://github.com/sponsors/donniedice) and
[Buy Me a Coffee](https://buymeacoffee.com/donniedice).

## License

Coordination Cloak Utility is available under the [MIT License](LICENSE).

---

<div align="center">

**Made by [DonnieDice](https://github.com/donniedice) for the [RealmGX](https://realmgx.com) community.**

_One click, any destination._

<img src="media/kiwi.gif" alt="RealmGX Kiwi" width="80">

</div>
