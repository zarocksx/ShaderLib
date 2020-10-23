extends Viewport

var sceneDisplayed = ""
export var scenes : Dictionary = {
	"Interrior_mapping" : "",
	"Fresnel_effect" : ""
}

func _on_Control_pressed(scene):
	var SceneNode
	var scenesName = scenes.keys()
	clean_scene(scene)

	if clean_scene(scene):
		return

	if scenesName.has(scene):
		sceneDisplayed = scene
		SceneNode = scenes[scene]
	else :
		printerr("shader not found")
		return
	var shader = SceneNode.instance()
	add_child(shader)
	pass

func clean_scene(selected_scene):
	for child in get_children():
		if child.get_name() != selected_scene:
			child.free()
		else:
			return true
	return false
