extends Area2D

var _count = 0

onready var timer: Timer = get_node("SpawnTimer")
var _enemy = preload ("res://src/Movables/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.set_paused(true)

func addCount() -> void:
	_count+=1

func decreaseCount() -> void:
	_count-=1

func getCount() -> int:
	return _count


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_VisibilityEnabler2D_screen_entered() -> void:
	timer.set_paused(false)


func _on_VisibilityEnabler2D_screen_exited() -> void:
	timer.set_paused(true)
