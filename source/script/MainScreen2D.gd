extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var key_count = 0

func _input(event):
	if key_count < 32:
		if event is InputEventKey:
			key_count += 1
			
			if key_count == 31:
				$ControlPlayer1.visible = false
				$ControlPlayer2.visible = false
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
