extends Node2D

var PlayerScore = 0
var OponenteScore = 0
onready var Contador = $RestartTimer

func _ready():
	_restart_game()

func _process(delta):
	$MarcadorPlayer.text = String(PlayerScore)
	$MarcadorOponente.text = str(OponenteScore)
	$Contador.text = str(int(Contador.time_left))
	if $RestartTimer.time_left <= 0:
		$Contador.visible = false
	else:
		$Contador.visible = true
	
func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	$RestartTimer.start()
	

func _on_ArcoPlayer_body_entered(body):
	if body is Ball:
		OponenteScore += 1
		_restart_game()


func _on_ArcoOponente_body_entered(body):
	if body is Ball:
		PlayerScore += 1
		_restart_game()

