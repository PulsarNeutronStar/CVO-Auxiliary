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

	if (hasInterface) then {

		CVO_Music_isPlaying = false;

		addMusicEventHandler ["MusicStart", { 
			params ["_musicClassname", "_ehId"];
			
			CVO_Music_isPLaying = true;
			publicVariableServer "CVO_Music_isPLaying";

			diag_log format ["[CVO][Music][Started] %1", _musicClassname];


			if (CVO_CBA_musicDisplay) then {
				systemChat format ["[CVO][Music] Now Playing: %1", _musicClassname];
				if (getAudioOptionVolumes#1 < 0.05) then {
					systemChat format ["[CVO][Music] Your Music Volume is low - %1%2", floor((getAudioOptionVolumes#1)*1000)/10,"%"];
				}; 
			};
		}];

				addMusicEventHandler ["MusicStop", { 
			params ["_musicClassname", "_ehId"];
			diag_log format ["[CVO][Music][Stopped] %1", _musicClassname];
			
			CVO_Music_isPLaying = false;
			publicVariableServer "CVO_Music_isPLaying";
		}];

	};


	// Uses MusicEventHandler to execute "NEXT" since pubVarEH are not working in non-MP Environment
	if (!isMultiplayer) then
	{
		addMusicEventHandler ["MusicStop", { 
			params ["_musicClassname", "_ehId"];
			// Define Delay and Execute "NEXT" on the server with cba_fnc_waitAndExecute
			private _delay = CVO_CBA_musicDelayMin + (ceil random CVO_CBA_musicDelayRandom);
			diag_log format ["[CVO][Music][MusicStopEH][Next] Delay until Next Song: %1 -- Music Queue: %2", _delay, CVO_Music_Queue];
			[{	["NEXT"] call cvo_music_fnc_play;	}, [], _delay ] call CBA_fnc_waitAndExecute;	
		}
	]
};

// Uses publicVariableEH to execute "NEXT" since musicEH are not working in Headless Environment (Dedicated Server)
	if (isServer && isMultiplayer) then {

		CVO_Music_next_inputFilter = [];
		"CVO_Music_isPLaying" addPublicVariableEventHandler {
			diag_log format ["[CVO][Music][pubVarEH] _this: %1", _this];
			if (_this#1 == false) then {
				// only executes on the first incoming variable change to false
				if (CVO_Music_next_inputFilter pushBack getPlayerUID player == 0) then {
					[ { CVO_Music_next_inputFilter = [];
						diag_log format ["[CVO][Music][pubVarEH][inputFilter]: %1", CVO_Music_next_inputFilter];
					}, [], 10] call CBA_fnc_waitAndExecute;	// Clears the CVO_Music_next_inputFilter variable for the next execution.

					// Define Delay and Execute "NEXT" on the server with cba_fnc_waitAndExecute
					private _delay = CVO_CBA_musicDelayMin + (ceil random CVO_CBA_musicDelayRandom);
					diag_log format ["[CVO][Music][pubVarEH][Next] Delay until Next Song: %1 -- Music Queue: %2", _delay, CVO_Music_Queue];
					[{	["NEXT"] call cvo_music_fnc_play;	}, [], _delay ] call CBA_fnc_waitAndExecute;	
				};
				diag_log format ["[CVO][Music][pubVarEH][inputFilter]: %1", CVO_Music_next_inputFilter];
			};
		};
		diag_log format ["[CVO][Music][pubVarEH]: %1", "applied"];		
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


	diag_log ("[CVO][MUSIC] - Zeus Actions Established");
};


diag_log format ["[CVO][MUSIC] - playlist: %1", _playlist];

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
