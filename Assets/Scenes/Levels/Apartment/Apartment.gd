extends Spatial

signal finished()

func _done() -> void:
	emit_signal("finished")
