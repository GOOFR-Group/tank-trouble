extends "res://Scripts/Player/Tank.gd"

var left: String
var right: String
var backwards: String
var forward: String
var shoot: String

func start(_name: String, _color: Color, _input_code: String) -> void:
	playerName = _name
	$Sprite.modulate = _color
	
	left = _input_code + "_rotate_left"
	right = _input_code + "_rotate_right"
	backwards = _input_code + "_move_backwards"
	forward = _input_code + "_move_forward"
	shoot = _input_code + "_shoot"

func _input_rotate() -> int:
	return int(Input.get_axis(left, right))

func _input_move() -> int:
	return int(Input.get_axis(backwards, forward))

func _input_shoot() -> bool:
	return Input.is_action_pressed(shoot)
