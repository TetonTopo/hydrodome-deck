# HydroDome Mobile — Web Deck (handoff)

A browser-based pitch deck (reveal.js) for **HydroDome**, a project of **Carmanah Wildfire Ltd.**
This README is the running handoff — point a new editing thread here.

_Last updated: 2026-06-26._

---

## June 26 2026 session — what changed (READ FIRST)

The whole HydroDome story moved **permanent installation → mobile (trailer) system**, and this deck + its embedded apps were updated to match. The deck also moved **off Netlify onto GitHub Pages**.

**Live deck:** https://tetontopo.github.io/hydrodome-deck/

Repos (all under the **TetonTopo** GitHub account, all GitHub Pages):

| Repo | State | Live |
|---|---|---|
| `hydrodome-deck` | this deck — now on **GitHub Pages**, off Netlify | https://tetontopo.github.io/hydrodome-deck/ |
| `hydrodome-mobile-command` | **NEW** — mobile SCADA / C2 dashboard (embedded slide 11) | https://tetontopo.github.io/hydrodome-mobile-command/ |
| `hydrodome-mobile-sim` | **NEW** — mobile deployment + fire sim (embedded slide 15) | https://tetontopo.github.io/hydrodome-mobile-sim/ |
| `hydrodome-maps` | UPDATED — opens on BC + Kelowna highlight + fire-layer fix | https://tetontopo.github.io/hydrodome-maps/ |
| `hydrodome-scada` | **ARCHIVED** (permanent) — superseded by mobile-command | — |
| `hydrodome-sim` | **ARCHIVED** (permanent) — see its `MIGRATION-NOTES.md` | — |

**Mobile design intent** (used across all the above, from the Preliminary Design Google Doc `1WZ8iI2SA-zlESwx-mw96et56yq7PjoiXWuIqVqM5Jt8`; Rev-6 numbers ~200 GPM/gun, 40–70 PSI, 5–8k gal): one trailer, two 4″ trunks (Side A/B) with 3″ drops + per-gun valves, **8 guns placed per-site (not a grid)**, **sequential firing 1 gun/side**, two pumps + failover, per-gun wireless LoRa nodes (battery/comms), closed-loop ~70 PSI nozzle pressure, ~10% site grade.

### Best workflow: author in Cowork, deploy from Claude Code
- **Author/edit in Cowork** — it has your email + Notion data pipeline. Cowork writes into this OneDrive folder (`CoWork_OD/hydrodome-deck`), which syncs to the machine.
- **Deploy from Claude Code** — it holds the GitHub push credentials Cowork lacks. Run `./deploy.sh "msg"` (or `./deploy.ps1`) here. **OneDrive sync is the bridge:** Cowork writes files → they sync → Claude Code commits + pushes.
- The **other repos** (`hydrodome-mobile-sim`, `-mobile-command`, `-maps`) live in `C:\Users\dk\cowork\` (NOT OneDrive), so Cowork can't see them — edit/deploy those from Claude Code. To let Cowork edit them too, clone them into `CoWork_OD/` and deploy from Claude Code.

## Where it lives / how to present
- **Primary file:** `carmanah-style.html` — the deck to present and deploy (dark Carmanah aesthetic).
- **`index.html`** — a copy of the deck (it is the SAME content as `carmanah-style.html`; we make `index.html` = the deck so the site root serves it; see Deploy).
- **`spray-logic.html`** — standalone animated spray-logic diagram, embedded as a banner on the "HydroDome on Wheels" slide (details below).
- **`assets/`** — all images.
- Present: open `carmanah-style.html` in a browser. Arrows/swipe to navigate, **↓ to enter the competitor deep-dives**, `F` fullscreen, `Esc` overview, `?` shortcuts. PDF export: open `carmanah-style.html?print-pdf` in Chrome → print to PDF.

## Live site
- **URL (GitHub Pages):** https://tetontopo.github.io/hydrodome-deck/  ← current, share this.
- **Repo:** `TetonTopo/hydrodome-deck` (Pages: branch `main`, root). **Deploy = commit + push to `main`** (see Deploy).
- _Off Netlify as of 2026-06-26_ — the old Netlify site `beautiful-gecko-71e92b` is retired and `netlify.toml` was removed.
- NOTE: this is the *deck* site, separate from the marketing site (hydrodomesystems.com).

## Tech / design system
- reveal.js 4.6.1 (cdnjs); slide size **1440×810**, `center:false`, global transition `slide`.
- **Tabler icons** webfont via jsdelivr (the cdnjs path is broken — keep jsdelivr). Logo flame = Tabler `ti-flame` inside an orange ring.
- Fonts: **Montserrat** (headings/labels), **Inter** (body) — Google Fonts.
- Palette: bg `#0f0f0f`, card `#1b1b1b`, accent orange **`#c5531f`**, water blue `#3aa0ff`, text `#f3efe9`, muted `#a39d94`.
- **Logo wordmark:** HYDRO = blue `#2e86d6`, DOME = red `#d2452a`, both same size (vars `--hydro-blue` / `--dome-red`).

## Slide order (17 slides)
1. **Title** — HydroDome Mobile (zoom transition).
2. **Team** — 2 rows of 3: top = Nick Hill, Brian Mueller, Dakotah Daily; bottom = Mehran Mehrandezh, Aws Al-Mubarak, **Micah Bayless** (Senior Aerospace Engineer / power delivery). Nick & Brian headshots re-cropped & centered.
3. **Carmanah Wildfire** — group-photo banner + a plain history line (**160+** employees, founded 2019) + **3 service cards that fade in one at a time**: (a) Type II & III Fire Crews, (b) Wildfire & Crew Training, (c) Falling, Danger Trees & Vegetation.
4. **EmberCast** (problem) — fade transition; bullets are static (no fragments).
5. **Traditional approaches**.
6. **HydroDome on Wheels** (Our Solution) — **spray-logic animation banner across the top**; bullets (scaled down) + a smaller mill photo card lower-right.
7–10. **Competitors — vertical "elevator" stack** (all use the `convex` cube-roll). Top = "How HydroDome stacks up" (3 cards fade in). Press ↓ for the three deep-dives: WASP, FireWolf, RainStream (each has an image **placeholder** — see to-dos).
11. **Intelligent Command & Control** — bullets fade in one at a time; live **SCADA** app embedded in a monitor frame.
12. **Market Opportunity** — bigger live **WUI map** (58% width) + taller TAM/SAM/SOM cards ($4.5B / $1.2B / $22.5–37.5M).
13. **Partners** — national innovation network (Mitacs, NRC IRAP, Global Affairs, ISED, U Regina, NATO DIANA).
14. **Commercial revenue pathways** — **3 cards fade in one at a time**.
15. **Virtual Model** — bullets static; the simulator **model glides in** when the slide opens; live **simulator** embedded.
16. **Roadmap (Prototype → Revenue)** — the 5 timeline phases **fade in left-to-right** on entry.
17. **Thank You / Closing** — zoom transition; contacts (Dakotah 307 699 0418, Nick 250 588 7544, carmanahwildfire.com).

## Embedded live apps (iframes)
Separate GitHub repos / Pages embedded into the deck. **All on the MOBILE system as of 2026-06-26:**
- **Command & Control (SCADA)** → `https://tetontopo.github.io/hydrodome-mobile-command/` (slide 11). New mobile C2 dashboard: two-pump failover, sequential 1-gun/side firing, per-gun LoRa nodes, closed-loop 70 PSI. Replaces the archived `hydrodome-scada`.
- **Simulator** → `https://tetontopo.github.io/hydrodome-mobile-sim/?auto=1` (slide 15). New mobile deployment + fire sim: Esri satellite basemap, Penticton dense WUI grid, 634 real buildings, hose-spec tower placement, wind-driven fire contained at the wetted corridor. `?auto=1` makes the embed self-play (ignite → hold line → reset → loop). Replaces the archived `hydrodome-sim`.
- **WUI map** → `https://tetontopo.github.io/hydrodome-maps/#5/54.5/-124.5` (slide 12). Opens on BC with Kelowna highlighted; historic fire perimeters now render (CWFIS `nbac` layer). The `#5/54.5/-124.5` hash is harmless — the app hard-codes the BC view.

## Spray-logic animation (`spray-logic.html`)
Self-contained `<canvas>` diagram, transparent background, embedded as the top banner on slide 6.
- Plan view: trailer (+ pump) center, **4″ trunk** with **3″ drops**, **8 Nelson Big Guns on 6 m towers** (4 per side at 30 / 110 / 190 / 270 m).
- **Sequential firing** — one gun per side at a time — each sweeps its **~47 m** circle, building overlapping wetted ground; loops slowly (~18 s/cycle).
- Communicates the core efficiency point: only 2 guns ever draw (~400 GPM) so a **~50 hp pump** covers ~6 ha vs a **~300 hp pump** to run all 8 at once.
- Labels (deck fonts): TRAILER (& PUMP), one SPRINKLER, an **80 m** spacing, and a **~317 m** total-reach bracket (trailer → far edge of the 4th sprinkler = 270 + 47).
- Source of truth for the spray logic: HydroDome **Preliminary Design** Google Doc (id `1WZ8iI2SA-zlESwx-mw96et56yq7PjoiXWuIqVqM5Jt8`).

## Assets (`assets/`)
Headshots: `nick.jpg` (re-cropped), `brian.jpg` (re-cropped, centered), `dakotah.jpg`, `mehran.jpg`, `aws.jpg`, `micah.jpg` (from a small ~114px screenshot — a bit soft, **higher-res wanted**).
Photos: `community.jpg` (title), `carmanah-team.jpg` (crew banner, object-position lowered), `embercast.jpg`, `spu-traditional.jpg`, `mill.jpg`, `firefighter.jpg`, `wui-map.jpg` (static fallback, now replaced by the live map), `hero-title.jpg`, `carmanah-logo.svg`.
Originals live in `../Deck Assets/`.

## Deploy (GitHub Pages)
The site is **GitHub Pages** from `TetonTopo/hydrodome-deck`, branch `main`, root. **Deploying = commit + push to `main`** — Pages rebuilds automatically (~30–60 s).

Use the helper in this folder (it also copies `carmanah-style.html` → `index.html` for you):
- Git Bash / Cowork shell: `./deploy.sh "your commit message"`
- PowerShell:              `./deploy.ps1 "your commit message"`

Both run `git add -A && git commit && git push origin main`. After pushing, hard-refresh https://tetontopo.github.io/hydrodome-deck/ (cache-buster `…/?cb=123` helps).

Gotchas (still relevant):
1. **Keep `index.html` = the deck.** `index.html` is a byte copy of `carmanah-style.html` so the site root serves the current deck. The deploy scripts copy it for you; if you deploy by hand, copy `carmanah-style.html` over `index.html` first.
2. **OneDrive sync lag** — this folder is OneDrive-synced; right after Cowork edits, the file view can be half-synced. Verify the files look right before deploying.
3. **Credentials live in Claude Code, not Cowork** — run the deploy from the Claude Code environment (it has the GitHub push token).

## Open to-dos / next thread
- **Competitor photos:** drop real images into the 3 placeholders — WASP SPU trailer, FireWolf cannon/mast, RainStream tower (only WASP source photos exist so far).
- **Micah headshot:** replace with a higher-res photo (current is a small screenshot).
- ~~**Map starting view**~~ ✅ DONE (2026-06-26): `hydrodome-maps` opens on BC `[54.5,-124.5] z5.5` with Kelowna's caption highlighted, font matched to the deck, and the historic fire perimeters fixed (was a nonexistent CWFIS layer `NFDB_MRB`; now uses `nbac`).
- ~~**SCADA + Simulator embeds**~~ ✅ DONE (2026-06-26): both swapped from the archived permanent apps to the new mobile apps (`hydrodome-mobile-command`, `hydrodome-mobile-sim`).
- **Sim firing pattern in the mobile sim:** currently 1 gun/side; the 4″ trunk allows 2/side — adjust if the real pattern changes (`hydrodome-mobile-sim` + `hydrodome-mobile-command`).
- **Carmanah cards:** optionally swap the 3 icon cards for photo cards — pull hero images from carmanahwildfire.com `/services/type-ii-fire-crews`, `/services/wildfire-training`, `/services/vegetation-management-danger-tree-assessing-falling`. Also consider featuring **FireSmart & Wildfire Mitigation** (left off the current three, but very on-theme).
- **Team order:** top row currently Nick · Brian · Dakotah (as listed); flip to Nick · Dakotah · Brian if "Brian third" was meant literally.
- **Market math:** TAM/SAM/SOM figures came from the latest PDF; the June-22 plan wanted them rebuilt around trailer units + industrial/First Nations from the unit-economics sheet.
- **Spray firing pattern:** currently 1 gun/side; the 4″ trunk allows 2/side — adjust `spray-logic.html` if the real pattern changes.

## Related notes (Notion)
- HydroDome Web Deck — Build Handoff Notes (June 25, 2026).
- Deck Pivot Working Session — Handoff Notes (June 22, 2026) — approved Command & Control copy + competitor specs.
