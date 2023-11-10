extends Label

func _process(delta):
	if GameScene.gameState == "playing":
		text = str(GameScene.player1Score) + "     :     " + str(GameScene.player2Score)
	if GameScene.gameState == "win":
		GameScene.player1Score = 0
		GameScene.player2Score = 0
