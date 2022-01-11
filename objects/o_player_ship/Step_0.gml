friction = friction_value;
image_angle = point_direction(x, y, mouse_x, mouse_y);

var _is_thrusting = 
	mouse_check_button(mb_right) 
	and distance_to_point(mouse_x, mouse_y) > thrust_min_distance
image_index = _is_thrusting;

if _is_thrusting {
	motion_set(image_angle, min(speed + acceleration, max_speed));
	
	var _thrust_deviation = random_range(-4, 4)
	var _x = x + lengthdir_x(thrust_offset, image_angle) + _thrust_deviation;
	var _y = y + lengthdir_y(thrust_offset, image_angle) + _thrust_deviation;
	instance_create_layer(_x, _y, "Effects", o_thrust_particle);
}
