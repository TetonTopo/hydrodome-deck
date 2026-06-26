# HydroDome Mobile — Web Deck (handoff)

A browser-based pitch deck (reveal.js) for **HydroDome**, a project of **Carmanah Wildfire Ltd.**
This README is the running handoff — point a new editing thread here.

_Last updated: 2026-06-26._

---

## Amendment — June 26 (Session 4) — permanent-vision slide + confidentiality note

Made from the Cowork editing thread:

- **New slide — "The permanent HydroDome"** (`carmanah-style.html`, inserted between *Virtual model* and *Roadmap*). Condenses the old 21-page permanent-installation deck into one forward-looking slide, framed as a **future iteration**: always-on fixed towers, buried 8,000-gal cistern + propane backup (works grid-down, supplies emergency power), SCADA / municipal-water compatibility, and the envisioned Fort St. James pilot (~20 towers over hospital, shelter, municipal core). Image: `assets/hd-permanent.jpg` (from `HD permanent.png`), in the deck's dome frame.
- **Password-gate confidentiality note** — polite "treat this deck as confidential; don't share or forward without explicit permission" line under the unlock button (`#gate .gnote`).
- **Recovery:** `carmanah-style.html`, `index.html`, and this `README.md` were truncated in the working tree; restored complete versions from the `hydrodome-deck_20290626_1400` desktop backup, then applied the two changes above. Deck is back to **19 navigable slides**.
- Exported a snapshot **`HydroDome_Deck_2026-06-26.pdf`** (19 slides) to the CoWork_OD folder.

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

**Mobile design intent** (used across all the above, from the Preliminary Design Google Doc `1WZ8iI2SA-zlESwx-mw96et56yq7PjoiXWuIqVqM5Jt8`; Rev-6 numbers ~200 GPM/gun, 40–70 PSI, 5–8k gal): one trailer, two 4″ trunks (Side A/B) with 3″ drops + per-gun valves, **8 guns placed per-site (not a grid)**, **firing 2 guns/side (4 at once)**, two pumps + failover, per-gun wireless LoRa nodes (battery/comms), closed-loop ~70 PSI nozzle pressure, ~10% site grade.

### Where this lives now & workflow (updated 2026-06-26)
- **Working copy = single source of truth: `C:\Users\dk\cowork\hydrodome-deck`.** Moved **off OneDrive** on 2026-06-26 because the OneDrive mount was corrupting/half-syncing files mid-edit. The old OneDrive copy (`CoWork_OD\hydrodome-deck`) was **deleted on purpose — do not recreate it.**
- This now sits alongside the other repos (`hydrodome-mobile-command`, `-mobile-sim`, `-maps`, etc.) in `C:\Users\dk\cowork\`, so the whole project is in one place.
- **Deploy from Claude Code** (it holds the GitHub push credentials): from this folder run `./deploy.sh "msg"` (or `./deploy.ps1`). It copies `carmanah-style.html` → `index.html`, commits, and pushes `main`; GitHub Pages rebuilds in ~30–60 s.
- **Editing in Cowork:** because this folder is not in OneDrive, a Cowork session can't see it by default — when prompted, grant access to `C:\Users\dk\cowork` (or this subfolder) and Cowork can read/write it directly.
- **Backups:** `C:\Users\dk\cowork\hydrodome-deck_2026-06-26.zip` (dated snapshot of this folder) and the GitHub repo `TetonTopo/hydrodome-deck`.

### June 26 (cont.) — password gate + animation polish
- **Password gate.** The deck opens behind a HydroDome-branded password screen (markup at the top of `<body>`, logic in the first `<script>` at the bottom of `carmanah-style.html`). It SHA-256-hashes the entered password and compares it to a stored hash, so the password is **not** in the source as plaintext; once entered it's remembered per browser tab via `sessionStorage`. Current password: **`smartersprinklers`**. To change it, replace the `HASH` constant with the SHA-256 of the new password — `printf '%s' 'newpassword' | sha256sum`. Caveat (chosen over full encryption): this is a casual-viewer deterrent, not real security — the slide markup still exists in the page source for anyone who opens "view source". The check uses Web Crypto, which only runs on the **https** site (it's blocked on `file://`), so test on the live link, not by opening the file locally.
- **EmberCast embers** tripled (6 → 18, varied paths/speeds) and now render **in front of** the image (`.embers{z-index:10}`).
- **Traditional approaches** gained a subtle **rainfall overlay** drawn **in front of** the image and text (`.rain` / `@keyframes rainfall`, ~28 drops), and its bullets now fade in one at a time.
- **Auto-fade, one consistent speed.** "How HydroDome stacks up" and "Commercial revenue pathways" cards now fade in automatically (no more clicking through fragments); Traditional approaches and Virtual model bullets fade in too. Every sequence shares one pace (~1.0s fade, ~0.9s stagger) — the roadmap timeline was slowed and the Carmanah services cards sped up to match (the old `vslow` variant is retired).
- **Closing slide** firefighter photo reframed (`object-fit:cover; object-position:45% 66%; scale 1.12`) to fill the dome with no empty space, keeping the firefighter + fire in frame.

### June 26 (Session 3) — Nick call feedback (content + economics)
Edits from Nick's June 26 call (Granola note "Nicks feedback for the deck"). **These override older numbers in this README.**
- **Firing pattern → 4 guns at once (2 per side)** — was sequential 1/side (2 total). `spray-logic.html` now fires two groups (near pair, then far pair) and the Our Solution copy matches. Pump story is now **~100 hp (for 4 guns) vs 300 hp for all 8** (was 50 hp/2 guns). *~100 hp is an estimate — confirm with Brian/Mehran.*
- **Coverage → ~8 ha** everywhere (was ~6 ha); FireWolf comparison is now **~6× the area** (was 4×).
- **Economics → ~$300K/unit everywhere** (Nick's number = source of truth). Market slide rebuilt: TAM **$600M+** (~2,000 units), SAM **$150M** (~500 units, BC+AB), SOM **$6M+** (~20 units/3 yrs); references-appendix rationale updated to match. Roadmap metric changed to "Per-unit price ~$300K" (was "$110–120K per unit at production"). *NOTE: the `HydroDome_Mobile_Unit_Economics` sheet models COGS $283–608K and a $400K sell price — $300K may be below cost; Nick to reconcile.*
- **Revenue card:** "Vineyards" → "Sawmills."
- **Competitor slide:** WASP now shows ~15-hr full setup + double footprint; **real competitor photos placed** — `wasp.jpg` (WASP trailer 3), `firewolf.jpg`, `rainstream.jpg` (Wildfire Innovations real tower photo). WASP shot is wide and crops hard in the square frame.
- **Partners slide:** consolidated 6 → **4 bigger cards (2×2)** — Mitacs × U Regina (merged), NRC IRAP, Global Affairs/CanExport (approved), ISED. **NATO DIANA removed** (in-application; lives on the roadmap). Logos can be added if assets are dropped in.
- **Commercial Revenue Pathways:** added a **dome-topped banner placeholder** for a "Carmanah crews deploying HydroDome" action photo (wireframe for now — needs a real image).
- **Animations:** rain thicker + less transparent; **embers doubled 18 → 36**.
- **Closing photo:** zoomed in (scale 1.12 → 1.4) to remove side negative space.
- **Title hero image:** new Higgsfield options generated but **not yet placed** — Dakotah parked the choice.
- **Emails:** deck-share drafts created for Scott (mentions the one-pager — not yet attached) and Jason (in the ARD-grant thread).

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
- **Password-protected** (as of 2026-06-26): visitors must enter **`smartersprinklers`** to view. Casual-viewer deterrent only — see the password-gate note above for how it works and how to change it.

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
4. **EmberCast** (problem) — fade transition; bullets auto-fade in one at a time; **18 drifting embers rendered in front of the image** (`z-index:10`).
5. **Traditional approaches** — bullets auto-fade in one at a time; a subtle **rainfall overlay drifts in front of the image and text**.
6. **HydroDome on Wheels** (Our Solution) — **spray-logic animation banner across the top**; bullets (scaled down) + a smaller mill photo card lower-right.
7–10. **Competitors — vertical "elevator" stack** (all use the `convex` cube-roll). Top = "How HydroDome stacks up" (3 cards fade in). Press ↓ for the three deep-dives: WASP, FireWolf, RainStream (each has an image **placeholder** — see to-dos).
11. **Intelligent Command & Control** — bullets fade in one at a time; live **SCADA** app embedded in a monitor frame.
12. **Market Opportunity** — bigger live **WUI map** (58% width) + taller TAM/SAM/SOM cards ($4.5B / $1.2B / $22.5–37.5M).
13. **Partners** — national innovation network (Mitacs, NRC IRAP, Global Affairs, ISED, U Regina, NATO DIANA).
14. **Commercial revenue pathways** — **3 cards fade in one at a time**.
15. **Virtual Model** — bullets **fade in one at a time**; the simulator **model glides in** when the slide opens; live **simulator** embedded.
16. **Roadmap (Prototype → Revenue)** — the 5 timeline phases **fade in left-to-right** on entry (slowed to the shared deck pace).
17. **Thank You / Closing** — zoom transition; contacts (Dakotah 307 699 0418, Nick 250 588 7544, carmanahwildfire.com).

## Embedded live apps (iframes)
Separate GitHub repos / Pages embedded into the deck. **All on the MOBILE system as of 2026-06-26:**
- **Command & Control (SCADA)** → `https://tetontopo.github.io/hydrodome-mobile-command/` (slide 11). New mobile C2 dashboard: two-pump failover, sequential 1-gun/side firing, per-gun LoRa nodes, closed-loop 70 PSI. Replaces the archived `hydrodome-scada`.
- **Simulator** → `https://tetontopo.github.io/hydrodome-mobile-sim/?auto=1` (slide 15). New mobile deployment + fire sim: Esri satellite basemap, Penticton dense WUI grid, 634 real buildings, hose-spec tower placement, wind-driven fire contained at the wetted corridor. `?auto=1` makes the embed self-play (ignite → hold line → reset → loop). Replaces the archived `hydrodome-sim`.
- **WUI map** → `https://tetontopo.github.io/hydrodome-maps/#5/54.5/-124.5` (slide 12). Opens on BC with Kelowna highlighted; historic fire perimeters now render (CWFIS `nbac` layer). The `#5/54.5/-124.5` hash is harmless — the app hard-codes the BC view.

## Spray-logic animation (`spray-logic.html`)
Self-contained `<canvas>` diagram, transparent background, embedded as the top banner on slide 6.
- Plan view: trailer (+ pump) center, **4″ trunk** with **3″ drops**, **8 Nelson Big Guns on 6 m towers** (4 per side at 30 / 110 / 190 / 270 m).
- **Sequential firing in two groups — two guns per side (4 at once)** — each sweeps its **~50 m** circle, building overlapping wetted ground; loops slowly.
- Communicates the core efficiency point: only 4 guns ever draw (~800 GPM) so a **~100 hp pump** covers ~8 ha vs a **~300 hp pump** to run all 8 at once.
- Labels (deck fonts): TRAILER (& PUMP), one SPRINKLER, an **80 m** spacing, and a **~320 m** total-reach bracket (trailer → far edge of the 4th sprinkler = 270 + 50).
- Source of truth for the spray logic: HydroDome **Preliminary Design** Google Doc (id `1WZ8iI2SA-zlESwx-mw96et56yq7PjoiXWuIqVqM5Jt8`).

## Assets — where they live (updated 2026-06-26)
- **Deck assets the deck actually uses: `C:\Users\dk\cowork\hydrodome-deck\assets\`** — 16 cropped/renamed images, referenced relatively as `assets/…`. This is the **only** asset folder the deck reads; it travels with the deck.
- **Originals / source library: `C:\Users\dk\OneDrive\CoWork_OD\Deck Assets\`** — 19 raw images (uncropped headshots, competitor source photos like the WASP trailer shots). Kept in OneDrive as the source-of-truth + cloud backup; the deck does **not** read from here. Pull from it when you need a new or higher-res crop, then drop the result into the deck's `assets/`.
- _Note: the old duplicate `assets/` inside the deleted OneDrive copy is gone — there is no longer a second working asset folder to confuse with._

Files in `assets/`: headshots `nick.jpg` (re-cropped), `brian.jpg` (re-cropped, centered), `dakotah.jpg`, `mehran.jpg`, `aws.jpg`, `micah.jpg` (from a small ~114px screenshot — a bit soft, **higher-res wanted**); photos `community.jpg` (title), `carmanah-team.jpg` (crew banner), `embercast.jpg`, `spu-traditional.jpg`, `mill.jpg`, `firefighter.jpg`, `wui-map.jpg` (static fallback), `hero-title.jpg`, `carmanah-logo.svg`; competitor photos `wasp.jpg`, `firewolf.jpg`, `rainstream.jpg`.

## Deploy (GitHub Pages)
The site is **GitHub Pages** from `TetonTopo/hydrodome-deck`, branch `main`, root. **Deploying = commit + push to `main`** — Pages rebuilds automatically (~30–60 s).

Use the helper in this folder (it also copies `carmanah-style.html` → `index.html` for you):
- Git Bash / Cowork shell: `./deploy.sh "your commit message"`
- PowerShell:              `./deploy.ps1 "your commit message"`

Both run `git add -A && git commit && git push origin main`. After pushing, hard-refresh https://tetontopo.github.io/hydrodome-deck/ (cache-buster `…/?cb=123` helps).

Gotchas (still relevant):
1. **Keep `index.html` = the deck.** `index.html` is a byte copy of `carmanah-style.html` so the site root serves the current deck. The deploy scripts copy it for you; if you deploy by hand, copy `carmanah-style.html` over `index.html` first.
2. **No more OneDrive sync lag** — as of 2026-06-26 the working copy lives in `C:\Users\dk\cowork\` (local, not OneDrive), so the half-synced-file problem that used to bite deploys is gone.
3. **Credentials live in Claude Code, not Cowork** — run the deploy from the Claude Code environment (it has the GitHub push token).

## Open to-dos / next thread
- ~~**Competitor photos**~~ ✅ DONE (2026-06-26): real photos placed — `wasp.jpg` (WASP trailer 3), `firewolf.jpg`, `rainstream.jpg` (Wildfire Innovations real tower). WASP shot is wide; swap the crop if it reads too tight.
- **Revenue banner photo:** replace the dome-topped placeholder on Commercial Revenue Pathways with a real Carmanah-crew deployment photo.
- **Title hero image:** decide on / place the new Higgsfield hero (options generated, parked).
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
