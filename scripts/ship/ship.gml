function ship_init() {
	// 0 disables sprite animation
	image_speed = 0;

	// set default friction
	friction = friction_value;
}

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

function ship_shoot() {
	var _bullet_angle = point_direction(x, y, mouse_x, mouse_y);
	var _x = x + lengthdir_x(bullet_offset, _bullet_angle)
	var _y = y + lengthdir_y(bullet_offset, _bullet_angle)
	
	bullet = instance_create_layer(_x, _y, "Effects", o_bullet);
	
	bullet.image_angle = _bullet_angle;
	bullet.direction = _bullet_angle;
	bullet.speed = bullet_speed;
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