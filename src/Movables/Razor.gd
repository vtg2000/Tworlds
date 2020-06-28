extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var speed = 200.0
onready var parent  = get_node('../CollisionShape2D')
#	print(parent.shape.extents)
onready var bounds = parent.shape.extents

func _physics_process(delta: float) -> void:
#	var parent  = get_node('../CollisionShape2D')
	print(get_node('..').position, position)
	if position.x > bounds.x or position.x < -bounds.x:
		speed*=-1 
	position.x += speed*delta
	pass
