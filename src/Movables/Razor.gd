extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var speed = 400.0
onready var parent  = get_node('../CollisionShape2D')
#	print(parent.shape.extents)
	
func _physics_process(delta: float) -> void:
	if parent:
		if parent.shape is RectangleShape2D:
			var bounds = parent.shape.extents
			if position.x > bounds.x or position.x < -bounds.x:
				speed*=-1 
			position.x += speed*delta
