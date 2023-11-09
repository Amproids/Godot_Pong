extends Label
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameScene.serveTimerTime:
		text = str(round(GameScene.serveTimerTime+0.49))
	else:
		text = ''
