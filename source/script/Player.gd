extends KinematicBody2D

export (int) var velocity_speed = 10
export (String) var key_move_up = "ui_up"
export (String) var key_move_down = "ui_down"

var velocity = Vector2()
var object_collision = null

func _ready():
	pass

func _physics_process(delta):
	object_collision = move_and_collide((velocity * velocity_speed) * delta)
		
	if Input.is_action_pressed(key_move_up):
		velocity.y -= 1
	elif Input.is_action_pressed(key_move_down):
		velocity.y += 1
		
	if(object_collision != null):
		if(object_collision.get_collider().name == "EndSideTop"):
			velocity.y = 0
			
	if(abs(velocity.y) >= 100):
		velocity.y /= 2

