extends Timer

func _ready() -> void:
	pass # Replace with function body.

var Enemy = preload ("res://src/Movables/Enemy.tscn")

func _on_Spawner_timeout() -> void:
	var player = get_node("../Player")
	var e = Enemy.instance()
	var pos = player.position
	if randf() > 0.5:
		pos.x += rand_range(2000.0, 2100.0)

	e.position = pos
	add_child(e)
