tool
extends MeshInstance

func _process(_delta):
	if Engine.editor_hint:
		self.rotate(Vector3.UP,0.001)

	if not Engine.editor_hint:
		self.rotate(Vector3.UP,0.003)
