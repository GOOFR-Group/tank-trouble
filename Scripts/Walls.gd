extends Node2D

## Number of lines to spawn blocks
export var num_lines :int = 8

## Number of columns to spawn blocks
export var num_columns :int = 14

## Space between blocks
export var offset = Vector2(70 ,70)

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

## Generates a happy path
func _generate_happy_path(block_states :Array) -> Array:
	return block_states
	
	var i :int = 0
	var j :int = 0
	while i < num_lines && j < num_columns:
		continue
		# Declare walls state
		var block_state = BlockState.new(false, false, false, false) 
		
		# Check for edge limitations
		if j == 0:
			block_state.left_wall = true
		
		if i == 0:
			block_state.top_wall = true
		
		if j == num_columns - 1:
			block_state.right_wall = true
		
		if i == num_lines - 1:
			block_state.bottom_wall = true
		
		# Save walls state
		block_states[i][j] = block_state
	
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
			var block_state = BlockState.new(false, false, false, false) 
			
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
			block.enable_left_wall(block_state.left_wall)
			block.enable_top_wall(block_state.top_wall)
			block.enable_right_wall(block_state.right_wall)
			block.enable_bottom_wall(block_state.bottom_wall)
			
			# Add block to container
			add_child(block)

func _random_open_wall() -> bool:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	# 0   = !(false)
	# > 0 = !(true)
	return !(rng.randi_range(0, 5))

## Defines the state of the walls of a block
## A wall can be enabled (closed) or disabled (opened)
class BlockState: 
	var left_wall :bool
	var top_wall :bool
	var right_wall :bool
	var bottom_wall :bool
	
	func _init(enable_left_wall :bool, enable_top_wall :bool, enable_right_wall :bool, enable_bottom_wall :bool):
		self.left_wall = enable_left_wall
		self.top_wall = enable_top_wall
		self.right_wall = enable_right_wall
		self.bottom_wall = enable_bottom_wall
	
	func _to_string() -> String:
		return "{left_wall: %s, top_wall: %s, right_wall: %s, bottom_wall: %s}" %[left_wall, top_wall, right_wall, bottom_wall]
