extends "res://Scripts/Tank.gd"

export var rotate_left_input: String
export var rotate_righ_input: String
export var move_backward_input: String
export var move_forward_input: String
export var shoot_input: String

func _input_rotate() -> int:
	var rotation_direction = 0
	if Input.is_action_pressed(rotate_left_input):
		rotation_direction -= 1
	if Input.is_action_pressed(rotate_righ_input):
		rotation_direction += 1
	return rotation_direction

func _input_move() -> int:
	var move_direction = 0
	if Input.is_action_pressed(move_backward_input):
		move_direction -= 1
	if Input.is_action_pressed(move_forward_input):
		move_direction += 1
	return move_direction

func _input_shoot() -> bool:
	return Input.is_action_pressed(shoot_input)
