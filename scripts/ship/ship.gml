function ship_rotate() {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
}

function ship_is_thrusting() {
	return mouse_check_button(mb_right) 
	and distance_to_point(mouse_x, mouse_y) > thrust_min_distance;
}

function ship_is_shooting() {
	return mouse_check_button_pressed(mb_left);
}

function ship_move() {
	motion_set(image_angle, min(speed + acceleration, max_speed));
}

function _ship_bullet_create(_side) {
	var _bullet_base_angle = point_direction(x, y, mouse_x, mouse_y);
	var _bullet_offset = 0.5 * _base_ship_get_width();
	
	var _ratio = _side == "right" ? -1 : 1;
	
	var _x = x + lengthdir_x(
		_bullet_offset, _bullet_base_angle + _ratio * bullet_angle
	) + hspeed;
	var _y = y + lengthdir_y(
		_bullet_offset, _bullet_base_angle + _ratio * bullet_angle
	) + vspeed;
	var _bullet = instance_create_layer(_x, _y, "Effects", o_bullet)
	_bullet.image_angle = _bullet_base_angle;
	_bullet.direction = _bullet_base_angle;
	_bullet.speed = bullet_speed;
	
	return _bullet
}

function ship_shoot() {
	_ship_bullet_create("right");
	_ship_bullet_create("left");
}

function ship_thrust() {
	image_index = 1;
	var _thrust_deviation = random_range(-4, 4)
	var _x = x + lengthdir_x(thrust_offset, image_angle) + _thrust_deviation;
	var _y = y + lengthdir_y(thrust_offset, image_angle) + _thrust_deviation;
	instance_create_layer(_x, _y, "Effects", o_thrust_particle);
}

function ship_stop_thrust() {
	image_index = 0;
}

function ship_follow_user_input() {
	ship_rotate();

	var _is_thrusting = ship_is_thrusting();
	var _is_shooting = ship_is_shooting();

	if _is_thrusting {
		ship_move();
		ship_thrust();
	} else {
		ship_stop_thrust();
	}

	if _is_shooting {
		ship_shoot();
	}
}