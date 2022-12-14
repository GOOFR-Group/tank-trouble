extends Node2D

## Number of lines to spawn blocks
export var num_lines :int = 8

## Number of columns to spawn blocks
export var num_columns :int = 14

## Space between blocks
export var offset = Vector2(70 ,70)

## Background color of the regular blocks
export var block_color :Color

## Background color of the happy path blocks
export var block_color_happy_path :Color

# Scenes
onready var block_scene = preload("res://Prefabs/Map/WallBlock.tscn")

func _ready() -> void:	
	# Set up the initial block states (every block starts with an empty state)
	var block_states :Array = []
	for i in num_lines:
		var column_block_states :Array = []
		for j in num_columns:
			column_block_states.append(null)
	
		block_states.append(column_block_states)
	
	# Generate the happy path
	block_states = _generate_happy_path(block_states)
	
	# Generate the rest of the map
	block_states = _generate_map(block_states)
	
	# Spawn the blocks
	_spawn_blocks(block_states)

## Generates a happy path from (0, 0) to (num_lines - 1, num_columns - 1)
##
## Algorithm:
## 1. Start at (0, 0)
## 2. While not reaching (num_lines - 1, num_columns - 1) choose the next block of the path
## 3. To decide the next block of the path, "move" left, up, right or down from the current block
##
## Rules:
## 1. All walls of the block of the happy path are open, except those that represent edges
## 2. A block cannot move in the opposite direction of the previous step
func _generate_happy_path(block_states :Array) -> Array:
	var i :int = 0
	var j :int = 0
	var previousDirection := Vector2.ZERO
	
	while true:
		# Declare possible directions to move next
		var possible_directions :Array = [
			# Vector2.LEFT, NOTE: given the current spawn point of the tanks, avoiding going left creates more diverse maps
			Vector2.UP,
			Vector2.RIGHT,
			Vector2.DOWN,
		]
		
		# Remove opposite direction of the previous step (rule 2.)
		possible_directions.erase(-previousDirection)
		
		# Declare walls state
		var block_state = BlockState.new(block_color_happy_path, false, false, false, false) 
		
		# Check for edge limitations (rule 1.)
		if j == 0:
			possible_directions.erase(Vector2.LEFT)
			block_state.left_wall = true
		
		if i == 0:
			possible_directions.erase(Vector2.UP)
			block_state.top_wall = true
		
		if j == num_columns - 1:
			possible_directions.erase(Vector2.RIGHT)
			block_state.right_wall = true
		
		if i == num_lines - 1:
			possible_directions.erase(Vector2.DOWN)
			block_state.bottom_wall = true
		
		# Save walls state
		block_states[i][j] = block_state
		
		# Break out of the loop if the destination is reached
		if i == num_lines - 1 && j == num_columns - 1:
			break
		
		# Choose next block of the path
		var nextDirection :Vector2 = _random_direction(possible_directions)
		match nextDirection:
			Vector2.LEFT:
				j -= 1
			Vector2.UP:
				i -= 1
			Vector2.RIGHT:
				j += 1
			Vector2.DOWN:
				i += 1
			_:
				break
		
		previousDirection = nextDirection
	
	return block_states

## Generates the game map respecting the following rules
##
## 1. A wall is automatically prevented from being opened when:
## - It corresponds to an edge
## - Its adjacent wall is not opened
## 2. A wall might be open when:
## - Its adjacent wall is opened
func _generate_map(block_states :Array) -> Array:
	for i in num_lines:
		for j in num_columns:
			# Avoid modifying already defined blocks
			if block_states[i][j] != null:
				continue
			
			# Declare walls state
			var block_state = BlockState.new(block_color, false, false, false, false) 
			
			# Check for wall limitations (rule 1.)
			if j == 0:
				block_state.left_wall = true
			else:
				var adjacent_block_state :BlockState = block_states[i][j - 1]
				if adjacent_block_state != null:
					block_state.left_wall = adjacent_block_state.right_wall
			
			if i == 0:
				block_state.top_wall = true
			else:
				var adjacent_block_state :BlockState = block_states[i - 1][j]
				if adjacent_block_state != null:
					block_state.top_wall = adjacent_block_state.bottom_wall
			
			if j == num_columns - 1:
				block_state.right_wall = true
			else:
				var adjacent_block_state :BlockState = block_states[i][j + 1]
				if adjacent_block_state != null:
					block_state.right_wall = adjacent_block_state.left_wall
			
			if i == num_lines - 1:
				block_state.bottom_wall = true
			else:
				var adjacent_block_state :BlockState = block_states[i + 1][j]
				if adjacent_block_state != null:
					block_state.bottom_wall = adjacent_block_state.top_wall
			
			# Define open walls (rule 2.)
			if block_state.left_wall == false:
				block_state.left_wall = _random_open_wall()
			
			if block_state.top_wall == false:
				block_state.top_wall = _random_open_wall()
			
			if block_state.right_wall == false:
				block_state.right_wall = _random_open_wall()
			
			if block_state.bottom_wall == false:
				block_state.bottom_wall = _random_open_wall()
			
			# Save walls state
			block_states[i][j] = block_state
	
	return block_states

## Spawns the blocks respecting their wall states
func _spawn_blocks(block_states :Array) -> void:
	for i in num_lines:
		for j in num_columns:
			# Instantiate block
			var block = block_scene.instance()
			
			# Set block position
			var block_position := Vector2(offset.x * j, offset.y * i)
			block.set_position(block_position)
			
			# Set walls state
			var block_state :BlockState = block_states[i][j]
			
			block.setup()
			block.change_background_color(block_state.color)
			block.enable_left_wall(block_state.left_wall)
			block.enable_top_wall(block_state.top_wall)
			block.enable_right_wall(block_state.right_wall)
			block.enable_bottom_wall(block_state.bottom_wall)
			
			# Add block to container
			add_child(block)

func _random_direction(possible_directions :Array) -> Vector2:
	if possible_directions.empty():
		return Vector2.ZERO
	
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	
	var index :int = rng.randi_range(0, possible_directions.size()-1)
	var direction :Vector2 = possible_directions[index]
	if direction == null:
		return Vector2.ZERO
	
	return direction
	
func _random_open_wall() -> bool:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	
	# 0   = !(false)
	# > 0 = !(true)
	return !(rng.randi_range(0, 3))

## Defines the state of the walls of a block
## A wall can be enabled (closed) or disabled (opened)
class BlockState:
	var color :Color
	var left_wall :bool
	var top_wall :bool
	var right_wall :bool
	var bottom_wall :bool
	
	func _init(background_color :Color, enable_left_wall :bool, enable_top_wall :bool, enable_right_wall :bool, enable_bottom_wall :bool):
		self.color = background_color
		self.left_wall = enable_left_wall
		self.top_wall = enable_top_wall
		self.right_wall = enable_right_wall
		self.bottom_wall = enable_bottom_wall
	
	func _to_string() -> String:
		return "{color: %s, left_wall: %s, top_wall: %s, right_wall: %s, bottom_wall: %s}" %[color, left_wall, top_wall, right_wall, bottom_wall]
