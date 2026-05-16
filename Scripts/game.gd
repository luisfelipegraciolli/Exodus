extends Node
@export var brickScene: PackedScene
@export var brick_size: int = 64
@export var offset_x: int = 8
@export var offset_y: int = 32
@export var rows: int = 8
@export var columns: int = 16
const initial_position: Vector2 =  Vector2 (32, 24)
var brick_position: Vector2 = initial_position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Spawn bricks
	
	for i: int in range(0, rows):
		for j: int in range(0, columns):
			var brick: StaticBody2D = brickScene.instantiate()
			brick.position.y = brick_position.y
			brick.position.x = brick_position.x 
			add_child(brick)
			brick_position.x += offset_x + brick_size
		# reset initial x value for next row	
		brick_position.x = initial_position.x
		# Adds brick y value offset to start next row
		brick_position.y += offset_y
