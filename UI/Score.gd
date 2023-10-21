extends Label

func _process(delta):
	text = str(GameScene.player1Score) + "     :     " + str(GameScene.player2Score)
	
