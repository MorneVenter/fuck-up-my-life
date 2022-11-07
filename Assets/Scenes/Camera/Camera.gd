extends Camera

const CAMERA_TURN_SPEED = 800
const NORMAL_FOV = 60.0
const ZOOM_FOV = 30.0

var goal_fov: float = NORMAL_FOV

func _ready():
	set_process_input(true)

func _process(_delta: float) -> void:
	fov = lerp(fov, goal_fov, 0.05)
	if Input.is_action_pressed("click"):
		goal_fov = ZOOM_FOV
	else:
		goal_fov = NORMAL_FOV

func _look_updown_rotation(rotation = 0):
	var toReturn = self.get_rotation() + Vector3(rotation, 0, 0)
	toReturn.x = clamp(toReturn.x,deg2rad(-25), deg2rad(25))
	return toReturn

func _look_leftright_rotation(rotation = 0):
	var toReturn = self.get_rotation() + Vector3(0, rotation, 0)
	toReturn.y = clamp(toReturn.y, deg2rad(-250), deg2rad(-110))
	return toReturn

func _input(event):
	if not event is InputEventMouseMotion:
		return
	self.set_rotation(_look_leftright_rotation(event.relative.x / -CAMERA_TURN_SPEED))
	self.set_rotation(_look_updown_rotation(event.relative.y / -CAMERA_TURN_SPEED))
