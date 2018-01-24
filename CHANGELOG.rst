Changelog
=========


(unreleased)
------------
- Fix menus. [132nd-Entropy]


6.4.0 (2018-01-24)
------------------

New
~~~
- Add Sams to Tkibuli Range (default off, can be changed via Range
  Options F10 menus) [132nd-Entropy]


6.3.0 (2018-01-19)
------------------

Fix
~~~
- Re-add warhouses at the FARPs and Lochinig and Soganlug fix: renamed
  Range objects. [132nd-Entropy]


6.2.0 (2018-01-16)
------------------
- Re-added CSAR fixed Ejection script re-added FAC(A) target marking.
  [132nd-Entropy]
- Re-enable Range Targets. [132nd-Entropy]


6.1.0 (2018-01-16)
------------------
- Re-enable radiobeacons and ejetion script. [132nd-Entropy]


6.0.0 (2018-01-15)
------------------
- Start over. [132nd-Entropy]


5.3.0 (2018-01-12)
------------------

Changes
~~~~~~~
- Rename advanced menus fix: set Harriers to Client new: add radio
  command for FAC(A)s to mark spread out targets on the ranges via
  flare. [132nd-Entropy]
- Added 4 Harriers to Lochini. [132nd-Entropy]

Fix
~~~
- Update MOOSE chg: fwd weather to January. [132nd-Entropy]


5.2.0 (2017-12-28)
------------------

Changes
~~~~~~~
- Add JJ AC on UGTB. [132nd-etcher]
- Re-addded Gory Convoy (JTAC and Convoy are separate groups now)
  [132nd-Entropy]
- Revert time to daytime chg: remove the rest of the convoy to have only
  one single vehicle in the group. [132nd-Entropy]
- Adjusted wind/weather and date for tonights event. [132nd.Neck]
- Added Friendly artillery at Gori Range Complex. [132nd.Neck]
- Added Range storage veichles at Gori Range Storage (and created Gori
  Range Storage) [132nd.Neck]

Fix
~~~
- Replace MENU_COALITION with MENU_MISSION. [132nd-Entropy]
- Remove remaining radio menu triggers set via Mission Editor. [132nd-
  Entropy]


5.1.0 (2017-12-20)
------------------

Changes
~~~~~~~
- Restore A10 formation trainer chg: nested Ark_UD beacons under
  Transport Taskings menu. [132nd-Entropy]


5.0.0 (2017-12-19)
------------------
- Put back Necks Menus via scripting. [132nd-Entropy]


4.3.12 (2017-12-19)
-------------------

Fix
~~~
- Try new prototype moose.lua from Sven. [132nd-Entropy]

Other
~~~~~
- Re-enable Random Traffic. [132nd-Entropy]
- Test: remove Necks menus to decrease the list of radio items. [132nd-
  Entropy]


4.3.11 (2017-12-14)
-------------------

Fix
~~~
- Reenable Random Air Traffic fix: update Moose with menu fix. [132nd-
  Entropy]


4.3.10 (2017-12-13)
-------------------

Changes
~~~~~~~
- Disable RAT for debugging. [132nd-etcher]

  It seems like RAT might be the source of the disappearing menus

Other
~~~~~
- Delete test.lua. [132nd-etcher]


4.3.9 (2017-12-11)
------------------

Changes
~~~~~~~
- Moose update with latest fixes. [132nd-Entropy]


4.3.8 (2017-12-11)
------------------

Changes
~~~~~~~
- Include trigger conditions in the Mission editor to turn on/off
  scripts fix: Missile trainer working again chg: forwarded time to
  December -> Winter Textures. [132nd-Entropy]

Fix
~~~
- Updated moose to the latest fix: change Ejection script to also take
  into account helicopters. [132nd-Entropy]

Other
~~~~~
- Disable everything but moose to isolate the issue with the missile
  script. [132nd-Entropy]


4.3.7 (2017-12-08)
------------------

Fix
~~~
- Update moose to latest, including all fixes to RAT and Menus. [132nd-
  Entropy]

Other
~~~~~
- Fix changelog. [132nd-Entropy]


4.3.6 (2017-12-07)
------------------

Fix
~~~
- Random Air Traffic (etcher) [132nd-Entropy]


4.3.5 (2017-12-07)
------------------

Fix
~~~
- Fix stupid mistake I made a while back. [132nd-etcher]


4.3.4 (2017-12-07)
------------------

Changes
~~~~~~~
- Auto-version. [132nd-etcher]

  No need to update appveyor.yml anymore, just push tags when new version is ready


4.3.2 (2017-12-07)
------------------

Fix
~~~
- Fix removal of debug menu. [132nd-etcher]
- Fix tankers not being destroyed after they stop. [132nd-etcher]


4.3.1 (2017-12-04)
------------------
- . [132nd-Entropy]
- Fix README.md. [132nd-etcher]
- Delete 1_TRMT_BASE.lua. [132nd-etcher]

  Why on Earth is there a "1_TRMT_BASE.lua" file in the master branch ???
- Working on base class system. [132nd-etcher]


4.3.0 (2017-11-25)
------------------

Changes
~~~~~~~
- Reactivated Civilian Traffic and commented out Civ Traffic Status
  messages again. [132nd-Entropy]
- Removed submenus for Search and Rescue Tasking after they have been
  activated. [132nd-Entropy]
- Increased missile detonation range from 450m to 500m to prevent
  casualties with the Missile Trainer running. [132nd-Entropy]

Other
~~~~~
- Release. [132nd-Entropy]
- . [132nd-Entropy]
- Fix forgot to activate Civ Traffic. [132nd-Entropy]
- Update CHANGELOG.rst. [132nd-Entropy]
- Release Master. [132nd-Entropy]


4.2.0 (2017-11-22)
------------------

Fix
~~~
- Menus disappearing (hopefully) fix: Civillian Traffic messages off.
  [132nd-Entropy]

Other
~~~~~
- . [132nd-Entropy]
- . [132nd-Entropy]


4.1.0 (2017-11-18)
------------------

Changes
~~~~~~~
- Default time 083000. [132nd-Entropy]

Fix
~~~
- Removed Civlian Traffic ATC messages. [132nd-Entropy]

Other
~~~~~
- . [132nd-Entropy]


4.0.0 (2017-11-17)
------------------

Changes
~~~~~~~
- Spawn the CSAR manpad in a random area 3000m around the location of
  ejection chg: activation of the radio beacon no longer directly on top
  of the CSAR manpad. [132nd-Entropy]

Fix
~~~
- Fixed ejected pilot not being transportable. [132nd-Entropy]
- Bugfix csar. [132nd-Entropy]
- Ejected pilot menu changed to coalition menu. [132nd-Entropy]


3.9.7 (2017-11-16)
------------------

New
~~~
- Ejection will now trigger the broadcast of an emergency signal on
  guard frequency (UHF) new: Ejection will now place a controllable
  manpad unit on the location of the ejection new: the controllable
  manpad will have the ability to create a CTLD beacon. [132nd-Entropy]
- Added Civilian Airtraffic in Russian Airspace. [132nd-Entropy]
- Added AJS37 Aggressor at Sukhumi. [132nd.Neck]

Changes
~~~~~~~
- Added additional targets. [132nd.Neck]
- Added Downed pilot as extracable group in CTLD. [132nd.Neck]
- Adjusted the 476th range targets at Dusheti and Tianeti (oriented
  strafe pits and foul lines 90 degrees to orient them correctly).
  [132nd.Neck]

Fix
~~~
- Spread out the times of script initialization chg: added Dejjvid's and
  Q's Ka50s. [132nd-Entropy]
- RAT correct table of excluded airports. [132nd-Entropy]

Other
~~~~~
- . [132nd-Entropy]


3.9.6 (2017-11-02)
------------------

Changes
~~~~~~~
- Set aggressor mirages, Mig21 and F5s to black skin by default chg:
  updated standard loadout of aggressor F5 chg: update MOOSE to latest
  chg: advanced date to current (Nov2) [132nd-Entropy]

Fix
~~~
- Remove tester A10 chg: change orbit  for A10 Formation trainer from
  FL100 to FL140. [132nd-Entropy]

Other
~~~~~
- Try the release again. [132nd-Entropy]
- Muck around with the tag to get the build started. [132nd-Entropy]


3.9.5 (2017-10-19)
------------------

Changes
~~~~~~~
- Troops dropped from helicopter will not run around and damage the
  dropship. [132nd-Entropy]

Fix
~~~
- Removed obsolete obstruction vehicles at Soganlug. [132nd-Entropy]

Other
~~~~~
- Release. [132nd-Entropy]


3.9.4 (2017-10-18)
------------------

Changes
~~~~~~~
- Removed Mechaniccs Mi-8 and replaced with Q's Mi-8. [132nd-Entropy]

Other
~~~~~
- Release. [132nd-Entropy]


3.9.3 (2017-10-17)
------------------

Changes
~~~~~~~
- Update MOOSE. [132nd-Entropy]

Fix
~~~
- Change tankerscript to prevent tankers getting stuck at Soganlug.
  [132nd-Entropy]
- Fixed Mi-8 presets (again) [132nd-Entropy]

Other
~~~~~
- Changes ~~~~~~~ - Update MOOSE. [132nd-Entropy] [132nd-Entropy]

  Fix
  ~~~
  - Change tankerscript to prevent tankers getting stuck at Soganlug.
    [132nd-Entropy]
  - Fixed Mi-8 presets (again) [132nd-Entropy]


3.9.2 (2017-10-15)
------------------

Changes
~~~~~~~
- Added TSKHINVALI Range. [132nd.Neck]
- Added second JTAC vehicle to CTLD. [132nd.Neck]
- Changed the skins for the external MI-8's. [132nd.Neck]
- Changed Bullseye to Kutaisi. Adjusted timing in the mission to be
  correct for event on Sunday. Changed weather for event on Sunday.
  [132nd.Neck]
- Just a small fix of a radar as example for Hamster. [132nd.Neck]
- Disabled tracking info on the missile trainer (only launch and hit)
  chg: loaded all scripts on mission start (should facilitate testing in
  single player) [132nd-Entropy]

Other
~~~~~
- . [132nd-Entropy]


3.9.1 (2017-10-10)
------------------
- MOOSE hotfix. [132nd-Entropy]


3.9.0 (2017-10-10)
------------------

Fix
~~~
- Update moose (this time with the correct script..) chg: change
  external Mi-8s from NOR to USA. [132nd-Entropy]

Other
~~~~~
- Added 6x Mi-8 with correct radio presets. [132nd-Entropy]


3.8.3 (2017-10-09)
------------------

Fix
~~~
- Revert Moose update (server crash) [132nd-etcher]


3.8.2 (2017-10-09)
------------------

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

Fix
~~~
- Remove external M8-s with wrong presets chg: update MOOSE to latest
  release. [132nd-Entropy]

Other
~~~~~
- Release. [132nd-Entropy]
- Add: Added Dropzone for LZ Hawk in CTLD file. [Neck]
- Add: Added dropzone for CTLD for LZ hawk. [Neck]


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


3.7.5 (2017-09-29)
------------------
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
- Forgot test aircraft in the mission. [132nd-Entropy]
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


