extends Node2D

onready var Player: PackedScene = preload("res://Prefabs/Player/Tanks/Player.tscn")

const OFFSET = Vector2(70, 70)

func _ready() -> void:
	for i in range(GameManager.players.size()):
		var p = GameManager.players[i]
		var new_player = Player.instance()
		
		new_player.call_deferred("start", p.name, p.color, p.input_code)
		new_player.position = Vector2(OFFSET.x*(i+1), OFFSET.y*(i+1))
		
		add_child(new_player)
