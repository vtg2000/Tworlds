extends KinematicBody2D

var _dir : = 0

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if _dir == 0:
		position.x -= 500.0*delta
	else:
		position.y += 500.0*delta

func setDirection(a: int) -> void:
	_dir = 1

func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
