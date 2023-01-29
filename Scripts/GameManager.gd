extends Node

signal game_over(playerkilled)
signal debug_mode_changed(previous, new)

# Map matrix configuration
const MAP_NUM_LINES: int = 8
const MAP_NUM_COLUMNS: int = 14

# Debug setting
var debug :bool setget set_debug_mode

## Defines the current state of the game
var is_game_over :bool

## Defines the list of players
var players :Array = []

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

## This function will generate the given number of players with non-repeated random colors and 
## distinct spawn points
func generate_players(number_of_players) -> void:
	players = []
	
	var spawn_points :Array = []
	for i in MAP_NUM_LINES:
		for j in MAP_NUM_COLUMNS:
			var point := Player.SpawnPoint.new(i, j) 
			spawn_points.append(point)
	
	spawn_points.shuffle()
	
	var color_hue_slice: float = 1.0 / number_of_players
	for i in number_of_players:
		var color_hue_from: float = color_hue_slice * i
		var color_hue_to: float = color_hue_slice * (i + 1)
		var color_hue: float = rand_range(color_hue_from, color_hue_to)
		
		var color: Color = Color.from_hsv(color_hue, 0.6, 0.6, 1)
		var name: String = "Player " + str(i + 1)
		var input_code: String = "p" + str(i + 1)
		var spawn_point: Player.SpawnPoint = spawn_points[i]
		
		var new_player = Player.Info.new(name, color, input_code, spawn_point)
		players.append(new_player)
