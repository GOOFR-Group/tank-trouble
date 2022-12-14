extends Node

signal game_over(playerkilled)
signal debug_mode_changed(previous, new)

var debug :bool setget set_debug_mode

var is_game_over :bool

func _ready() -> void:
	self.is_game_over = false
	self.debug = false
	
func game_over(player_killed: String) -> void:
	is_game_over = true
	emit_signal("game_over", player_killed)

func restart_game() -> void:
	is_game_over = false
	
	var error = get_tree().reload_current_scene()
	if error != OK:
		push_error("Failed to restart the game.")

func toggle_debug_mode() -> void:
	self.debug = !debug
	
func set_debug_mode(value :bool) -> void:
	debug = value
	emit_signal("debug_mode_changed", !debug, debug)
