extends Timer
var lastScoreboard = 0 + 0
var displayedTime
var lastTime

func _ready():
	start()
func _process(delta):
	GameScene.serveTimerTime = time_left
	displayedTime = round(time_left+0.49)
	if GameScene.player1Score + GameScene.player2Score != lastScoreboard:
		start()
	if GameScene.gameState == "playing":
		paused = false
	else:
		paused = true
	if displayedTime != lastTime:
		if displayedTime == 0:
			$Serve.play()
		else:
			$Countdown.play()
	lastScoreboard = GameScene.player1Score + GameScene.player2Score
	lastTime = displayedTime
