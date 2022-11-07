extends Control

signal start()

func _start():
	emit_signal("start")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		_start()
