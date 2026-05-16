extends Node
@export var brickScene: PackedScene
@export var brick_size: int = 64
@export var offset_acum_x: int = 8
@export var offset_acum_y: int = 8
@export var offset: int = 8
@export var offset_y: int = 32
var initial_pos: Vector2 = Vector2 (32, 24)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Spawn bricks

	for i: int in range(0,8):
		for j: int in range(0,16):
			var brick: StaticBody2D = brickScene.instantiate()
			brick.position.y = initial_pos.y
			brick.position.x = initial_pos.x + offset_acum_x
			offset_acum_x += brick_size + offset
			add_child(brick)
		# reset initial x value for next row	
		offset_acum_x = 8
		# Adds brick y value offset to start next row
		initial_pos.y = initial_pos.y + offset_y
