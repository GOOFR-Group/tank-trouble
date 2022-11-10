extends "res://Scripts/Tank.gd"

func _input_rotate() -> float:
	var rotation_direction = 0
	if Input.is_action_pressed("p2_rotate_left"):
		rotation_direction -= 1
	if Input.is_action_pressed("p2_rotate_right"):
		rotation_direction += 1
	return rotation_direction

func _input_move() -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("p2_move_forward"):
		velocity = Vector2(speed, 0)
	if Input.is_action_pressed("p2_move_backwards"):
		velocity = Vector2(-speed / 2, 0)
