/// @description Insert description here
// You can write your code in this editor
var _entity = instance_place(x, y, obj_player);
var _break = false;

with (_entity) {
	if (_entity != noone) {
	HurtPlayer(direction - 180, 32, 30);
	_break = true;
	}
	if (_break = true) {
		instance_destroy(obj_fireball);
	}
}

var _cam = view_camera[0];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);
if (!point_in_rectangle(x, y, _camX, _camY, _camX + camera_get_view_width(_cam), _camY + camera_get_view_height(_cam))) {
	instance_destroy();
}