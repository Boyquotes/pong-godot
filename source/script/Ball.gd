extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var velocity_speed = 4
var velocity = Vector2.ZERO
var object_collision = null
var object_name = null

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y -= 40
	velocity.x += 30
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	object_collision = move_and_collide((velocity * velocity_speed) * delta)
	if object_collision != null:
		
		if velocity.x > 0:
			velocity.x += (randi() % 5) + 1
		elif velocity.x < 0:
			velocity.x -= (randi() % 5) + 1
		
		if velocity.y > 0:
			velocity.y += (randi() % 5) + 1
		elif velocity.y < 0:
			velocity.y -= (randi() % 5) + 1
			
		if velocity.x >= 100:
			velocity.x /= (randi() % 5) + 1
		if velocity.y >= 100:
			velocity.y /= (randi() % 5) + 1
		
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
			
			velocity.x *= -1
		elif((object_name == "EndSideLeft")):
			textnumber = get_parent().get_node("Records/Player2").text.to_int()
			textnumber += 1
			get_parent().get_node("Records/Player2").text = String(textnumber);
			
			velocity.x *= -1
		
	pass
