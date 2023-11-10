extends Label
var bufferGameStart = 1

func _process(delta):
		if Input.is_action_just_pressed("pause_unpause"):
			if bufferGameStart == 1:
				bufferGameStart -= 1
			else:
				if GameScene.gameState == "playing":
					GameScene.gameState = "paused"
					show()
					$Pause.play()
				elif GameScene.gameState == "paused":
					GameScene.gameState = "playing"
					hide()
					$Unpause.play()
