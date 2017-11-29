# 132nd-Virtual-Wing-Training-Mission-Tblisi
Training Mission used by the 132nd Virtual Wing flying DCS World

This mission is designed for conducting all sort of training within the 132nd Virtual Wing including live fire exercise and aerial refueling.

132nd Virtual Wing and various other virtual organizations are located in the Tblisi area. The 3 airfields in Tblisi (Tblisi-Lochini, Vaziani and Soganlung) all lies within Tblisi TMA (Terminal Manoeuvre Area).

There are 4 ranges in the vicinity of Tblisi: Marnueli range, Tetra range, Dusheti range and Tianeti range. All ranges are close to Tblisi TMA, see full briefing for map overview of Tblisi TMA and range airspace.

## Development

An overview of the development process for this repository can be found on [ZenHub](https://app.zenhub.com/workspace/o/132nd-vwing/132nd-virtual-wing-training-mission-tblisi/boards?repos=79440118,91231932) (a Github account is needed view it).

## Content
* [Features](#features)
    * [DAWS Weather](#daws-weather)
    * [Missile Trainer](#missile-trainer)
    * [Tankers and AWACS Respawn](#tankers-and-awacs-respawn)
    * [SADL and TACAN for AI aircraft](#sadl-and-tacan-for-ai-aircraft)
    * [A10-C Formation Trainer](#a10-c-formation-trainer)
    * [Red and Blue Infantry](#red-and-blue-infantry)
    * [Training SAMs](#training-sams)
    * [CTLD Logistics Script](#ctld-logistics-script)
    * [MARNUELI Range Bomb Circle](#marnueli-range-bomb-circle)
    * [ARK-UD Beacons at all ranges](#ark-ud-beacons-at-all-ranges)
    * [Advanced Range Options](#advanced-range-options)
* [Note for Mission Designers](#note-for-mission-designers)
* [Downloads](#downloads)
    * [Stable version](#stable-version)
    * [Development version](#development-version)
* [Credits](#credits)

## Features

Here is a list of all features of the Training Mission Tblisi 
Please post any bug reports and/or feature requests [here](http://www.132virtualwing.org/index.php/page/forum_thread?id=19612).
 
Event Hosts: Please make sure you download the latest miz file directly from Github when hosting an event
The Mission can be downloaded under the documents section or directly here
[release page](https://github.com/132nd-vWing/132nd-Virtual-Wing-Training-Mission-Tblisi/releases).


### DAWS Weather
Real life weather conditions for Lochini. Simply open the mission and in the weather tab, enter UGTB, then it will put RL weather into the mission and update the briefing with the METAR automatically. Don't forget to delete the old METAR.
 
**Due to a DCS bug the DAWS WEATHER script is not working and is disabled until further notice.** 


### Missile Trainer
Smokey Sam script preventing any anti-aircraft missiles from impacting in the proximity of a player aircraft. When you get in pit you should get this message: "132nd. Missile Trainer is active" . In case you do not see this message, the script is disabled and missiles will be lethal.
The tracking/hit messages can be configured via F10 menu. 

### Tankers and AWACS Respawn
All Tankers will RTB when low on fuel or damaged/killed. New tankers will get airborne to ensure constant tanker coverage. Same for AWACS aircraft. See Mission Brief and SPINS for tanker frequencies and TACAN. 

### SADL and TACAN for AI aircraft

### A10-C Formation Trainer
Can be activated via F10 Radio Menu. Will fly South of TMA towards the west, then RTB and take-off again. 


### Red and Blue Infantry
Red and Blue Infantry in the village of Tsintskaro (East of TETRA N413230 E443704). 
Can be used for JTAC scenario or to practice door gunning with Mi-8. 

### Training SAMs
Placed South of the TMA and inactive. Will activate when any blue coalition Aircraft enters their vicinity and you will get a message. SAM locations are stored in the CDU waypoint database for the A10s. 

### CTLD Logistics Script
The following types of units are CTLD units: 
1. Any player-driven Huey or Mi-8
2. The JTAC units at DUSHETI, TIANETI and TETRA
3. The logistics Trucks at DUSHETI, TIANETI and TETRA

#### CTLD units have the following options available via F10 radio: 
1. Load Troops at Pickup Zones and unload them anywhere outside any pickup zones (Pickup zones locations see below)
2. Extract any deployed troops and/or JTACs
3. Spawn Cargo Crates for slingload at a Warehouse and assemble crates anywhere outside a Warehouse
4. Deploy Smoke Markers
5. Deploy Radio Beacons (A10, KA50, Huey and Mi-8 can home in on the beacons, all players can use F10 to get a list of active beacons)

#### Pickup zones (for loading infantry):
1. In the range storage at DUSHETI TIANETI and TETRA
2. At the apron of LOCHINI and SOGANLUG
3. At the FARPs

#### Warehouses (for spawning slingload cargo)
1. At the apron of LOCHINI and SOGANLUG
2. At the FARPs


### MARNUELI Range Bomb Circle
For Marnueli, added a F10 radio option for instructors to deploy green smoke around the Conventional Circle West to help with initial spotting, also added waypoints for the circles at Marnueli to the A10 CDU


### ARK-UD Beacons at all ranges
Added Ark-UD Beacons to all ranges an to LOCHINI airport. 
The beacons can be activated and deactivated via F10 menu under Ark-UD Beacons, this will also tell you the preset required

*TODO: next on the list will be SAR troops with Ark9 beacons for hide and seek games for Mi-8*

### Advanced Range Options

#### Auto spread out
If a range needs to be prepared in a hurry, all players can simply select "randomize movement at range xxx" . This will randomly spread out all target vehicles (but not logistics trucks) at the range selected. 
Any target vehicles (but not logistics trucks) will respawn 20 sec after destruction. 

#### Spawn additional forces
If the units in the range storage will not suffice, you can use the range options and spawn in additional troops such as an artillery convoy etc. (We call this OnDemand Spawning) 

#### Logistics Vehicles
At TIANETI, DUSHETI and TETRA ranges you will have one logistics unit each. Those can be directly controlled like JTAC vehicles and be used as CTLD units with all function (see above). If infantry is deployed from the logistics vehicle, the ground troops can be picked up again and transported elsewhere.
In addition, and this is mainly for pilots who cannot leave their aircraft, the logistics vehicles can be controlled via the F10 map and sent to any location. At any time, pilots can use a F10 radio option to unload infantry from the logistics vehicle.
As soon as the logistics vehicle enters the range storage area again, new infantry will be loaded up, that way multiple rounds of ground troops can be deployed.

#### Search and Rescue with optional CSAR

**TETRA range only**

When a player selects 'Activate Crash Site' an A10-C will crash at a random location within the TETRA range area. The downed pilot is simulated via MANPAD unit that can serve as JTAC if needed. 
The downed pilot will automatically activate a CTLD-compatible beacon that anyone can home in to. 
The downed pilot is also extractable, so he can be rescued via any transport helicopter, he can also be extracted via the Transport vehicles at the ranges (just make sure to unload their troops first, so they have space). 

Any player can request green smoke from the downed pilot at any time using the F10 menu. 

If no human transport pilots are available, in order to practice CAS or CSAR, any player can request an AI Huey via F10 menu. The Huey, when called, will take off from FARP MARNUELI and make its way to the crash site. It will automatically pick up the pilot and RTB to FARP MARNUELI. 

If desired, one can 'Activate Hostile Forces' to simulate a CSAR scenario. This will activate simulated red units (in fact they are blue, like the range targets) that will start making their way towards the downed pilot. The 'hostiles' will try to engage the downed pilot, so CAS will be required to save him. 

There are two types of 'hostiles': 1. armored vehicles such as IFVs and 2. Transport trucks that will automatically unload their troops to engage the pilot. 


What you should keep in mind: 
1. The location of the crash site will be random. This means the site can possibly be very hard to access from the ground. In this case, the 'hostiles' will maybe not manage to get within firing range. 

2. If you are unhappy with the crash site, you can simply spawn a new one at a better location. Just make sure you tune into the second beacon then. 

3. If you activate the 'hostiles' they will always make their way towards the last crash site you spawned. Once they come close, they will open up at the down pilot so make sure you provide CAS before they get too close. 



## Note for Mission Designers
Anyone editing the mission file directly, you need to make sure you have the following mods installed: 
- 132nd Training DB 1.5.5
- DAWS Weather
- SADL and TACAN mods -13nd
https://www.dropbox.com/sh/dhpuaxz6p6i0san/AACg0T2QCz65acQWCaA5l2V9a?raw=1

Also the latest version of 476th range objects (to be found on the 476th website under downloads
http://www.476vfightergroup.com/downloads.php?do=cat&id=47

Note for CTLD pilots
Once you get in pit, make sure CTLD loaded up correctly for you. Do this simple test: F10 radio options see if CTLD shows up. If no, alternate between pressing F11 (previous) and F10 (other..) CTLD should show up after a few tries.
 
 


## Downloads

### Stable version

The latest stable version can be found on the [release page](https://github.com/132nd-vWing/132nd-Virtual-Wing-Training-Mission-Tblisi/releases).

### Development version

Every change triggers an automated build of the MIZ file. Be aware that this build may be unstable; it exists only for testing and debugging purpose.

Latest build artifact can be downloaded from [Appveyor](https://ci.appveyor.com/project/132nd-VirtualWing/132nd-virtual-wing-training-mission-tblisi/build/artifacts)

## Credits

Thanks to the creators of 
* MIST 
* MOOSE 
* CTLD
* DAWS Weather

Thanks also to Hansolo for updating all Navpoints and implementing TACAN and SADL for tankers

Thanks to 476th for the range objects mod
