extends Node3D
var gameState
var player1Score = 0
var player2Score = 0
var player1Position = Vector3(0, 0, 0)
var player2Position = Vector3(0, 0, 0)
var ballCoords = Vector3(0, 0, 0)
var ballVelocity = Vector3(0, 0, 0)
var serveTimerTime = 0.0

func _ready():
	gameState = "menu"
	player1Score = 0
	player2Score = 0
	
