extends Node2D

const INITIAL_SPAWN_POSITION = Vector2(60, 55)
const SPAWN_OFFSET = Vector2(70, 70)

# Scenes
onready var player_scene: PackedScene = preload("res://Prefabs/Player/Tanks/Player.tscn")

func _ready() -> void:
	# Randomize spawn points
	var spawn_points :Array = []
	for i in GameManager.MAP_NUM_LINES:
		for j in GameManager.MAP_NUM_COLUMNS:
			var point := Player.SpawnPoint.new(i, j) 
			spawn_points.append(point)
	
	spawn_points.shuffle()
	
	# Spawn players
	for i in len(GameManager.players):
		var player_info :Player.Info = GameManager.players[i]
		player_info.spawn_point = spawn_points[i]
		
		var player = player_scene.instance()
		
		var spawn_point :Player.SpawnPoint = player_info.spawn_point 
		var line_index :int = spawn_point.line_index
		var column_index :int = spawn_point.column_index
		
		var map_center :Vector2 = INITIAL_SPAWN_POSITION - (SPAWN_OFFSET / 2)
		map_center += Vector2(SPAWN_OFFSET.x * (GameManager.MAP_NUM_COLUMNS / 2.0), SPAWN_OFFSET.y * (GameManager.MAP_NUM_LINES / 2.0))
		
		player.position = INITIAL_SPAWN_POSITION + Vector2(SPAWN_OFFSET.x * column_index, SPAWN_OFFSET.y * line_index)
		player.rotation = player.position.angle_to_point(map_center) - PI / 2
		player.call_deferred("start", player_info.name, player_info.color, player_info.input_code)
		
		add_child(player)
	
	GameManager.players_spawned()
