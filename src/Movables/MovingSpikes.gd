extends Actor

func _ready() -> void:
	_velocity = Vector2(200,0)


func _physics_process(delta: float) -> void:
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
