extends MeshInstance

var speed = PI/900;
var directionClockwise = -1
func _ready():
	pass

func _physics_process(delta):
	rotate_y(speed * directionClockwise);