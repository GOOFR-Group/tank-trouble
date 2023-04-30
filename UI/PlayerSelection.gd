extends ColorRect

## This is just the text to show the player in the label
const CONTROLS = [
	"W/A/S/D/Q",
	"Up/Left/Down/Right/Space",
	"I/J/K/L/U",
	"8/4/5/6/7", # Numeric Keyboard
]

@onready var PlayerUI: PackedScene = preload("res://UI/PlayerUI.tscn")

@onready var TanksGrid: GridContainer = $TanksGrid

func _ready() -> void:
	hide()
	
	_show_players(2, 2)

func _on_back_button_pressed() -> void:
	hide()

func _on_start_button_pressed() -> void:
	var error := get_tree().change_scene_to_file("res://Levels/MainLevel.tscn")
	if error != OK:
		push_error("PlayerSelection failed to change to MainScene.")
	
func _on_2_players_button_pressed() -> void:
	_show_players(2, 2)

func _on_3_players_button_pressed() -> void:
	_show_players(3, 3)

func _on_4_players_button_pressed() -> void:
	_show_players(4, 2)

func _show_players(num_players: int, num_columns: int) -> void:
	# (Re)generate players
	GameManager.generate_players(num_players)
	
	# Update the number of columns of the grid
	TanksGrid.columns = num_columns
	
	# Remove previous tank representations from the UI 
	for child in TanksGrid.get_children():
		TanksGrid.remove_child(child)
	
	# Show new tank representations in the UI
	for i in range(GameManager.players.size()):
		var player = GameManager.players[i]
		var controls = CONTROLS[i]
		
		var new_player = PlayerUI.instantiate()
		new_player.call_deferred("update_player", player.color, controls, player.name)
		TanksGrid.call_deferred("add_child", new_player)
