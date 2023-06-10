extends "res://Prefabs/Player/Tanks/Tank.gd"

var left: String
var right: String
var backwards: String
var forward: String
var shoot: String

func start(name: String, color: Color, input_code: String) -> void:
	playerName = name
	$Sprite.modulate = color
	
	left = input_code + "_rotate_left"
	right = input_code + "_rotate_right"
	backwards = input_code + "_move_backwards"
	forward = input_code + "_move_forward"
	shoot = input_code + "_shoot"

func _input_rotate() -> int:
	return int(Input.get_axis(left, right))

func _input_move() -> int:
	return int(Input.get_axis(backwards, forward))

func _input_shoot() -> bool:
	return Input.is_action_pressed(shoot)
