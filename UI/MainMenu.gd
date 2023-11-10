extends Label

func _process(delta):
	if GameScene.gameState == "menu":
		show()
	else:
		hide()
	
	if Input.is_action_just_pressed("pause_unpause"):
		if GameScene.gameState == "menu":
			GameScene.gameState = "playing"
			$Start.play()
