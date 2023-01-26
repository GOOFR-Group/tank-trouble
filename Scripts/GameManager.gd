extends Node

signal game_over(playerkilled)
signal debug_mode_changed(previous, new)

class Player:
	var name: String
	var color: Color
	var input_code: String
	var isDead: bool
	var score: int
	
	func _init(name: String, color: Color, input_code: String) -> void:
		self.name = name
		self.color = color
		self.input_code = input_code
		self.isDead = false
		self.score = 0

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

## List of players
var players = []

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

## This function will generate the given number of players with non-repeated random colors
func generate_player(number_of_players = 2):
	players = []
	var used_colors = []
	
	for i in range(number_of_players):
		var color = COLOR_SETS[randi() % COLOR_SETS.size()]
		
		while color in used_colors:
			color = COLOR_SETS[randi() % COLOR_SETS.size()]
		used_colors.append(color)
		
		var name = "Player " + str(i + 1)
		var input_code = "p" + str(i + 1)
		var new_player = Player.new(name, color, input_code)
		players.append(new_player)
		
	return players
