extends Label

func _ready():
	pass

func _process(delta):
	if GameScene.gameState == "playing":
		if GameScene.player1Score == 5:
			show()
			GameScene.gameState = "win"
			text = "Player 1 Wins!"
		elif GameScene.player2Score == 5:
			show()
			GameScene.gameState = "win"
			text = "Player 2 Wins!"
		else:
			text = ""
			hide()
	elif GameScene.gameState == "win":
		if Input.is_action_just_pressed("pause_unpause"):
			GameScene.gameState = "playing"
