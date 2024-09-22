extends MeshInstance3D

var rotating = false
var last_mouse_position = Vector2()


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			rotating = event.pressed
			last_mouse_position = event.position
	elif event is InputEventMouseMotion and rotating:
		var delta = event.position - last_mouse_position
		rotate_object_local(Vector3.UP, -delta.x * 0.01)
		rotate_object_local(Vector3.RIGHT, -delta.y * 0.01)
		last_mouse_position = event.position

		# Ограничение угла поворота по оси X
		var rot_deg = rotation_degrees
		rot_deg.x = clamp(rot_deg.x, -90, 90)
		rotation_degrees = rot_deg
