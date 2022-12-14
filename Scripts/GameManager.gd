extends Node

signal game_over(playerkilled)

var is_game_over :bool
var debug :bool

func _ready() -> void:
	is_game_over = false
	debug = true

func game_over(player_killed: String) -> void:
	is_game_over = true
	emit_signal("game_over", player_killed)

func restart_game() -> void:
	is_game_over = false
	
	var error = get_tree().reload_current_scene()
	if error != OK:
		push_error("Failed to restart the game.")

func toggle_debug_mode() -> void:
	debug = !debug
