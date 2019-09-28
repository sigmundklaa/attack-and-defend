/**
 * @Function: core::game::selectZone
 * @Description: Selects the zone for the next round
 *
 * :param object _self: Instance of the game class
 * :param string _zone: Selected zone
 */

params [["_self", objNull, [objNull]], ["_zone", "", [""]]];

_self setVariable ["zone", _zone];