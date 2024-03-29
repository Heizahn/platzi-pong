extends KinematicBody2D
class_name Ball

var speed = 0
var direction = Vector2.ZERO
var is_moving = false
var Audio
onready var timer =  get_parent().find_node("RestartTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	reset_ball()
	Audio = $AudioStreamPlayer

func reset_ball():
	timer.stop()
	speed = 600
	direction.x = [-1, 1][randi() % 2]
	direction.y = [-0.8, 0.8][randi() % 2]
	is_moving = true

func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(direction * speed * delta)
		if collide:
			direction = direction.bounce(collide.normal)
			Audio.play()


func _on_RestartTimer_timeout():
	reset_ball()
