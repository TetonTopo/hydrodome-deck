# Coding-agent task: relocate the HydroDome simulator to a REAL high-risk BC community on the true forest edge

**Repo:** `hydrodome-mobile-sim` (live at https://tetontopo.github.io/hydrodome-mobile-sim/)
**Goal of this task:** Move the *entire* simulation scene from its current invented layout to a **real, named, high-wildfire-risk British Columbia community that genuinely sits on the edge of the forest** — with **real building footprints** and a **real forest boundary**, so the fire starts in an actual forest on the ground and spreads into the actual community. Do **not** keep faking it.

---

## Why this task exists (read first — this is the trap to avoid)

A previous round of feedback asked for the scene to be "on the edge of the forest." That feedback was implemented the **wrong way**: a block of trees ("fake forest") was dropped into the *middle of town*, and the existing invented street grid was left in place. The result *looks* like it's near a forest, but nothing corresponds to a real place — the houses aren't real footprints, and the "forest" isn't where any real forest is.

**The correct fix is a relocation, not a decoration.** The whole map — basemap, building footprints, the forest polygon, the ignition point, and the tower-placement zone — must all be re-grounded to one real location so they line up with each other and with the real terrain. If the forest layer and the fire ignition don't sit on top of an actual forest in the underlying imagery, the task is not done.

---

## Target community (parameterize this — see alternates)

**Default: Fort St. James, BC** — chosen for consistency with the rest of the HydroDome deck (it's already named as the permanent-installation pilot community). It's a small District municipality on the southeast shore of Stuart Lake with a hard forest edge wrapping the town on the land sides — a clean WUI interface for the demo.

Make the location a **single config object** at the top of the data module (centre lat/lng, zoom, bounding box, wind default) so it can be swapped in one place. Good alternates if a sharper/more dramatic forest edge is wanted:

- **Logan Lake, BC** — the FireSmart "poster" town that survived the 2021 Tremont Creek fire; almost completely ringed by forest. Excellent, recognizable WUI demo.
- **West Kelowna, BC** — 2023 McDougall Creek fire; steep forested slope meeting dense neighbourhoods.
- **100 Mile House, BC** — classic Cariboo interface town.

> Pick the default unless told otherwise, but build it so changing the community is a config edit, not a rewrite.

---

## What "real" means here — the four layers that must all register to the same ground

Everything below must be in the **same coordinate/projection space** (Web Mercator / EPSG:3857, i.e. standard Leaflet/Mapbox lat-lng) so the layers overlay correctly.

### 1. Basemap
Render the scene over a **real basemap tile layer** for the chosen community — satellite/aerial imagery (e.g. Esri World Imagery, Mapbox Satellite, or Bing Aerial) or a real terrain map — centred on the config lat/lng. This is the ground truth every other layer must visually agree with. The forest you draw must sit on the trees you can see in the imagery; the houses must sit on the real lots.

### 2. Building footprints (real, not invented)
Replace the invented street grid with **real building footprints** for the community. Source options, in order of preference:
- **Microsoft / Statistics Canada Open Building Footprints for Canada** (open data, polygon footprints) — clip to the bounding box.
- **OpenStreetMap buildings** via the Overpass API: `way["building"]` within the bounding box, exported to GeoJSON.
- If a full footprint pull is too heavy for a client-side demo, **pre-export a GeoJSON once**, simplify/decimate it, and bundle it as a static asset in the repo (don't fetch a huge dataset live on every load).

Each footprint becomes a "structure" the sim can mark protected/at-risk, exactly as it does today — only now they're real buildings in real positions.

### 3. Forest boundary (placed where the real forest actually is)
Define the forest as a **real polygon on the correct side(s) of town**, not a rectangle in the middle. Source options:
- OSM `landuse=forest` / `natural=wood` polygons via Overpass within the bounding box, OR
- A hand-traced polygon following the visible treeline in the basemap imagery (acceptable for a demo — trace the actual WUI edge), OR
- A land-cover layer clipped to the box.

The forest polygon must hug the real treeline so the **WUI interface line** (where forest meets the outermost buildings) is geographically correct.

### 4. Fire ignition + spread
- The ignition point(s) must be placed **inside the real forest polygon**, at/near the WUI edge, on the **upwind** side relative to the default wind.
- Fire spreads **from the forest into the community** across the real interface — not from a block sitting among the houses.
- Keep the existing fire-spread mechanics/parameters; only the **origin and the terrain it spreads over** change. Default wind should blow from the forest toward the town core so the demo tells the right story.

---

## Tower placement / coverage zone
The deployable-tower placement zone should default to the **WUI interface band** — the strip between the outermost real buildings and the fored edge — since that's where HydroDome would actually be staged. Existing tower, sprinkler-radius, and sequential-firing logic stays the same; it just now sits on the real interface.

---

## Hard requirements / acceptance criteria (the build is "done" when all are true)
1. The map opens centred on the chosen real community over a **real basemap**, recognizably that place.
2. Buildings shown are **real footprints** in their real positions (no invented grid).
3. The forest layer sits on the **real forest** in the imagery, on the geographically correct side(s) of town — **no forest block inside the town core**.
4. The fire **ignites inside the real forest** at the WUI edge and spreads **into** the community; default wind pushes forest→town.
5. All four layers (basemap, buildings, forest, fire/towers) **register to each other** — pan/zoom and they stay aligned; nothing floats off the ground it represents.
6. Location is a **single config object**; swapping to an alternate community (Logan Lake, West Kelowna, 100 Mile House) is a config change, not a refactor.
7. The existing simulator UX is preserved: tower placement, sprinkler coverage, sequential firing, fire-spread sim, "buildings protected" / cost-vs-damage readouts, and the `?auto=1` autoplay used by the deck embed.
8. No regression in the deck embed (it loads the sim in an iframe at `…/hydrodome-mobile-sim/?auto=1`).

---

## Suggested implementation steps
1. Add a `LOCATION` config (centre, zoom, bbox `[minLng,minLat,maxLng,maxLat]`, default wind bearing).
2. Pre-export three static GeoJSON assets clipped to the bbox: `buildings.geojson`, `forest.geojson`, and a `wui_interface` line (or derive the interface from the two). Simplify for client-side performance.
3. Swap the basemap tile layer to real imagery centred on `LOCATION`.
4. Replace the invented building generator with a loader that renders `buildings.geojson` as the structure set.
5. Render `forest.geojson` as the forest layer; **delete the in-town fake-forest block.**
6. Move the ignition seeding to sample points **inside** `forest.geojson` near the interface, upwind.
7. Re-anchor the tower placement zone to the interface band.
8. Verify against the acceptance criteria above; capture a screenshot of the opening view to confirm the forest sits on real trees and the fire starts in it.

---

## Data-source quick reference
- **OSM Overpass API** — buildings (`way["building"]`), forest (`landuse=forest`, `natural=wood`), within bbox. Export GeoJSON.
- **StatCan / Microsoft Open Building Footprints (Canada)** — bulk real footprints, open licence.
- **Esri World Imagery / Mapbox Satellite / Bing Aerial** — real basemap tiles.
- **BC WUI Risk Class Maps** (gov.bc.ca) — to confirm the chosen community is genuinely high-risk and to sanity-check where the interface is.

**One-line summary for the agent:** *Re-ground the entire sim to one real high-risk BC community (default Fort St. James) — real basemap, real building footprints, a real forest polygon on the true treeline, and an ignition that starts inside that forest and burns into town — with all layers registered to the same coordinates and the location swappable from a single config.*
