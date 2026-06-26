# HydroDome Mobile — Web Deck (handoff)

A browser-based pitch deck (reveal.js) for **HydroDome**, a project of **Carmanah Wildfire Ltd.**
This README is the running handoff — point a new editing thread here.

_Last updated: 2026-06-25._

---

## Where it lives / how to present
- **Primary file:** `carmanah-style.html` — the deck to present and deploy (dark Carmanah aesthetic).
- **`index.html`** — a copy of the deck (it is the SAME content as `carmanah-style.html`; we make `index.html` = the deck so the site root serves it; see Deploy).
- **`spray-logic.html`** — standalone animated spray-logic diagram, embedded as a banner on the "HydroDome on Wheels" slide (details below).
- **`assets/`** — all images.
- Present: open `carmanah-style.html` in a browser. Arrows/swipe to navigate, **↓ to enter the competitor deep-dives**, `F` fullscreen, `Esc` overview, `?` shortcuts. PDF export: open `carmanah-style.html?print-pdf` in Chrome → print to PDF.

## Live site
- **URL:** https://beautiful-gecko-71e92b.netlify.app
- **Netlify project:** `beautiful-gecko-71e92b` (site id `2e252cfb-3319-4c79-8b2d-6e9c07459665`).
- NOTE: this is the *deck* site. Do **not** deploy the deck to the `hydrodome` project — that's the separate marketing site (hydrodomesystems.com).

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
These are separate GitHub repos / Pages, embedded into the deck:
- **SCADA / Command & Control** → `https://tetontopo.github.io/hydrodome-scada/` (repo `TetonTopo/hydrodome-scada`).
- **Simulator** → `https://tetontopo.github.io/hydrodome-sim/`.
- **WUI map** → `https://tetontopo.github.io/hydrodome-maps/#5/54.5/-124.5` (the `#5/54.5/-124.5` hash is an attempt to open on BC; only works if the app reads the URL hash — see to-dos).

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

## Deploy (IMPORTANT — read before pushing)
The Netlify deploy uploads the **deck folder**. Two gotchas, both already handled in the workflow:
1. **`netlify.toml` redirect needs `force = true`** — otherwise the root `/` serves a stale `index.html`. We also keep `index.html` = a copy of the deck as a belt-and-suspenders so the root always shows the current deck.
2. **OneDrive sync lag** — the Linux/CLI view of this OneDrive folder can be stale or half-synced right after edits. The reliable path used here: stage a clean copy of the deck + `spray-logic.html` + `assets/` + `netlify.toml`, then run the Netlify deploy from that staging copy (not straight from the synced folder). After deploy, verify the live root with a cache-buster (e.g. `…netlify.app/?cb=123`) and hard-refresh the browser.

To deploy: get a deploy command for site `2e252cfb-3319-4c79-8b2d-6e9c07459665` and run `npx -y @netlify/mcp@latest --site-id … --proxy-path "…" --no-wait` from the (staged) folder.

## Open to-dos / next thread
- **Competitor photos:** drop real images into the 3 placeholders — WASP SPU trailer, FireWolf cannon/mast, RainStream tower (only WASP source photos exist so far).
- **Micah headshot:** replace with a higher-res photo (current is a small screenshot).
- **Map starting view:** the WUI map's default zoom/center is hard-coded in the `hydrodome-maps` repo (built in Claude Code, not Cowork). To make it open on BC permanently, edit that repo's `setView([54.5,-124.5], 5.5)` (or `fitBounds`) and push. Prompt is ready in chat history.
- **Carmanah cards:** optionally swap the 3 icon cards for photo cards — pull hero images from carmanahwildfire.com `/services/type-ii-fire-crews`, `/services/wildfire-training`, `/services/vegetation-management-danger-tree-assessing-falling`. Also consider featuring **FireSmart & Wildfire Mitigation** (left off the current three, but very on-theme).
- **Team order:** top row currently Nick · Brian · Dakotah (as listed); flip to Nick · Dakotah · Brian if "Brian third" was meant literally.
- **Market math:** TAM/SAM/SOM figures came from the latest PDF; the June-22 plan wanted them rebuilt around trailer units + industrial/First Nations from the unit-economics sheet.
- **Spray firing pattern:** currently 1 gun/side; the 4″ trunk allows 2/side — adjust `spray-logic.html` if the real pattern changes.

## Related notes (Notion)
- HydroDome Web Deck — Build Handoff Notes (June 25, 2026).
- Deck Pivot Working Session — Handoff Notes (June 22, 2026) — approved Command & Control copy + competitor specs.
