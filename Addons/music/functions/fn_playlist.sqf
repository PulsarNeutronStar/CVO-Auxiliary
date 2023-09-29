/* WIP
 * Author: Zorn
 * Plays random music from premade playlists
 *
 * Arguments:
 * 0: premade playlist <string>
 * Return Value:
 * None
 *
 * Example:
 * ["postInit"] call cvo_music_fnc_music;
 * ["leaveBase"] call cvo_music_fnc_music;
 *
 * Public: i guess so?
*/


params [	["_playlist", "", [""]]		];


if (_playlist == "") exitWith {diag_log "[CVO] [MUSIC] - no playlist defined"};

if (_playlist isEqualTo "postInit") exitWith {

	if (isServer) then {CVO_Music_Queue = [];};

	// ############################################################
	// ###### Adds Music Event Handler
	// ############################################################

	if (isServer) then {
		cvo_music_isplaying = false;

		addMusicEventHandler ["MusicStart", { 
			params ["_musicClassname", "_ehId"];
			CVO_Music_isPLaying = true;
			systemChat "[CVO][Music] Start";
		}];

		addMusicEventHandler ["MusicStop", {
			params ["_musicClassname", "_ehId"];
			CVO_Music_isPLaying = false;
			systemChat "[CVO][Music] Stop";
			if (count CVO_Music_Queue > 0) then {
				systemChat "[CVO][Music] Entries in CVO Music Queue";
				[	{["Next"] call cvo_music_fnc_play; }, 
					[], 60 + ceil random 24 * 10] call CBA_fnc_waitAndExecute;
				
			}; 
		}];
	};


	if (hasInterface) then {
		addMusicEventHandler ["MusicStart", { 
			params ["_musicClassname", "_ehId"];
			if (CVO_CBA_musicDisplay) then {
				systemChat format ["[CVO][Music] Now Playing: %1", _musicClassname];
				if (getAudioOptionVolumes#1 < 0.15) then {
					systemChat format ["[CVO][Music] Your Music Volume is low at %1%2", (getAudioOptionVolumes#1 * 100),"%"];
				}; 
			};
		}];
	};



	// ############################################################
	// ###### Adds Zeus Interaction Nodes
	// ############################################################

	// ############################################################
	// ###### Adds Zeus Parent Node
		_action = [
			"cvo_music_zeus_node",
			"CVO Music",
			"\A3\ui_f\data\igui\cfg\simpleTasks\types\m_ca.paa",
			{},
			{true}
			] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

	// ############################################################
	// ###### Adds Zeus Playlist Node
		_action = ["cvo_music_zeus_playlists","Playlists","\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node"], _action] call ace_interact_menu_fnc_addActionToZeus;

	// ############################################################
	// ###### Adds individual Nodes

	// ###### FadeStop
		_action = ["cvo_music_zeus_fadeFade","Fade and Stop current Music","\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
		{	"fadeStop" remoteExecCall ["cvo_music_fnc_play", 2];	},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;

		_action = ["cvo_music_zeus_fadeFadeClear","Fade and Stop and Clear","\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
		{	"fadeStopClear" remoteExecCall ["cvo_music_fnc_play", 2];	},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;



	// ###### Playlists
		_action = ["cvo_music_zeus_pl_leaveBase","Leave Base","\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa",{["leaveBase"] call CVO_Music_fnc_playlist},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;

		_action = ["cvo_music_zeus_pl_tense","Tense","\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa",{["tense"] call CVO_Music_fnc_playlist},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;

		_action = ["cvo_music_zeus_pl_ChorniVoron","ChorniVoron","\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa",{["ChorniVoron"] call CVO_Music_fnc_playlist},{true}] call ace_interact_menu_fnc_createAction;
		[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;


	diag_log ("[CVO] [MUSIC] - Zeus Actions Established");
};


diag_log format ["[CVO] [MUSIC] - playlist: %1", _playlist];

private _song;
private _selection;

_selection = switch (_playlist) do {
	case "leaveBase": {
		[	
			"cvo_music_chorniVoron",
			"AmbientTrack01_F",
			"AmbientTrack01a_F",
			"AmbientTrack01b_F",
			"AmbientTrack03_F",
			"AmbientTrack04_F",
			"LeadTrack02a_F_EPB",
			"LeadTrack03a_F_EPB",
			"EventTrack01_F_EPB",
			"EventTrack01a_F_EPB",
			"EventTrack04_F_EPB",
			"EventTrack04a_F_EPB",
			"AmbientTrack01_F_EPB",
			"BackgroundTrack01_F_EPB",
			"LeadTrack01_F_EPC",
			"LeadTrack06_F_EPC",
			"LeadTrack06b_F_EPC",
			"EventTrack01_F_EPC",
			"BackgroundTrack01_F_EPC",
			"BackgroundTrack02_F_EPC",
			"BackgroundTrack03_F_EPC",
			"BackgroundTrack04_F_EPC",
			"MAD",
			"SkyNet",
			"Wasteland",
			"Defcon",
			"Fallout",
			"LeadTrack02_F_Jets",
			"LeadTrack01_F_Orange",
			"AmbientTrack02_F_Orange",
			"AmbientTrack01_F_Orange",
			"AmbientTrack01_F_EXP",
			"AmbientTrack01a_F_EXP",
			"LeadTrack01_F_Tacops",  
			"LeadTrack02_F_Tacops",
			"LeadTrack03_F_Tacops"
		];
	};
	case "tense": {
		[
			"cvo_RocketTrain",
			"Track11_StageB_stealth",
			"AmbientTrack01b_F",
			"AmbientTrack01a_F",
			"AmbientTrack01_F",
			"Track_O_16",
			"Track_P_03",
			"Track_P_04",
			"Track_P_05",
			"OM_Music02",
			"OM_Music03",
			"Track_O_14",
			"Track_O_13",
			"Track_O_07",	
			"Track_O_05",
			"Track_C_20",
			"Track_C_18",
			"Track_C_15",
			"Track_C_14",
			"Track_C_09",
			"Track_C_08",
			"Track_C_07",
			"Track_C_02",
			"Track_C_01",
			"Music_Freeroam_End",
			"Music_FreeRoam_Battle_Human_Loop",
			"Music_FreeRoam_Battle_Human",
			"Music_FreeRoam_Battle_Alien",
			"Music_FreeRoam_Russian_Theme",
			"Music_FreeRoam_Russian_Theme_Loop",
			"Music_FreeRoam_Tension_Loop_01",
			"Music_FreeRoam_Suspended_Loop_01",
			"Music_Freeroam_RootExtract",
			"Music_Hostile_Drone_Close_01",
			"Music_Roaming_Day_02",
			"Music_Roaming_Day",
			"Music_Roaming_Night_02",
			"Music_Roaming_Night",
			"Music_Probe_Discovered",
			"Music_Credits_Contact",
			"Music_Menu_Contact",
			"AmbientTrack01_F_Tank",
			"AmbientTrack04b_F_Tacops",
			"AmbientTrack04a_F_Tacops",
			"AmbientTrack03b_F_Tacops",
			"AmbientTrack03a_F_Tacops",
			"AmbientTrack02b_F_Tacops",
			"AmbientTrack02a_F_Tacops",
			"AmbientTrack01b_F_Tacops",
			"AmbientTrack01a_F_Tacops"			
		];
	};
	case "ChorniVoron": {
		[
			"cvo_chorniVoron"
		];
	};
}; 

_song = _selection call BIS_fnc_selectRandom;

systemChat format ["Playlist: %2 - Song Selected: %1", _playlist, _song];

_song remoteExecCall ["cvo_music_fnc_play", 2]; 
