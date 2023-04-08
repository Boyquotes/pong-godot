extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var velocity_speed = 10
var velocity = Vector2.ZERO
var object_collision = null
var object_name = null

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y -= 25
	velocity.x += 25
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	object_collision = move_and_collide((velocity * velocity_speed) * delta)
	if object_collision != null:
		velocity_speed += 0.1
		object_name = object_collision.get_collider().name
		var textnumber = null
		
		if(object_collision.get_collider().is_in_group("antiBall")):
			velocity.x *= -1
			velocity.y *= -1
		elif(object_name == "EndSideTop"):
			velocity.y *= -1
		elif((object_name == "EndSideRight")):
			textnumber = get_parent().get_node("Records/Player1").text.to_int()
			textnumber += 1
			get_parent().get_node("Records/Player1").text = String(textnumber);
			
			set_position(Vector2(512, 303))
			velocity.x *= -1
		elif((object_name == "EndSideLeft")):
			textnumber = get_parent().get_node("Records/Player2").text.to_int()
			textnumber += 1
			get_parent().get_node("Records/Player2").text = String(textnumber);
			
			set_position(Vector2(512, 303))
			velocity.x *= -1
		
	pass
