extends Timer
var last_scoreboard = 0 + 0
func _ready():
	start()
func _process(delta):
	GameScene.serveTimerTime = time_left
	if GameScene.player1Score + GameScene.player2Score != last_scoreboard:
		start()
	if GameScene.gameState == "playing":
		paused = false
	else:
		paused = true
	last_scoreboard = GameScene.player1Score + GameScene.player2Score
