extends Camera3D

export(NodePath) var target_path
var target

var distance = 10.0
var rotation = Vector2()

func _ready():
	if target_path:
		target = get_node('../Paper')
	else:
		print("Необходимо установить 'target_path' в инспекторе для камеры.")

func _process(delta: float):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		var mouse_motion = Input.get_last_mouse_motion()
		rotation.x -= mouse_motion.y * 0.01
		rotation.y -= mouse_motion.x * 0.01
		rotation.x = clamp(rotation.x, -PI/2, PI/2)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if target:
		var x = distance * cos(rotation.x) * sin(rotation.y)
		var y = distance * sin(rotation.x)
		var z = distance * cos(rotation.x) * cos(rotation.y)
		global_transform.origin = target.global_transform.origin + Vector3(x, y, z)
		look_at(target.global_transform.origin, Vector3.UP)
