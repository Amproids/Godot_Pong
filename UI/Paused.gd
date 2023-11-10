extends Label

func _process(delta):
	if Input.is_action_just_pressed("pause_unpause"):
		if GameScene.gameState == "playing":
			GameScene.gameState = "paused"
			show()
		else:
			GameScene.gameState = "playing"
			hide()
