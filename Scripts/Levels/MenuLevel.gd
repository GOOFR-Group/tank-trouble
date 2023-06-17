extends Control

## Player controls
const CONTROLS = [
	"W/A/S/D/Q",
	"Up/Left/Down/Right/Space",
	"I/J/K/L/U",
	"8/4/5/6/7",
]

onready var tanks_grid: GridContainer = $TanksGrid
onready var player_ui_scene: PackedScene = preload("res://UI/PlayerUI.tscn")

func _init() -> void:
	var error := GameManager.connect("debug_mode_changed", self, "_on_debug_mode_changed")
	if error != OK:
		push_error("Menu failed to connect the debug_mode_changed signal.")

func _ready() -> void:
	_show_players(2)
	_update_debug_button(GameManager.debug)

func _update_debug_button(debug_mode :bool):
	var debug_button :Button = $ActionsHBoxContainer/Debug
	
	var text :String = "Debug: OFF"
	if debug_mode:
		text = "Debug: ON "

	debug_button.text = text

func _on_2_players_button_pressed() -> void:
	_show_players(2)

func _on_3_players_button_pressed() -> void:
	_show_players(3)

func _on_4_players_button_pressed() -> void:
	_show_players(4)

func _on_exit_button_pressed():
	get_tree().quit()

func _on_debug_button_pressed() -> void:
	GameManager.toggle_debug_mode()

func _on_start_button_pressed() -> void:
	var error := get_tree().change_scene("res://Levels/MainLevel.tscn")
	if error != OK:
		push_error("PlayerSelection failed to change to MainScene.")

func _on_debug_mode_changed(__ :bool, new :bool) -> void:
	_update_debug_button(new)

func _show_players(num_players: int) -> void:
	# (Re)generate players
	GameManager.generate_players(num_players)
	
	# Remove previous tank representations from the UI 
	for child in tanks_grid.get_children():
		tanks_grid.remove_child(child)
	
	# Show new tank representations in the UI
	for i in range(GameManager.players.size()):
		var player = GameManager.players[i]
		var controls = CONTROLS[i]
		
		var new_player = player_ui_scene.instance()
		new_player.call_deferred("update_player", player.color, controls, player.name)
		tanks_grid.call_deferred("add_child", new_player)
