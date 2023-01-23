extends ColorRect

const CONTROLS = [
	"Up/Left/Down/Right/Space",
	"W/A/S/D/Q",
	"I/J/K/L/U",
	"8/4/5/6/7", # Numeric Keyboard
]

onready var PlayerUI: PackedScene = preload("res://UI/PlayerUI.tscn")

onready var TanksGrid: GridContainer = $TanksGrid

func _ready() -> void:
	hide()
	GameManager.generate_player()
	_show_players()

func _on_back_button_pressed() -> void:
	hide()

func _on_new_color_button_pressed() -> void:
	GameManager.generate_player(GameManager.players.size())
	_show_players()

func _on_start_button_pressed() -> void:
	var error := get_tree().change_scene("res://Scenes/MainScene.tscn")
	if error != OK:
		push_error("Menu failed to change to MainScene.")
	
func _on_2_players_button_pressed() -> void:
	GameManager.generate_player()
	TanksGrid.columns = 2
	_show_players()

func _on_3_players_button_pressed() -> void:
	GameManager.generate_player(3)
	TanksGrid.columns = 3
	_show_players()

func _on_4_players_button_pressed() -> void:
	GameManager.generate_player(4)
	TanksGrid.columns = 2
	_show_players()

func _show_players() -> void:
	remove_all_chils(TanksGrid)
	
	for i in range(GameManager.players.size()):
		var player = GameManager.players[i]
		var controls = CONTROLS[i]
		var name = player.name
		var color = player.color
		
		var new_player = PlayerUI.instance()
		new_player.call_deferred("update_player", color, controls, name)
		TanksGrid.call_deferred("add_child", new_player)

func remove_all_chils(node: Node) -> void:
	for child in node.get_children():
		node.remove_child(child)

