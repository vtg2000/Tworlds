extends Actor


export var stomp_impulse: = 600.0
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

# warning-ignore:unused_argument
func _on_StompDetector_area_entered(area: Area2D) -> void:
	print('yay')
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)


# warning-ignore:unused_argument
func _on_EnemyDetector_body_entered(_body: PhysicsBody2D) -> void:
	die()

#for vtg maybe
func _on_Area2D_area_entered(_area):
	die()
#for me!
func _on_SpikeDetector_area_entered(_area: Area2D) -> void:
	die()

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(
		_velocity, snap, FLOOR_NORMAL, true
	)
	if Input.is_action_just_released("switch"):
#		switch()
		anim_player.play("SwitchAnimation")


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
	)


func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var velocity: = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
	return velocity


# warning-ignore:shadowed_variable
func calculate_stomp_velocity(linear_velocity: Vector2, stomp_impulse: float) -> Vector2:
	var stomp_jump: = -speed.y if Input.is_action_pressed("jump") else -stomp_impulse
	return Vector2(linear_velocity.x, stomp_jump)


func die() -> void:
	queue_free()
	get_tree().reload_current_scene()

func switch() -> void:
	if position.y > 650:
		position.y = 250
	else:
		position.y = 850
