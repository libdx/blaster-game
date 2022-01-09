friction = friction_value
image_angle = point_direction(x, y, mouse_x, mouse_y)

var _is_thrusting = mouse_check_button(mb_right)
image_index = _is_thrusting

if _is_thrusting {
	motion_set(image_angle, max(speed, max_speed))
}

