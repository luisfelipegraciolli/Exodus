extends RigidBody2D

@export var velocity: Vector2 = Vector2(250, 250)
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
