extends Label

func _process(delta):
	if GameScene.gameState == "menu":
		show()
	else:
		hide()
