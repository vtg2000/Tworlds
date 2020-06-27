extends KinematicBody2D

var arrow = preload ("res://src/Others/Arrow.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_Timer_timeout() -> void:
	pass
	
#	print('arrowing')
#	var a = arrow.instance()
#	a.position = position
#	print(a.position)
#	call_deferred("add_child", a)
#	add_child(a)
