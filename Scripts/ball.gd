extends RigidBody2D

@export var velocity: Vector2 = Vector2(200, -250)
@export var max_velocity: Vector2 = Vector2(1000, 1000)
signal scored
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction: Vector2 = velocity * delta
	var colision_info: KinematicCollision2D = move_and_collide(direction) 
	if colision_info: 
		velocity = velocity.bounce(colision_info.get_normal())
		var collider: Object = colision_info.get_collider()
		print(collider)
		if collider is Brick:
			collider.queue_free()
			scored.emit()
			# 5% increase on each new brick
			if velocity < max_velocity:
				velocity = velocity * 1.05
