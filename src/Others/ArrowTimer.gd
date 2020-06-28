extends Timer

var arrow = preload ("res://src/Others/Arrow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_Timer_timeout() -> void:
	var parent = get_node("..")
	print(parent.rotation_degrees)
	var a = arrow.instance()
	a.position = parent.position
	if parent.rotation_degrees <= -90:
		a.rotation_degrees = -90
		a.setDirection(1)
	elif parent.rotation_degrees >=80:
		a.rotation_degrees = 180
		a.setDirection(2)
	call_deferred("add_child", a)
