function _base_enemy_rotate() {
	var _player_ship = instance_find(o_player_ship, 0);
	if _player_ship == noone return;
	
	image_angle = point_direction(x, y, _player_ship.x, _player_ship.y);
}

function _base_enemy_move() {
	motion_add(image_angle, acceleration);
	speed = min(speed, max_speed);
}

function base_enemy_follow_player() {
	_base_enemy_rotate();
	_base_enemy_move();
}

function base_enemy_debounce(_other) {
	var _debounce_direction = point_direction(_other.x, _other.y, x, y);
	motion_add(_debounce_direction, acceleration);
}

function base_enemy_hit(_demage) {
	armor -= _demage;
	if armor <= 0 {
		instance_destroy();
	}
}