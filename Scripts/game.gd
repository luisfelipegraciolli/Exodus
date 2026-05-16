extends Node
@export var brickScene: PackedScene
@export var brick_size: int = 64
@export var offset_x: int = 8
@export var offset_y: int = 32
@export var rows: int = 8
@export var columns: int = 16
const initial_position: Vector2 =  Vector2 (32, 24)
var brick_position: Vector2 = initial_position

var player_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_bricks()

func get_brick_modulate(row_n: int) -> Color:
	var color: Color
	match row_n:
		0: color = Color("f04f78")
		1: color = Color("a884f3")
		2: color = Color("8fd3ff")
		3: color = Color("8ff8e2")
		4: color = Color("fbff86")
		5: color = Color("fbb954")
		6: color = Color("e83b3b")
		7: color = Color("ffffff")
		_: color = Color("121245")
	return color
func spawn_bricks() -> void:
	for i: int in range(0, rows):
		for j: int in range(0, columns):
			var brick: StaticBody2D = brickScene.instantiate()
			brick.modulate = get_brick_modulate(i)
			brick.position.y = brick_position.y
			brick.position.x = brick_position.x 
			add_child(brick)
			brick_position.x += offset_x + brick_size
		# reset initial x value for next row	
		brick_position.x = initial_position.x
		# Adds brick y value offset to start next row
		brick_position.y += offset_y

func _on_ball_scored() -> void:
	player_score += 1
	print(player_score)
