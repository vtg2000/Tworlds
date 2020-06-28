extends Node2D

onready var anim_player = get_node("AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_FallArea_area_entered(_area: Area2D) -> void:
	print('player enterd')
	anim_player.play("FallDown")
