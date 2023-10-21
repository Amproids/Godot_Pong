extends Node3D
var gameState
var player1Score
var player2Score
var ballZ

func _ready():
	gameState = 0
	player1Score = 0
	player2Score = 0
	ballZ = 0
	
func _process(delta):
	if Input.is_action_just_pressed("pause_unpause"):
		if gameState == 1:
			gameState = 0
		else:
			gameState = 1
func _restartGame():
	gameState = -1
	player1Score = 0
	player2Score = 0
