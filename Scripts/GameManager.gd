extends Node

signal players_spawned()
signal game_over(winner)
signal debug_mode_changed(previous, new)

# Map matrix configuration
const MAP_NUM_LINES: int = 8
const MAP_NUM_COLUMNS: int = 14

# Debug setting
var debug :bool: set = set_debug_mode

## Defines the current state of the game
var is_game_over :bool

## Defines the list of players
var players :Array = []
var current_players :Array = []

func _ready() -> void:
	randomize()
	
	self.is_game_over = false
	self.debug = false

func inform_players_spawned() -> void:
	current_players = players.duplicate()
	emit_signal("players_spawned")

func kill_player(player_killed: String) -> void:
	if len(current_players) <= 1:
		return
	
	for i in len(current_players):
		var player_info: Player.Info = current_players[i]
		if player_info.name == player_killed:
			current_players.remove_at(i)
			break
	
	if len(current_players) > 1:
		return
	
	var player_info :Player.Info = current_players[0]
	player_info.score += 1
	
	is_game_over = true
	emit_signal("game_over", player_info.name)

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

## This function will generate the given number of players with non-repeated random colors and 
## distinct spawn points
func generate_players(number_of_players) -> void:
	players = []
	
	var color_hue_slice: float = 1.0 / number_of_players
	for i in number_of_players:
		var color_hue_from: float = color_hue_slice * i
		var color_hue_to: float = color_hue_slice * (i + 1)
		var color_hue: float = randf_range(color_hue_from, color_hue_to)
		
		var p_color: Color = Color.from_hsv(color_hue, 0.6, 0.6, 1)
		var p_name: String = "Player " + str(i + 1)
		var p_input_code: String = "p" + str(i + 1)
		
		var new_player = Player.Info.new(p_name, p_color, p_input_code)
		players.append(new_player)
