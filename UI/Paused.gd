extends Label

func _process(delta):
	if GameScene.gameState:
		hide()
	else:
		show()
