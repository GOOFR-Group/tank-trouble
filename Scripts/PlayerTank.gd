extends "res://Scripts/Tank.gd"

export var input_code: String

onready var left = input_code + "_rotate_left"
onready var right = input_code + "_rotate_right"
onready var backwards = input_code + "_move_backwards"
onready var forward = input_code + "_move_forward"
onready var shoot = input_code + "_shoot"

func _input_rotate() -> int:
	return int(Input.get_axis(left, right))

func _input_move() -> int:
	return int(Input.get_axis(backwards, forward))

func _input_shoot() -> bool:
	return Input.is_action_pressed(shoot)
