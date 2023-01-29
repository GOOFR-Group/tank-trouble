extends Node2D

## Space between blocks
export var offset = Vector2(70 ,70)

## Background color of the regular blocks
export var block_color :Color

## Background color of the happy path blocks
export var block_color_happy_path :Color

var rng := RandomNumberGenerator.new()

# Scenes
onready var block_scene = preload("res://Prefabs/Map/WallBlock.tscn")

func _ready() -> void:
	rng.randomize()
	
	var num_lines: int = GameManager.MAP_NUM_LINES
	var num_columns: int = GameManager.MAP_NUM_COLUMNS
	
	# Get spawn points
	var spawn_points :Array = []
	for i in len(GameManager.players):
		var player_info :Player.Info = GameManager.players[i]
		var spawn_point :Player.SpawnPoint = player_info.spawn_point
		
		spawn_points.append([spawn_point.line_index, spawn_point.column_index])
	
	# Set up the initial block states (every block starts with an empty state)
	var block_states :Array = []
	for i in num_lines:
		var column_block_states :Array = []
		for j in num_columns:
			column_block_states.append(null)
	
		block_states.append(column_block_states)
	
	# Generate the happy path
	block_states = _generate_happy_path(block_states, spawn_points, num_lines, num_columns)
	
	# Generate the rest of the map
	block_states = _generate_map(block_states, num_lines, num_columns)
	
	# Spawn the blocks
	_spawn_blocks(block_states, num_lines, num_columns)

## Generates a happy path that travels all the given spawn points.
## The path is generated using the graph (theory) search algorithm breadth-first search.
##
## Rules:
## 1. All walls of the block of the happy path are open, except those that represent edges
func _generate_happy_path(block_states :Array, spawn_points :Array, num_lines :int, num_columns :int) -> Array:
	# There needs to be more than 1 point to generate a path
	if len(spawn_points) < 2:
		return block_states
	
	# Initialize the graph of blocks
	var graph :BlockGraph = BlockGraph.new(num_lines, num_columns)
	
	# Get the initial block of the path
	var from_point :Array = spawn_points[0]
	for i in range(1, spawn_points.size()):
		# Get the target block of the path
		var to_point :Array = spawn_points[i]
		
		# Search a path between the two spawn points
		var path :Array = graph._bfs_path(from_point[0], from_point[1], to_point[0], to_point[1])
		for j in len(path):
			var block_vertex :BlockGraphVertex = path[j]
			
			# Declare walls state
			var block_state = BlockState.new(block_color_happy_path, false, false, false, false) 
			
			# Check for edge limitations (rule 1.)
			if block_vertex.column_index == 0:
				block_state.left_wall = true
			
			if block_vertex.line_index == 0:
				block_state.top_wall = true
			
			if block_vertex.column_index == num_columns - 1:
				block_state.right_wall = true
			
			if block_vertex.line_index == num_lines - 1:
				block_state.bottom_wall = true
			
			# Save walls state
			block_states[block_vertex.line_index][block_vertex.column_index] = block_state
		
		# Make the current target block be the next initial block of the path
		from_point = to_point
	
	return block_states

## Generates the game map respecting the following rules
##
## 1. A wall is automatically prevented from being opened when:
## - It corresponds to an edge
## - Its adjacent wall is not opened
## 2. A wall might be open when:
## - Its adjacent wall is opened
func _generate_map(block_states :Array, num_lines :int, num_columns :int) -> Array:
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
func _spawn_blocks(block_states :Array, num_lines :int, num_columns :int) -> void:
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

func _random_open_wall() -> bool:
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

## Defines a graph where each vertex represents an element (i, j) of a matrix
class BlockGraph:
	var num_lines :int
	var num_columns :int
	var vertices :Array
	
	func _init(line_count :int, columns_count :int) -> void:
		self.num_lines = line_count
		self.num_columns = columns_count
		
		# Map each vertex of the graph to a matrix position
		vertices.resize(num_lines)
		for i in num_lines:
			var columns :Array = []
			columns.resize(num_columns)
			
			for j in num_columns:
				columns[j] = BlockGraphVertex.new(i, j)
				
			vertices[i] = columns
		
		# Populate the neighbours of the vertices
		for i in num_lines:
			for j in num_columns:
				var vertex :BlockGraphVertex = vertices[i][j]
				
				# Left neighbour
				if j - 1 >= 0:
					vertex._add_neighbour(vertices[i][j - 1])
					
				# Up neighbour
				if i - 1 >= 0:
					vertex._add_neighbour(vertices[i - 1][j])
				
				# Right neighbour
				if j + 1 <= num_columns - 1:
					vertex._add_neighbour(vertices[i][j + 1])
				
				# Down neighbour
				if i + 1 <= num_lines - 1:
					vertex._add_neighbour(vertices[i + 1][j])
	
	# Returns a path of GraphVertex from the vertex (fromI, fromJ) to (toI, toJ) using the breadth-first search algorithm
	func _bfs_path(fromI :int, fromJ :int, toI :int, toJ :int) -> Array:
		# Return an empty path when the initial vertex is invalid
		if fromI < 0 || fromI >= num_lines || fromJ < 0 || fromJ >= num_columns:
			return []
		
		var paths :Array = []
		var searched_vertices :Array = []
		
		# Append the root of the path
		var root :BlockGraphVertex = vertices[fromI][fromJ] 
		paths.append([root])
		searched_vertices.append(root)
		
		# Perform the BFS
		var target_reached :bool = false
		while true:
			var next_paths :Array = []
			
			for i in len(paths):
				var path :Array = paths[i]
				var vertex :BlockGraphVertex = path.back()
				var neighbours :Array = vertex.neighbours.duplicate()
				
				# Shuffle the neighbours in order to get different paths each time the algorithm runs
				neighbours.shuffle()
				
				for j in len(neighbours):
					var vertex_neighbour :BlockGraphVertex = neighbours[j]
					
					# Ignore already found vertices
					if searched_vertices.has(vertex_neighbour):
						continue
					
					# Flag when the target is reached 
					if vertex_neighbour.line_index == toI && vertex_neighbour.column_index == toJ:
						target_reached = true
					
					# Append the new path
					var new_path :Array = path.duplicate()
					new_path.append(vertex_neighbour)
					
					next_paths.append(new_path)
					
					# Flag the new vertex as searched
					searched_vertices.append(vertex_neighbour)
			
			# Update the current paths 
			paths = next_paths
		
			# Stop searching when the target is reached
			if target_reached:
				break
			
			# Stop searching when every vertex of the graph has already been visited
			if len(searched_vertices) == len(vertices):
				break
		
		# Find the path that contains the target vertex
		for i in len(paths):
			var path :Array = paths[i]
			
			for j in len(path):
				var vertex :BlockGraphVertex = path[j]
				if vertex.line_index == toI && vertex.column_index == toJ:
					return path
		
		# Return an empty path if the target vertex is not found
		return []
		
## Defines a vertex of the block graph
class BlockGraphVertex:
	# Defines the line index of the matrix 
	var line_index :int
	# Defines the column index of the matrix
	var column_index :int
	
	# Defines the adjacent vertices of this element
	var neighbours :Array

	func _init(i :int, j :int) -> void:
		self.line_index = i
		self.column_index = j
	
	func _add_neighbour(neighbour :BlockGraphVertex) -> void:
		self.neighbours.append(neighbour)
