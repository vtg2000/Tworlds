extends Actor

export var speedh: = 200
func _ready() -> void:
	_velocity = Vector2(speedh,0)


func _physics_process(delta: float) -> void:
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
