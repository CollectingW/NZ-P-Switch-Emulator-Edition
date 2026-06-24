# Nazi Zombies: Portable — Switch Emulator Edition

# About
This is a **personal, Switch-focused fork** of [Nazi Zombies: Portable](https://github.com/nzp-team/nzportable) (NZ:P), the long-running Call of Duty: Zombies "de-make" powered by enhanced forks of the Quake engine. Where upstream NZ:P targets many platforms, **this edition builds and ships only the Nintendo Switch `.nro`**, and pairs it with a customized fork of the **Citron** Switch emulator so the whole experience — game *and* emulator — is tuned to run together.

The goal of this fork is a heavily **remastered, feature-expanded** NZ:P for Switch: modern rendering effects, new gameplay systems and gamemodes, quality-of-life fixes, and emulator-side fixes for Switch 2 controllers and texture handling — while remaining faithful to NZ:P's World at War core.

> This is an unofficial fork. All credit for the base game goes to the NZ:P Team (see [Credits](#credits)). This repository contains code changes only.

# What's Different in This Fork
Everything below is **new or changed** relative to upstream NZ:P, implemented across the engine (Quakespasm), the game code (QuakeC), and the companion Citron emulator.

### Rendering & Visuals
* **Graphics Quality presets** — one-tap Performance / Balanced / Quality master toggle that scales the heavy effects together (SSAA, AO, bloom, motion blur).
* **SSAA** supersampling anti-aliasing (selectable 2×/3×/4×).
* **SSAO** screen-space ambient occlusion (soft contact shadows).
* **Motion blur** — unified per-object velocity buffer (zombies, gun, limbs) plus camera/world and rain blur.
* **Bloom, vignette, filmic tonemap & colour-grade** presets, contrast/saturation sliders.
* **Per-model lighting upgrades** — real world-space directional lighting from the lightmap, normal-based contour/cavity shading, Fresnel + Blinn-Phong specular/gloss (e.g. the gold M1911).
* **Zombie eye glow** — procedural fullbright eye glow with selectable colours that read through fog and darkness.
* **Soft blob contact shadows** under models.
* **Muzzle flash** that leans with the weapon, plus a real warm muzzle dynamic light.
* **Viewmodel FOV auto-tracking** so the gun never warps at high FOV / ADS.
* **NDU weather** — real sky-cast lightning, rain, and wet-floor puddle reflections (toggleable).
* **Town lava remaster** — animated molten surface (slow flicker + hotspots), rising embers/fire and periodic lava spurts, darkened ambience, and a dimmed skybox for a dramatic glow.

### Gameplay & Modes
* **New gamemodes** — Cranked (kill-timer level stacks + Meltdown bleed), Skull Ball, Hardpoint, Random, Mix, plus fixes/additions across existing modes.
* **Perk & progression systems** — Deadeye perk (headshot-points scaling) with the "Locked In" achievement, "Packed Or Nothing" achievement, Bartering King wall-buy discount, and a Switch-side achievement system with persistent saves.
* **MG42 buyable turret** trap on Kino Der Toten.
* **Golden M1911** all-achievement reward weapon (fully unlocked for now until all achievements are finished).
* **Co-op fixes & features** — revive softlock fix, on-screen-keyboard team chat, correct per-player points display, Mystery Box "pass to team" offers, akimbo second-weapon fix.
* **Town lava damage** — standing on the lava burns you (5 HP/sec) with a flame sound and hurt feedback.
* **Tactical lean** (Shoulder button peek while aiming) and a red hit-marker on kills.

### Controls & Input
* **Nintendo Switch 2 Joy-Con 2** support via the companion emulator (proper detection, naming, and pairing).
* **Per-weapon gun rumble** with an in-menu toggle and strength slider.
* **Mappable GL/GR back buttons** in the emulator's input UI.
* **On-screen keyboard** for in-menu text and in-game co-op chat.

### Engine & Switch Stability
* Larger heap so big maps don't flush weapon/perk models from the cache.
* Numerous Switch-specific corruption/crash fixes (2nd-map texture corruption, Mystery Box reload crash, lamp/NPOT skin corruption, the long-standing particle "vertex explosion", multiplayer packet overflow that made zombies invisible, shutdown fixes).
* Permanent sane config defaults so a wiped config still boots correctly.

### Companion Emulator (Citron fork)
DOWNLOAD HERE: https://github.com/CollectingW/CI/releases
* Switch 2 Joy-Con 2 driver support.
* ETC2 texture format support.
* Additive GL/GR button remapping in the input UI.
* UI tweaks (forced dark theme, custom background, icon/poster handling).
* The ability to play Co-op with other players VIA Yuzu Online (api-fun.net) in lobbies through the emulator itself.

# Component Breakdown
This edition spans several repositories (all under [CollectingW](https://github.com/CollectingW)):
* **NZ-P-Switch-Emulator-Edition** *(this repo)* — the hub: packaging the Switch build and documenting the fork.
* **[quakespasm](https://github.com/CollectingW/quakespasm)** — the NZ:P Switch engine (forked from Quakespasm-NX) with all rendering/engine changes.
* **[quakec](https://github.com/CollectingW/quakec)** — the game-side code (weapons, perks, gamemodes, AI).
* **[Citron (emulator)](https://github.com/CollectingW/CI/releases)** — the companion Switch emulator fork with controller/texture/network fixes.
* **[assets](https://github.com/CollectingW/assets)** — assets provided for game playability and credits to respective contributors.

# Building (Nintendo Switch only)
The Switch `.nro` is produced from the **quakespasm** engine via `Makefile.nx` (devkitPro / devkitA64) and the **quakec** progs via fteqcc. See those repositories for build steps. This hub's packaging scripts assemble the Switch release only.

# Credits
This fork stands entirely on the work of the NZ:P Team and the wider Quake community.

#### NZ:P Switch Emulator Edition
CollectingW — fork maintainer; Switch rendering, gameplay, and emulator work.

#### Original NZ:P — Programming
Blubswillrule, Jukki, DR_Mabuse1981, Naievil, Cypress, Scatterbox

#### Models
Blubswillrule, Ju\[s]tice, Derped_Crusader

#### GFX
Blubswillrule, Ju\[s]tice, Cypress, Derped_Crusader

#### Sounds/Music
Blubswillrule, Biodude, Cypress, Marty P.

#### Special Thanks
* Spike, Eukara, Contributors: FTEQW
* Shpuld: CleanQC4FTE, heavy dQuakePlus optimization
* Crow_Bar, st1x51: (a)dQuake(plus)
* fgsfdsfgs: Quakespasm-NX
* MasterFeizz: ctrQuake
* Rinnegatamante: Initial VITA port, VITA Auto-Updater
* Ralf Willenbacher: nQuake
* Azenn: GFX Assistance
* BCDeshiG: Extensive Testing
* The Citron emulator team

# License
The NZ:P engine (Quakespasm) is GPLv2 and the Citron emulator is GPLv3; this fork inherits those licenses. See each component's `LICENSE`.

# Screenshots
<center>
    <p float="left">
        <img src="screenshots/0.webp" width="400" />
        <img src="screenshots/1.webp" width="400" /> 
    </p>
    <p float="left">
        <img src="screenshots/2.webp" width="400" />
        <img src="screenshots/3.webp" width="400" /> 
    </p>
</center>
