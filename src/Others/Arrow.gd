extends KinematicBody2D

var _dir : = 0

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if _dir == 0:
		position.x -= 500.0*delta
	elif _dir == 1:
		position.y += 500.0*delta
	else:
		position.x += 500.0*delta

func setDirection(a: int) -> void:
	_dir = a

func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
