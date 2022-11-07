extends Spatial

var main_scene = preload("res://Assets/Scenes/Levels/Apartment/Apartment.tscn")
var start_scene = preload("res://Assets/Scenes/UI/StartScreen.tscn")

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	load_start()

func load_main():
	for child in get_children():
		child.queue_free()
	var new_main = main_scene.instance()
	add_child(new_main)
	new_main.connect("finished", self, "load_start")

func load_start():
	for child in get_children():
		child.queue_free()
	var new_start = start_scene.instance()
	add_child(new_start)
	new_start.connect("start", self, "load_main")
