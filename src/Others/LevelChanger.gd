extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


func _on_LevelChanger_body_entered(body):
	get_tree().change_scene("res://src/Levels/LevelTemplateV.tscn")
