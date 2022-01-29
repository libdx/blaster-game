function _base_enemy_rotate() {
	var _player_ship = instance_find(o_player_ship, 0);
	image_angle = point_direction(x, y, _player_ship.x, _player_ship.y);
}

function _base_enemy_move() {
	motion_set(image_angle, min(speed + acceleration, max_speed));
}

function base_enemy_follow_player() {
	
}