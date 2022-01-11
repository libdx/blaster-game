var _width_offset = 0.5 * sprite_get_height(sprite_index)
var _height_offset = 0.5 * sprite_get_width(sprite_index)

if x < _width_offset or x > room_width - _width_offset {
	x = xprevious
	hspeed = -hspeed * momentum_loss;
}

if y < _height_offset or y > room_height - _height_offset {
	y = yprevious
	vspeed = -vspeed * momentum_loss;
}