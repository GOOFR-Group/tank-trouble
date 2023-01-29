class_name Player

## Defines a spawn point on the map matrix
class SpawnPoint:
	var line_index: int
	var column_index: int
	
	func _init(i: int, j: int) -> void:
		self.line_index = i
		self.column_index = j

## Defines the player information
class Info:
	var name: String
	var color: Color
	var input_code: String
	var spawn_point: SpawnPoint
	
	var score: int
	var is_dead: bool
	
	func _init(name: String, color: Color, input_code: String, spawn_point) -> void:
		self.name = name
		self.color = color
		self.input_code = input_code
		self.spawn_point = spawn_point
		
		self.score = 0
		self.is_dead = false
