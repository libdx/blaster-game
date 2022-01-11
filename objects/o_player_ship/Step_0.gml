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

