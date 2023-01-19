extends Node

signal game_over(playerkilled)
signal debug_mode_changed(previous, new)

var debug :bool setget set_debug_mode

var is_game_over :bool

var COLOR_SETS :PoolColorArray = [
	Color(0,0,0,1), # Black
	Color(1,0,0,1), # Red
	Color(0,1,0,1), # Green
	Color(0,0,1,1), # Blue
	Color(1,1,0,1), # Yellow
	Color(0,1,1,1), # Cyan
	Color(1,0,1,1), # Magenta
	Color(1,1,1,1), # White
]
var players_colors :PoolColorArray = []

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
	
func generate_player_colors(number_of_players = 2) -> PoolColorArray:
	players_colors = []
	
	for i in range(number_of_players):
		var color = COLOR_SETS[randi() % COLOR_SETS.size()]
		
		while color in players_colors:
			color = COLOR_SETS[randi() % COLOR_SETS.size()]
			
		players_colors.append(color)
		
	return players_colors
