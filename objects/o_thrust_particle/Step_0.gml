if image_alpha > 0 {
	image_alpha -= decay
} else {
	instance_destroy()
}
