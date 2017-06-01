Changelog
=========


3.1.0 (2017-06-01)
------------------

New
~~~
- Added 4x Aggresor Mirag2000C at Kobuleti Airfield. [Neck]

  - Kobuleti Airfield now RED
  - Added Red AWACS
  - Adjusted Blue AWACS altituds to 39.000ft and 40.000ft

Changes
~~~~~~~
- Release 3.1. [entropySG]
- Added various artillery and MLRS targets at TKIBULi range. [Neck]
- Added two SA-6 Launchers to the SA-6 battery to avoid the SA-6 running
  out of missiles too fast. [Neck]
- Updated the skins on the MI-8s so that they have correct skins. [Neck]

  - Also added personal AC for all 259th members
  - Due to space, 2 Mi-8's are set to start at ground on Lochini on one of the availeble spots on the airfield. It worked when I tested with AI.
- Added 2x 765th Mirages at Lochini to make an AC for all members in the
  765th. [Neck]
- Added cargo to Lochini and the hospital WEST of Lochini. [Neck]
- Adjusted AC at Lochini and Vaziani, see below: [Neck]

  - VIGGEN moved to VAZIANI
  - 3rd Wing A-10c changed to External A-10C
  - Masterarms A-10C changed to External A-10C
  - Copied a excisiting Mirage to create 5 External Mirage 2000C
  - Moved 476th AC to VAZIANI
  - Deleted Bravo and Mosquito AC
- Added SA-6 on/off to NECK AC. [Neck]

Fix
~~~
- Agressor AWACS now added to script and not starting mid-air fix: MOOSE
  updated to latest. [entropySG]


3.0.0 (2017-05-21)
------------------

New
~~~
- Added a new target vehicle at KUTAISI. [Neck] [132nd-etcher]
- Added a new target vehicle at KUTAISI. [Neck] [132nd-etcher]
- Added hospital directly WEST of Lochini. Added 2x transportable
  infantry groups at DUSHETI range. [Neck] [132nd-etcher]

  Intention with infantry at Dusheti is to use these for CASEVAC/MEDEVAC. For some reason I was unable to give them waypoints, so I located them at two different areas at DUSHETI to give the JTAC flexibility.

  Hospital is a new mod. I will post details and NOTAM on 132nd website to make sure everyone have the hospital. The hospital have a landing pad for RW coming it with patients.
- Added KUTAISI range airspace, added 2x MOA's, added TKIBULO range
  airspace. [Neck] [132nd-etcher]
- Added SA-6 at TKIBULO range (smokey sam controlled by JTAC) [Neck]
  [132nd-etcher]

  JTAC at TKIBULO can turn on/off the SA-6 SAM
  JTAC placed at hill EAST of range area
  Range veichles places NORTH of impact area
- Enable changelog support. [132nd-etcher]

  fixes #16

Changes
~~~~~~~
- Added static AC's at KUTAISI Range. Added fuel/ammo vehicles to
  simulate rearm/refuel. [Neck] [132nd-etcher]
- Added SA-6, and moved SAM/AAA into locations at KUTAISI Range. [Neck]
  [132nd-etcher]
- Added SA-6, and moved SAM/AAA into locations at KUTAISI Range. [Neck]
  [132nd-etcher]
- Edit CTLD lua: Added DUSHETI_medevac1 and DUSHETI_medevac2 as
  extractable groups. [Neck] [132nd-etcher]
- Added Hummer ambulances at Dusheti and static ambulances at Lochini
  hospital. [Neck] [132nd-etcher]
- Changed skins on 3rd Wing Mirage to 4/33 skins from DArt update.
  [Neck] [132nd-etcher]

  Also changed last 3Drifters Mirage to a spare 4/33 Mirage for Photun since he dont have own skin
- Moved shell2 tanker to N-S obit west of MOA south, moved Arco2 tanker
  N-S orbit EAST of MOA south. [Neck] [132nd-etcher]
- Adjusted SHELL2 track to N-S WEST of MOA SOUTH. [Neck] [132nd-etcher]
- Adjustet ARCO2 track to N-S EAST of MOA SOUTH. [Neck] [132nd-etcher]
- Deleted Kutasi OCA range impact area airspace. [Neck] [132nd-etcher]
- Added 1 radar static tgt at range TKIBULO. Also set airspace A-10Cs to
  late activation. [Neck] [132nd-etcher]
- Added latest MOOSE-lua (per request from Entropy) [Neck] [132nd-
  etcher]
- Adjust airspaces to align them properly. [Neck] [132nd-etcher]
- Adjusted Tanker TEXACO track from E-W to N-S in order to not come in
  conflict with new airspace. [Neck] [132nd-etcher]

  Also moved landing WP for ARCO 2, so it dont come in conflict with the airspace (so it dont fly straight throuhg)
- Added 3x JTAC vehicles for basic JTAC training (dont have access to
  the newest F10 range options as the 2 JTAC vehicles inplace) [Neck]
  [132nd-etcher]
- Added 3x JTAC vehicles at DUSHETI for absic JTAC training. Co-located
  with existing JTAC vehicle (SOUTHWEST) [Neck] [132nd-etcher]
- Deleted navpoints from OP GT campaign. [Neck] [132nd-etcher]

  OP GT navpoints is not relevant for the training mission.
- Added Navpoints for KUTAISI range, TKIBULI range and MOA NORTH and MOA
  SOUTH. [Neck] [132nd-etcher]

  KUTAISI: KR1-KR5
  TKIBULI: TK1-TK6
  MOA SOUTH: M1-M4
  MOA NORTH: M21-M26
- Adjusted skill level at SA-6 at TKIBULI range. [Neck] [132nd-etcher]
- Re-vamped the tanker management system. [132nd-etcher]

  fixes #17
  closes #29

Fix
~~~
- Update MOOSE to latest chg: implement airbase cleanup, this will
  despawn all landed AI planes to prevent the airports from filling up.
  [132nd-Entropy]
- Update in game Mission Briefing to include new tanker freq and Tacan.
  [132nd-Entropy]
- Rename all tankers and make them spawn with etchers code chg: add 2nd
  AWACS as per necks request. [entropySG]

Other
~~~~~
- . [132nd-Entropy]
- . [132nd-Entropy]
- Re-build. [132nd-Entropy]


2.9.0 (2017-05-05)
------------------
- Release. [entropySG]
- Enabled Missile Trainer Menu. [entropySG]


2.8.1 (2017-04-23)
------------------
- - change SAR unit type - add new units type on on-demand system -
  change on-demand unit country to Georgia - fix on-demand unit not
  being controllable. [132nd-etcher]
- Add "Player can drive" option to every sub-unit. [132nd-etcher]

  Fix #14

  P.S.: derpy etchy
- Change on-demand unit country to Georgia. [132nd-etcher]

  Fix #13
- Test. [132nd-etcher]

  Close #6
- Add new units to on-demand system. [132nd-etcher]

  Fix #6
- Quote consistency in TRMT script. [132nd-etcher]
- Weird warehouse update. [132nd-etcher]

  Maybe I'll have to add this in EMFT to prevent useless noise ?
- Change SAR unit types. [132nd-etcher]

  Fixes #12
- Change on-demand unit country to Georgia. [132nd-etcher]

  Fix #13
- Test. [132nd-etcher]

  Close #6
- Add new units to on-demand system. [132nd-etcher]

  Fix #6
- Quote consistency in TRMT script. [132nd-etcher]
- Weird warehouse update. [132nd-etcher]

  Maybe I'll have to add this in EMFT to prevent useless noise ?
- Change SAR unit types. [132nd-etcher]

  Fixes #12


2.8.0 (2017-04-23)
------------------
- Re-factorization of TRMT script. [132nd-etcher]
- Set script loading flag to "1" for release. [132nd-etcher]
- Update to latest version of DCS. [132nd-etcher]

  "Gunburst" value for prop aicrafts
- Bump AV build. [132nd-etcher]
- Fix typo. [132nd-etcher]
- Refac of TRMT script. [132nd-etcher]


2.7.9 (2017-04-14)
------------------
- . [entropySG]
- Added Lions Ka50. [entropySG]


2.7.8 (2017-04-10)
------------------
- Fix TACAN for Russian Tankers, fix Range Objects. [entropySG]
- . [entropySG]


2.7.7 (2017-04-06)
------------------
- . [entropySG]
- Merge develop including On Demand spawning (etcher) inlude moose2.0
  stable. [entropySG]
- Ignore LDT files. [132nd-etcher]
- Remove old SAR_TETRA_1 zone & related code comments. [132nd-etcher]
- Dummy. [132nd-etcher]

  Re-ordering mapResource - new EMFT feature
  Order of laser codes in the mission table due to paradigm change in EMFT
- - deleted MINT as its not ready by far. [entropySG]

  - changed unit templates for ARTY and MANPADS on demand to make them mobile

  - modified aim of CSAR hostiles so they dont kill the pilot too fast

  - renamed Deploy Infantry from Range XXX to Disembark Infantry from Logistics Vehicle at Range xxx to not mix up the new on-demand units with the ones coming from the logistics units
- Increase amount of units available for the ranges. [132nd-etcher]

  Cfr #6
- Include Mint at port 10308. [entropySG]


2.7.6 (2017-03-22)
------------------
- Added 4x Mirage for the 765th. [entropySG]


2.7.5 (2017-03-06)
------------------
- - added Levels A-10C - updated MOOSE with renamed TaskToVec2 and
  TaskToVec3 - updated TMT script to refelct above change - removed
  replaced BTR-3 with MBP-1 for SAR tasking - updated Mission Date from
  January to March. [entropySG]


2.7.4 (2017-03-05)
------------------
- Added kimkillers skin. [entropySG]
- Try again the remote build. [entropySG]
- Removed 476th aircraft and replaced them with generic 74th Vanguards
  and 81st Panthers. [entropySG]


2.7.3 (2017-03-01)
------------------
- Release. [entropySG]
- Added uncontrolled Viggen to Lochini as Mascot (and also to reduce lag
  when someone enters the aircraft). Also made some Changes to the
  training SAMs (switched units around in the editor) [entropySG]
- Renamed TMT and removed numbering. [entropySG]


2.7.2 (2017-03-01)
------------------
- Fix 7.2 release. [entropySG]
- Fix and repair AI helo tasking. [entropySG]


2.7.1 (2017-03-01)
------------------
- 2.7.1. [132nd-etcher]
- Fixed TMT script loading. [132nd-etcher]


2.7.0 (2017-02-28)
------------------
- New version 2.7. [entropySG]
- AI helo added for Search and Rescute. [entropySG]


2.6.0 (2017-02-16)
------------------
- . [entropySG]
- Added 3x Viggen to Lochini. [entropySG]
- Remade SAR tasking so that the crashsite will spawn in one out of 10
  suitable zoneslma. [entropySG]


2.5.0 (2017-02-15)
------------------
- Derped 2.5.0 rel. [132nd-etcher]
- Fix missile script. [132nd-etcher]
- Fix missile script. [132nd-etcher]
- Fix missile script. [132nd-etcher]
- Fix missile trainer. [entropySG]
- Updated to latest moose. [entropySG]
- Updated A10C Formation trainer script within the mission file to
  remove the respawn limit. [entropySG]
- Remove Limit for respawns. [entropySG]


2.4.0 (2017-02-04)
------------------
- New release with fixed J02 IP. [entropySG]
- Corrected J02 IP at TETRA range. [entropySG]
- Update moose. [entropySG]
- Add dummy red objects to highlight ranges area. [132nd-etcher]
- Add custom MOOSE ZONE:GetRandomVec2() method. [132nd-etcher]
- Add SAR_TETRA zone to mission table. [132nd-etcher]
- Simplified ctld.spawnGroupAtPoint_SAR. [132nd-etcher]


2.3.1 (2017-01-28)
------------------
- Test build. [entropySG]
- Removed tag-only build to allow for test builds again. [132nd-etcher]


2.3.0 (2017-01-27)
------------------
- Revert AV version to the correct one (2.3.0) [132nd-etcher]
- Prevent build trigger without tag. [132nd-etcher]
- Build on any tag (reverted from commit
  cb9b553e75780ef6de7386833d2eddf482fd72dd) [132nd-etcher]
- Build on any tag. [132nd-etcher]
- 2.3.2. [132nd-etcher]
- Bumping AV version. [132nd-etcher]
- . [entropySG]
- Release Build. [entropySG]
- Test release take 2. [entropySG]
- Test release. [entropySG]
- Release build. [entropySG]
- Re-added dummy. [entropySG]
- Updated mission to include the newest version of the 476th range
  targets. [entropySG]
- Removed duped comment. [132nd-etcher]
- Not needed file. [entropySG]
- AV config: skip branches with PR to avoid double building. [132nd-
  etcher]
- Move radio menus for "random movements" and "deploy infantry" to sub
  menus. [132nd-etcher]

  One submenu per range.
- Bugfix for fcf0c2e6d40309cdc789906a89f89b90c4e12668. [132nd-etcher]
- Removed branch filtering from AV config. [132nd-etcher]

  Every push to *any* branch should now trigger a build.

  It'll be simpler to test granular commits to complex table files like mission.
- Add flag reset for movements randomization on range. [132nd-etcher]

  Flags 20, 30, 40, & 50 will reset themselves to FALSE every time they're activated. That means that the units already spawned at the ranges will start moving, but that any unit spawned afterwards (as a replacement for one that got killed) will HOLD until the radio menu is called again.
- Moved TaskRouteToVec3 for the SAR templates. [132nd-etcher]
- Moved CTLD unloading into the MENU creation. [132nd-etcher]
- Refactored range movements randomization into a single function.
  [132nd-etcher]
- Moved beacons functions into the MENU creation. [132nd-etcher]

  They're basic enough
- In-line comments. [132nd-etcher]
- Top level comments. [132nd-etcher]
- Spacing. [132nd-etcher]
- Update MOOSE to latest version. [132nd-etcher]
- Updated MOOSE to the latest version. [132nd-etcher]
- Fixed type. [132nd-etcher]
- Add download links in README. [132nd-etcher]
- Remove leftover conflict-merge text from README. [132nd-etcher]
- Re-added filters. [132nd-etcher]
- Trying it for real ! [132nd-etcher]
- Test. [entropySG]
- Use tag name to rename miz file on tag builds (take 2) [132nd-etcher]
- Use tag name to rename miz file on tag builds. [132nd-etcher]
- Release only on tags. [132nd-etcher]
- Added correct current version to AV config. [132nd-etcher]
- Trying auto GH release (take 5) [132nd-etcher]

  Using artifact name
- Auto GH release (take 4) [132nd-etcher]

  Updated release token - one; more; tiiiiiiimmmmme
- Auto-rename build artifact. [132nd-etcher]
- Auto GH release (take 3) [132nd-etcher]

  Updated release token - again
- Auto GH release (take 2) [132nd-etcher]

  Updated release token
- Auto GH release (take 1) [132nd-etcher]
- Added AV config to 7z ignore list. [132nd-etcher]
- Initial AV config. [132nd-etcher]
- Dummy change to test AV build trigger (take 2) [132nd-etcher]
- Dummy change to test AV build trigger (take 1) [132nd-etcher]
- Update README.md. [132nd-Entropy]
- Adding dummy (empty) Miz for automated build. [132nd-etcher]
- Tracking all files from the TRMT. [132nd-etcher]

  Files like "mission" (the actual mission lua table) are very good candidate for source control, as well as pretty much any resource used for/by the TRMT.
- Scripts. [132nd-Entropy]

  Script Files Contained in the l10n Folder with
- Update README.md. [132nd-Entropy]
- Initial commit. [132nd-Entropy]


