extends Node2D

# Node references
var _left_wall :StaticBody2D
var _top_wall :StaticBody2D
var _right_wall :StaticBody2D
var _bottom_wall :StaticBody2D

## Starts the script to get all the necessary references  
func setup() -> void:
	_left_wall = $Left
	_top_wall = $Top
	_right_wall = $Right
	_bottom_wall = $Bottom

## Enables or disables the left wall
func enable_left_wall(enable :bool) -> void:
	_enable_wall(_left_wall, enable)
	
## Enables or disables the top wall
func enable_top_wall(enable :bool) -> void:
	_enable_wall(_top_wall, enable)
	
## Enables or disables the right wall
func enable_right_wall(enable :bool) -> void:
	_enable_wall(_right_wall, enable)
	
## Enables or disables the bottom wall
func enable_bottom_wall(enable :bool) -> void:
	_enable_wall(_bottom_wall, enable)

## Enables or disables the given wall
func _enable_wall(wall :Node2D, enable :bool) -> void:
	wall.visible = enable
	
	var collision_shape :CollisionShape2D = wall.get_node("CollisionShape2D")
	if collision_shape != null:
		collision_shape.disabled = !enable
