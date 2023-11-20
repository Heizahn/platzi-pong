extends KinematicBody2D

var speed = 600
onready var ball = get_parent().find_node("Ball")
const POS = 1850

func _physics_process(_delta):
	var direction = Vector2(0, _get_direction())
	position.x = POS
	move_and_slide(direction * speed)

func _get_direction():
	if abs(ball.position.y - position.y) > 15:
		if ball.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0
