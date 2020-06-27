extends Timer

func _ready() -> void:
	pass # Replace with function body.

var Enemy = preload ("res://src/Movables/Enemy.tscn")

func enemyDied() -> void:
	var parent = get_node("..")
	parent.decreaseCount()

func _on_SpawnTimer_timeout() -> void:
	var parent = get_node("..")
	var e = Enemy.instance()
	var pos = parent.position
	print(pos)
	if randf() > 0.5 and parent.getCount() < 3:
#		print(parent.getCount())
		parent.addCount()
		pos.y-=100
		e.position = pos
		add_child(e)
