extends Node2D

## Number of blocks to spawn horizontally
export var num_blocks_horizontal :int =  14

## Number of blocks to spawn vertically
export var num_blocks_vertical :int =  8

## Horizontal space between blocks
export var offset_horizontal :float =  70

## Vertical space between blocks
export var offset_vertical :float =  70

# Scenes
onready var container :Node = $"."
onready var block_scene = preload("res://Prefabs/Map/WallBlock.tscn")

func _ready() -> void:
	for j in num_blocks_vertical:
		for i in num_blocks_horizontal:
			var block_position = container.position
			block_position.x += offset_horizontal * i
			block_position.y += offset_vertical * j
			
			var block = block_scene.instance()
			block.set_position(block_position)
			
			container.add_child(block)
