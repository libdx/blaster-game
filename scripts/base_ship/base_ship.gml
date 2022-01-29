function _base_ship_get_width() {
	return sprite_get_width(sprite_index);
}

function _base_ship_get_height() {
	return sprite_get_height(sprite_index);
}

function base_ship_init() {
	// 0 disables sprite animation
	image_speed = 0;

	// set default friction
	friction = friction_value;
}

function base_ship_prevent_room_escape() {
	var _width_offset = 0.5 * _base_ship_get_height();
	var _height_offset = 0.5 * _base_ship_get_width();

	if x < _width_offset or x > room_width - _width_offset {
		x = xprevious
		hspeed = -hspeed * momentum_loss;
	}

	if y < _height_offset or y > room_height - _height_offset {
		y = yprevious
		vspeed = -vspeed * momentum_loss;
	}
}