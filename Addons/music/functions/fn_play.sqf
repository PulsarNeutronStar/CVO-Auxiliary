/* WIP
 * Author: Zorn
 * Plays music if the queue is empty, if not, it will be put the track into the queue
 *
 * Arguments:
 * 0: classname of music
 * 1: Name of queue Variable
 *
 * Return Value:
 * None
 *
 * Example:
 * ["NEXT"] call cvo_music_fnc_play;
 * ["cvo_music_"] call cvo_music_fnc_play;
 *
 * Public: i guess so?
*/


params [	["_song", "", [""]]];


if (!isServer) exitWith {	_this remoteExec ["cvo_music_fnc_play", 2]	};

if (_song == "NEXT") then {
	if (count CVO_Music_Queue > 0) then {
		_song = CVO_Music_Queue deleteAt 0;
		systemChat format ["Song from Queue selected: %1", _song];
		systemChat format ["new CVO Music Queue Array: %1", CVO_MUSIC_Queue];
	} else {
		_song = "";
		systemChat format ["NEXT not possible - Queue is Empty: %1", CVO_MUSIC_Queue];
	};
};

if (_song == "") exitWith {	diag_log "[CVO] [MUSIC] - no song defined"	};

// Plays the song on all clients

if (CVO_Music_isPLaying) then {
	CVO_Music_Quene pushBack _song;
	systemChat format ["Currently Playing a Song, new Entry: %2 added to CVO Music Queue Array: %1", CVO_MUSIC_Queue, _song];
} else {
	_song remoteExec ["playMusic"];
	systemChat format ["Now Playing Song: %2 - Music Queue Array: %1", CVO_MUSIC_Queue, _song];
};

