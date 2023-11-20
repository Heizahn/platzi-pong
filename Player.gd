extends KinematicBody2D

var speed = 400
const POS = 50

func _physics_process(_delta):
	var direction = Vector2.ZERO
	position.x = POS
	
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	move_and_slide(direction * speed)
