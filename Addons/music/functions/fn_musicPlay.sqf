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
 * ["postInit"] call cvo_fnc_music;
 * ["leaveBase"] call cvo_fnc_music;
 *
 * Public: i guess so?
*/


params [	["_song", "", [""]]];

if (_song == "") exitWith {diag_log "[CVO] [MUSIC] - no song defined"};

