function enemy_two_is_nearby_player() {
	var _player_ship = instance_find(o_player_ship, 0);
	var _distance_to_player = distance_to_object(_player_ship);
	return _distance_to_player <= attack_range;
}

function enemy_two_shoot() {
	var _player_ship = instance_find(o_player_ship, 0);
	if _player_ship == noone return;
	
	var _bullet_base_angle = point_direction(x, y, _player_ship.x, _player_ship.y);
	var _bullet_offset = 0.5 * _base_ship_get_width();
	
	var _x = x + lengthdir_x(
		_bullet_offset, _bullet_base_angle
	) + hspeed;
	var _y = y + lengthdir_y(
		_bullet_offset, _bullet_base_angle
	) + vspeed;
	var _bullet = instance_create_layer(_x, _y, "Effects", o_enemy_bullet)
	_bullet.image_angle = _bullet_base_angle;
	_bullet.direction = _bullet_base_angle;
	_bullet.speed = bullet_speed;
	
	return _bullet
}