extends Node2D

## Number of lines to spawn blocks
export var num_lines :int = 8

## Number of columns to spawn blocks
export var num_columns :int = 14

## Space between blocks
export var offset = Vector2(70 ,70)

var randomNumberGenerator :RandomNumberGenerator

# Scenes
onready var block_scene = preload("res://Prefabs/Map/WallBlock.tscn")


func _ready() -> void:
	# Set up random number generator
	randomNumberGenerator = RandomNumberGenerator.new()
	randomNumberGenerator.randomize()
	
	var block_walls_state :Dictionary = {}
	
	for i in num_lines:
		for j in num_columns:
			var block = block_scene.instance()
			
			# Set block position
			var block_position := Vector2(offset.x * j, offset.y * i)
			block.set_position(block_position)
			
			# Declare walls state
			var block_state = BlockState.new(false, false, false, false) 
			
			# Check possible wall state limitations
			# A wall is automatically prevented from being opened when:
			# - It corresponds to an edge
			# - Its adjacent wall is not opened
			if j == 0:
				block_state.left_wall = true
			else:
				var adjacent_walls_state :Dictionary = block_walls_state[i]
				if adjacent_walls_state != null:
					var adjacent_block_state :BlockState = adjacent_walls_state[j - 1]
					if adjacent_block_state != null:
						block_state.left_wall = adjacent_block_state.right_wall
			
			if i == 0:
				block_state.top_wall = true
			else:
				var adjacent_walls_state :Dictionary = block_walls_state[i - 1]
				if adjacent_walls_state != null:
					var adjacent_block_state :BlockState = adjacent_walls_state[j]
					if adjacent_block_state != null:
						block_state.top_wall = adjacent_block_state.bottom_wall
			
			if j == num_columns - 1:
				block_state.right_wall = true
			
			if i == num_lines - 1:
				block_state.bottom_wall = true
			
			# Define open wall
			var rn = randomNumberGenerator.randi_range(0, 3)
			if rn == 0:
				block_state.right_wall = true
			elif rn == 1:
				block_state.bottom_wall = true
			
			
			# Set walls state
			block.setup()
			block.enable_left_wall(block_state.left_wall)
			block.enable_top_wall(block_state.top_wall)
			block.enable_right_wall(block_state.right_wall)
			block.enable_bottom_wall(block_state.bottom_wall)
			
			# Add block to container
			add_child(block)
			
			# Add walls state to dictionary
			var horizontal_walls_state :Dictionary = {}
			if i in block_walls_state:
				horizontal_walls_state = block_walls_state[i]
			
			horizontal_walls_state[j] = block_state
			block_walls_state[i] = horizontal_walls_state

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
