extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var velocity_speed = 10
var velocity = Vector2.ZERO
var object_collision = null

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y -= 30
	velocity.x += 30
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	object_collision = move_and_collide((velocity * velocity_speed) * delta)
	if object_collision != null:
		velocity_speed += 0.1
		
		if((object_collision.get_collider().name == "EndSideDown") or (object_collision.get_collider().name == "EndSideUp")):
			velocity.y *= -1
		elif((object_collision.get_collider().name == "EndSideRight") or (object_collision.get_collider().name == "EndSideLeft")):
			velocity.x *= -1
		elif(object_collision.get_collider().is_in_group("antiBall")):
			velocity.x *= -1
			velocity.y *= -1
		
	pass
