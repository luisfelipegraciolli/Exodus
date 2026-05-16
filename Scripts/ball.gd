extends RigidBody2D

@export var velocity_vec: Vector2 = Vector2(250, 250)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction: Vector2 = velocity_vec * delta
	move_and_collide(direction) 
