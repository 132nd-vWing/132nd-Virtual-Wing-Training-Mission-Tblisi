Changelog
=========


(unreleased)
------------
- Added 6x Mi-8 with correct radio presets. [132nd-Entropy]


3.8.3 (2017-10-09)
------------------

Fix
~~~
- Revert Moose update (server crash) [132nd-etcher]


3.8.2 (2017-10-09)
------------------

New
~~~
- Added some navpoints for targets at NOLGA and KASHUR ranges. [Neck]
- Added Pickupzone in ME at Tblisi railstation. [Neck]
- GORI RANGE: Added various targets and activity (JTAC related) [Neck]
- Added CTLD pickupzone at GORI range complex and at FOB Kilo. [Neck]
- Added M113 convoy (For JTAC) on GORI Range Complex. JTAC should not
  use first vehicle. JTAC starts convoy by Using F10. Convoy drives to
  the range village. Convoy can be started and stopped using F10. (JTAC
  veichle is the 3rd veichle in the convoy.) [Neck]
- Added navpoints for some targets at TKIBULI range. [Neck]
- Added more targets at GORI RANGE COMPLEX. [Neck]
- Added targets for GORI RANGE COMPLEX. [Neck]
- Added targets at NOLGA range complex. [Neck]
- Added veichles to the range storage at KASHURI Range. [Neck]
- Added 3x External MI-8's at Lochini. [Neck]
- Added 1x Ural truck for each SAM group. (So that all SAM's can get new
  missiles if they run out of missiles). [Neck]
- Added NOLGA Range + SA-15 at NOLGA. [Neck]
- Added KASHURI WEST Range (Arty, + Buildings) [Neck]
- Added Ammo crates at Railway station at TBLISI for sling load to SOF
  FOB. [Neck]
- Added Bomb cargo at Tblisi Railstation for MI-8 to slingload. [Neck]
- Added LZ HAWK as a triggerzone, just to see it in the ME. [Neck]
- Added SAM's to TSKHINVALI area (SA-8, SA-13 and SA-9). Plus EWR. All
  for advanced scenario. [Neck]

Changes
~~~~~~~
- Set blue units at TKIBULI to ROE Weapons hold (to prevent firing on
  the aggressors) [Neck]
- Changed LZ Hawk zone from dropzone to WP zone. [Neck]
- Set SAM's at TSKHINVALI area to hidden on map, so they dont show up on
  ABRIS in KA-50. [Neck]
- Renamed 476th A-10s at VAZIANI to External A-10 #5-8 to avoid
  confuction. [Neck]
- Adjusted startup of advanced scenario. [Neck]
- Adjusted RED Tanker (IL-78) tanker track and speed. Now racetrack WEST
  of the coast. FL240, speed 390. [Neck]
- Loaded latest CTLD file. [Neck]
- Added MI-8 #5 and #6 to CTLD. [Neck]
- Added 2 more external MI-8s. Now a total of 6. #5 and #6 have a German
  skin. While 1-4 is US. [Neck]
- Updated range targets at GORI Range complex. [Neck]
- Added LZ's for MI'8 SOF insertions (Just to see them in the ME).
  Placed combatants on one of the LZ's at GORI Range complex. [Neck]
- Set SA-15 at Nolga range to AI off. [Neck]
- Added Tblisi Railstation pickupzone in CTLD. [Neck]
- Made Tkibuli TGT #4 and #9 destructable chg: update MOOSE to latest.
  [132nd-Entropy]
- Added Gori Range convoy JTAC veichle as a CTLD transport. (3rd vehicle
  in the convoy). [Neck]
- IN CTLD: Added GORI Range pickupzone, close to Gori Range Warehouse.
  Added FOB KILO pickupzone. [Neck]
- Added US SOF team 1 and 2 (FOB KILO) as extracable group in CTLD.
  [Neck]
- Edited CTLD (I did not do it in the last commit apperantly). Added 4x
  external MI-8s so they can use CTLD. [Neck]
- Edited CTLD to make the 4 external MI-8's able to use CTLD. Renamed
  the first MI-8 external to MI-8 External #1. [Neck]
- Make Tkibuli range Targets 1 and 7 destroyable. [132nd-Entropy]
- Added another External MI-8 (total of 4), changed the locations for
  MI-8's, renamed 3rd wing and 36 stormo KA-50's and Huey to External
  AC, and changed nationality to US for all of them. [Neck]
- Set the newly added SAM's at TSKHINVALI to AI Off, and made F10 menu
  to turn them on/off as part of the advanced scenario. [Neck]

Fix
~~~
- Remove external M8-s with wrong presets chg: update MOOSE to latest
  release. [132nd-Entropy]

Other
~~~~~
- Release. [132nd-Entropy]
- Add: Added Dropzone for LZ Hawk in CTLD file. [Neck]
- Add: Added dropzone for CTLD for LZ hawk. [Neck]
- Update mose to version 2.2. [132nd-Entropy]


3.8.1 (2017-10-02)
------------------

New
~~~
- Added Air Interdiction targets at TKIBULI range. [Neck]
- Triggers to activate advanced scenario (activate SAM's) added to 617th
  Neck AC. [Neck]
- Added SAM's ( AI OFF) to protect High Value Target area of TKIBULI and
  KUTAISI. All SAM's with pre-fix ADV_  is intended for advanced
  scenarios or big exercises. [Neck]

Changes
~~~~~~~
- Red Tanker orbit moved so it is now over SUKHUMI. [Neck]
- Moved Commstower at KAVATSHIRI (SOF FOB) [Neck]
- Renamed AI targets at TKIBULI SOUTH. [Neck]
- Moved Tkibuli SA-8, further south, to "give room" for AI Targets at
  TKIBULI. [Neck]
- Set tankers and AWACS staged on airfields West on the map as invicible
  (so red SAMs dont fire at the units) [Neck]

Other
~~~~~
- Set red F5s at Lochini to hotstart put in moderate default weather.
  [132nd-Entropy]


3.8.0 (2017-09-30)
------------------

Fix
~~~
- New tankers should have a functional TACAN beacon. [132nd-etcher]

  Using MOOSE AATACAN feature instead of the one provided in the ME

Other
~~~~~
- Replaced F5 agressors with flyable version. [132nd-Entropy]
- Replaced F5 agressors with flyable version. [132nd-Entropy]


3.7.4 (2017-09-29)
------------------

New
~~~
- Add auto-despawn for tankers after RTB taxi (reverted from commit
  58ee10d03890ed7d2811593bacca7445fb28304c) [Neck]

Changes
~~~~~~~
- Re-added hospital close to Lochini. [Neck]
- Minor changes. [Neck]
- Added SOF FOB at KAVTISHEVI, just NORTHWEST of OBORA. [Neck]
- Moved RED Bullseye and placed it at same location as BLUE bullseye.
  [Neck]
- Added RED Ural logistics vehicle to SUKHUMI and KOBULETI in order to
  make sure that the aggressor airfields stay RED. Blue tankers will
  spawn there, so not sure if it will make the the airfield turn blue.
  [Neck]
- Added RED Ural on Sukhumi and Kobuleti, to make sure that airfield
  stays red, even if Blue AC spawns there (Blue tankers are set to spawn
  there) [Neck]

Other
~~~~~
- Release. [132nd-Entropy]
- Update MOOSE to latest fix TACAN and EPLRS on tankers and AWACS.
  [132nd-Entropy]


3.7.3 (2017-09-26)
------------------
- Update moose update CTDL add RED tanker (tanker and freq, see in game
  mission brief) add F5, Mirage and Mig21 Agressors to Lochini add F5,
  Mirage and Mig21 Agressors to Sukhumi remove agressors from Sukhumi
  fix red awacs not respawning new agressor skins. [132nd-Entropy]


3.7.2 (2017-09-18)
------------------

Fix
~~~
- Tweak missile trainer: put on hit messages back on, decrease intercept
  distance between missile to target plane from 1000m to 450m. [132nd-
  Entropy]
- Replaced SA-6 at Tkibuli with SA-3 since SA-6 is bugged. [132nd-
  Entropy]
- Forgot test aircraft in the mission. [132nd-Entropy]

Other
~~~~~
- Release. [132nd-Entropy]
- Update MOOSE 18092017. [132nd-Entropy]


3.7.1 (2017-09-12)
------------------

Changes
~~~~~~~
- Changed missile max distance before it reaches a player aircraft from
  100m to 1000m. This should prevent us from killing each ohter like we
  did in the past. If this is still not enough the value will need to be
  increased. Also removed the missile trainer config menu, so the safe
  distance cannot be manually overriden. Also disabled the 'player was
  hit' messages. You get a missile notification and tracking info, but
  thats it. [132nd-Entropy]

Fix
~~~
- Fixed infantry unable to move at TETRA. [132nd-Entropy]


3.7.0 (2017-09-12)
------------------

Fix
~~~
- Made Red Infantry at TETRA respawnable via F10 Range menu fix: updated
  MOOSE fix: removed CLEANUP class from MOOSE script. [132nd-Entropy]

Other
~~~~~
- . [132nd-Entropy]


3.6.9 (2017-09-11)
------------------

Changes
~~~~~~~
- Chg: update MOOSE to latest chg: reconfigure Soganlug-based Mi-8s to
  slick (@Looney) [132nd-Entropy]


3.5.8 (2017-08-30)
------------------

New
~~~
- Add auto-despawn for tankers after RTB taxi. [132nd-etcher]

Changes
~~~~~~~
- Chg: swap Su25s for Su25Ts (request @Looney) fix: update MOOSE to
  latest fix: fix tankers and AWACS too low speed after takeoff
  (reported by @Hansolo) [132nd-Entropy]

Fix
~~~
- Bomb circles at Marnueli as per Fudd's request fix: tankers despawning
  when landed (Etcher) [132nd-Entropy]

Other
~~~~~
- . [132nd-Entropy]
- , [132nd-Entropy]


3.6.7 (2017-08-27)
------------------

New
~~~
- Additional Transport Tasking for Mi-8 fix: fixed Soganlug-based Mi-8s
  not having access to CTLD. [132nd-Entropy]


3.6.6 (2017-08-17)
------------------

Changes
~~~~~~~
- Tasking for VIP transport option will now disappear after tasking has
  been activated. [132nd-Entropy]

Other
~~~~~
- New release. [132nd-Entropy]
- Dev: chg: minor re-format. [132nd-etcher]


3.6.5 (2017-08-16)
------------------
- Added Transport Tasking for Mi-8. [132nd-Entropy]


3.6.4 (2017-08-14)
------------------

Changes
~~~~~~~
- New tanker management system. [132nd-etcher]

Other
~~~~~
- Update MOOSE to latest update weather. [132nd-Entropy]
- Update moose. [entropySG]
- Adds link to ZenHub page to README. [132nd-etcher]


3.6.3 (2017-07-21)
------------------

New
~~~
- Add Evilivan A-10C. [132nd-etcher]

Changes
~~~~~~~
- Added Mechanics A-10C. [entropySG]

Other
~~~~~
- Release. [entropySG]


3.6.1 (2017-07-14)
------------------

New
~~~
- Add A10C for bilgatus. [132nd-etcher]

Changes
~~~~~~~
- Renamed a bunch of client units for consistency. [132nd-etcher]

  All client units now have the relevant squadron as prefix.
- Renamed a bunch of client units for consistency. [132nd-etcher]

  All client units now have the relevant squadron as prefix.


3.6.0 (2017-07-14)
------------------

Fix
~~~
- Update MOOSE to latest chg: add Chilts A10-C. [132nd-Entropy]


3.5.0 (2017-07-09)
------------------

Fix
~~~
- CTLD fixed to allow 20 troops being transported by Mi-8. [132nd-
  Entropy]


3.4.0 (2017-07-08)
------------------

Fix
~~~
- Implement correct Airbase cleanup fix: update MOOSE. [132nd-Entropy]

Other
~~~~~
- 3.4 realease. [132nd-Entropy]


3.3.0 (2017-07-04)
------------------
- Release 3.3. [132nd-Entropy]
- Change starting positions of tankers and awacs to avoid collision
  during intial taxi. [132nd-Entropy]


3.2.0 (2017-06-30)
------------------

Changes
~~~~~~~
- Updated CTLD Now Huey can only transport 8 Troops, while Mi-8 can
  transport 20 Troops. [132nd-Entropy]

Other
~~~~~
- . [132nd-Entropy]
- Update to latest MOOSE June30. [entropySG]


3.1.0 (2017-06-01)
------------------

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

Other
~~~~~
- . [132nd-Entropy]
- . [132nd-Entropy]


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
- Re-added filters. [132nd-etcher]
- Test release take 2. [entropySG]
- Test release. [entropySG]
- Trying it for real ! [132nd-etcher]
- Dummy change to test AV build trigger (take 2) [132nd-etcher]
- Release build. [entropySG]
- Re-added dummy. [entropySG]
- Updated mission to include the newest version of the 476th range
  targets. [entropySG]
- Removed duped comment. [132nd-etcher]


