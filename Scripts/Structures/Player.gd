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
	
	func _init(_name: String, _color: Color, _input_code: String) -> void:
		self.name = _name
		self.color = _color
		self.input_code = _input_code
		
		self.spawn_point = SpawnPoint.new(0, 0)
		self.score = 0
		self.is_dead = false
