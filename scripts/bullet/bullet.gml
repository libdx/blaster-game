function bullet_effect_create() {
	var _effect = instance_create_layer(x + hspeed, y + vspeed, "Effects", o_thrust_particle);
	_effect.image_xscale = 0.5;
	_effect.image_yscale = 0.5;
}

function bullet_hit() {
	instance_destroy();
}