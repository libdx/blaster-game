event_inherited();
image_angle = random(360);

repeat (16) {
	instance_create_layer(
		x + random_range(-8, 8),
		y + random_range(-8, 8),
		"Effects",
		o_composite_explosion
	);
}

