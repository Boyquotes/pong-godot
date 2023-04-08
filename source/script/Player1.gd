extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var velocity_speed = 15
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	var object_collision = move_and_collide(velocity)
	
	if(object_collision != null):
		if(object_collision.get_collider().get_name() == "EndScreen"):
			print("You cant escape of the end screen")
			velocity.y = 0
		

