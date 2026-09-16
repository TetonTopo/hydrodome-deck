# Client / field deck spec (`field.html`)

Audience: wildfire crews, fire departments, municipal emergency managers, and industrial site owners (mills, mines, camps, resorts) who would buy or operate a Moat. Most of them have run or seen a structure protection unit (SPU). They care about what it does on the ground, how it's set up, what it takes to run, and how it fits next to gear they already have.

Source: the investor deck (`carmanah-style.html`, 24 slides). Slide numbers below refer to that file.

Canon facts (use these; anything not listed here is unconfirmed):
- 8 Nelson Big Gun SR100 towers, 43-degree trajectory (needed to clear a two-storey roofline from the street).
- Trailer sits at the centre of the line, four towers each side, one straight line along the street shoulder. Tower centres 80 m apart (40 / 120 / 200 / 280 m out from the trailer per side).
- Throw about 48 m per tower, alternating north/south. Line length 500 to 800 m. Protected zone 6 to 8 ha.
- 2 or 3 towers fire at a time, sequenced by a valve on every tower. Max 80 psi at the tower.
- Two UP4 portable fire pumps, roughly 50 kW each, feeding a common manifold. Pumps run together or independently. Pumps can be relocated toward the water source and controlled wirelessly.
- Pressure regulator on every tower for even distribution.
- Manifold to trunk line to branch lines to towers.
- Two-person crew, under one hour from arrival to running.
- All valves and pumps on LoRa radio from the trailer; towers report status back. Satellite backhaul, no cell needed. One dashboard: flow, pressure, water, fire weather.
- Runs on live fire weather (CFFDRS FFMC and ember-ignition thresholds) to decide when and how much to spray. Autonomous once running, monitored remotely.
- Packed: hose on the wall, fittings alongside (SPU style), tower slots at the back, hard suction hose stored, pumps and manifold behind the rear door.

Unconfirmed (show as "confirm"/TBC or leave off): hose diameter and total length carried, trunk vs branch sizes, flow per tower (gpm/lpm), total flow, water source minimum (volume, refill rate), draft lift, run time per tank/pond size, tower height and mast type, tower footprint and anchoring, trailer size, GVWR and tow vehicle, power for controls, temperature limits, winterization steps, spacing options other than 80 m.

---

## Slide plan (target 16 to 18 slides)

### 1. Title
Keep slide 1 layout. Title "The Moat". Subtitle "Wildfire defence lines for crews, fire departments and site owners". Keep password gate and confidentiality line.

### 2. Hero
Keep slide 2 (deployed line along a street). Tighten the caption to one sentence: what it is, how fast it goes up, that it runs itself once it's on.

### 3. Who we are (short)
Merge slides 3 and 4 into one. Carmanah Wildfire: field ops since 2021, Type II and III crews, training, falling and veg management, BC/AB/Yukon. Team as a single row of names and roles, Nick and Brian first. Cut academic bios. The point of the slide is "built by people who've done SPU work", not credentials.

### 4. The problem: embers
Keep slide 5 mostly as is. It's the argument for wetting the ground between structures, which is the core difference from an SPU. One tightening pass on the copy.

### 5. What an SPU does well, and where it runs out
Rework slide 6. Give SPUs their due (thousands of homes saved). Then state the limits an operator already knows: hose lay time, crew count, roof and gutter work, only the buildings get wet, the gap between properties stays dry. End with: the Moat is meant to sit next to an SPU, not replace one.

### 6. What the Moat is
Rework slide 7. Keep the operational numbers (8 towers, 500 to 800 m, 6 to 8 ha, 2 or 3 towers at a time, 2-person crew, under an hour, two ~50 kW pumps). Cut the "vs 300 hp cannon plant" and "smaller and cheaper" market positioning lines. Cut any cost language.

### 7. Configurations (NEW)
Nick asked for this. Present as three or four cards. Only the first is fully canon; tag the rest "confirm" and phrase as "the design allows" so Nick can speak to them or skip.
- **Full line (canon):** trailer at centre, four towers each side, 80 m centres, one straight line along a street or road edge between two rows of structures. About 6 to 8 ha protected.
- **Half line / single pump (confirm):** four towers off one side, one pump. For a short frontage, a single row of structures, or when the second pump is staged elsewhere.
- **Remote pump at the water source (confirm):** pumps carried out to the pond, hydrant, or tank and run by radio; trailer stays at the line. Show the "pumps push better than they suck" note here.
- **Split line (confirm):** two groups of four with pumps and trunk line between them, for a bend in the road or two short streets.
If the existing block-out or spray-logic pages have visuals that fit, reuse them. Otherwise simple line diagrams in CSS/SVG in the deck's existing style; no new image files.

### 8. Water path
Keep slide 8 (pumps → manifold → trunk → branches → towers, regulators, redundancy). This is exactly what a pump operator wants to see.

### 9. Sequencing: why big guns on small pumps work
Keep slide 9. Keep the irrigation-rotation analogy; crews get it. Embed or link spray-logic.html as before.

### 10. Setup, step by step (NEW)
Nick asked for this. A numbered walk-through, one line each, from truck stop to walking away. Base it on the packed/set-up slide and the water-path slide. Draft (Claude Code should keep only what the source supports and tag the rest "confirm"):
1. Park the trailer at the centre of the planned line. Chock, drop the tongue.
2. Pull the towers from the rear slots and walk or drive them out to their marks (40 / 120 / 200 / 280 m each side).
3. Lay trunk line from the manifold out each side; branch to each tower.
4. Set pumps. At the trailer if the water is close, or relocate them to the source (hard suction to pond/tank, or hydrant).
5. Power up. Towers check in on the dashboard; confirm every valve reports.
6. Prime and pressure test. Regulators set; target under 80 psi at the towers.
7. Set the fire-weather thresholds (or accept defaults). Walk away. Monitor from the dashboard, on site or remote.
Add a "confirm" tag on any step where the crew count, time per step, or exact hardware isn't in the source material.

### 11. Packed vs set up
Keep slide 10. It answers "what's actually in the trailer". Keep the LoRa and two-way status points.

### 12. Specifications (NEW, rebuilt from scattered facts)
A real spec table. Two columns: item, value. Fill from the canon list above. Rows with no confirmed value get a muted "TBC" rather than a guess. Suggested rows: towers (count, model, trajectory); spacing; throw per tower; line length; protected area; towers firing at once; max tower pressure; pumps (count, model, power); manifold and regulation; hose (TBC); water source requirements (TBC); crew; setup time; control link (LoRa, range TBC); backhaul (satellite); monitoring (dashboard items); trailer dimensions and tow (TBC); operating temperature and winterization (TBC).

### 13. Coming from an SPU (NEW)
Nick asked for "things someone used to a traditional SPU would find interesting". Two columns: "Same as your SPU" and "Different". Draft:
- Same: forestry hose and fittings you already carry; portable fire pumps you already know; hard suction and drafting; a trailer you tow with a pickup (confirm); hose on the wall, gear in bins.
- Different: 8 big guns instead of 100+ small heads; wets the ground between structures, not just roofs; no ladders, gutters, or roof spikes; valves and pumps switch from the trailer or a phone, no walking the line to turn heads on; one hour and two people instead of most of a shift and a crew; it runs on fire weather so it doesn't sit dumping water all night; status from every tower so you know a head is dead before you lose it; pumps can sit at the water while the trailer sits at the line.
End with the pairing idea: SPU on the structures, Moat on the ground between them.

### 14. Site planning
Keep slide 11 (open data in, defensible line out) with the mobile-sim iframe. Reframe the copy around "we can plan your site before we show up", which is what a buyer hears.

### 15. Live 3D block-out
Keep slide 12 with the moat_blockout.html iframe. Good for a room full of firefighters.

### 16. Command and control
Keep slide 17 with the mobile-command iframe. Cut nothing; this is all operational.

### 17. How it compares (operational only)
Collapse slides 13 to 16 into one table with crew, setup time, coverage, and what each system actually does (pre-wet zone vs point suppression vs wet structures). Remove every dollar figure. Keep the line that FireWolf-type cannons are complementary, not competition; an ops audience will respect that. Drop the three deep-dive slides.

### 18. What's next
Rework slide 23 into a plain timeline with no funding column and no dollar figures: engineering and design now, prototype build this winter, field pilots in the 2027 fire season, units available after that. Add one line: "Want a pilot on your site? Talk to Nick."

### 19. Permanent installation (optional)
Keep a short version of slide 22 only if Nick wants it. HydroDome is the only place that name appears. Cut cistern gallons and propane-power details unless he asks. Default: include, last content slide, one paragraph.

### 20. Contact
Keep slide 24. Nick's number first.

---

## Cut entirely
Slides 18 (market), 19 (market sources), 20 (partners), 21 (go-to-market), and the three competitor deep-dives (14, 15, 16). Any "invested to date", "price target", "revenue model", "funding" text anywhere.

## Copy rules
No em or en dashes. No "not just X, it's Y". No "whether you're". No leverage/robust/seamless/delve/elevate/foster/landscape/crucial/pivotal. No summary or wrap-up slide. Short, plain, crew-lead voice. Contractions fine.
