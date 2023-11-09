extends RigidBody3D
var velocity = Vector3(0, 0, 0)
var PADDLEANGLERANGE = 120
var PADDLEANGLESCALEFACTOR = (PADDLEANGLERANGE/2)/3
var ballSpeedMax = 50
var ballSpeedStart = 20
var ballSpeed = ballSpeedStart
var lastScored = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector3(0, 1, 0)
	lastScored = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameScene.gameState:
		GameScene.ballCoords = position
		GameScene.ballVelocity = velocity
		if GameScene.serveTimerTime:
			if lastScored == 2:
				position = Vector3(-15, 1, GameScene.player1Position[2])
				velocity = Vector3(ballSpeed, 0, 0)
			if lastScored == 1:
				position = Vector3(15, 1, GameScene.player2Position[2])
				velocity = Vector3(-ballSpeed, 0, 0)
		else:
			var collisionInfo = move_and_collide(velocity * delta)
			if collisionInfo:
				#update ball's positional relation to players. (I don't know how to pull this data from collisionInfo)
				var DistanceToPlayer1 = GameScene.player1Position - position
				var DistanceToPlayer2 = GameScene.player2Position - position
				if abs(DistanceToPlayer1[0]) < 1.1 and abs(DistanceToPlayer1[2]) < 2.9:
					var theta = -deg_to_rad(PADDLEANGLESCALEFACTOR * DistanceToPlayer1[2])
					velocity.x = cos(theta) * ballSpeed
					velocity.z = sin(theta) * ballSpeed
					if ballSpeed < ballSpeedMax:
						ballSpeed += 1
				elif abs(DistanceToPlayer2[0]) < 1.1 and abs(DistanceToPlayer2[2]) < 2.9:
					var theta = -deg_to_rad(PADDLEANGLESCALEFACTOR * DistanceToPlayer2[2])
					velocity.x = -cos(theta) * ballSpeed
					velocity.z = sin(theta) * ballSpeed
					if ballSpeed < ballSpeedMax:
						ballSpeed += 1
				else:
					velocity = velocity.bounce(collisionInfo.get_normal())
				#If ball goes out of bounds.
				if position.x < -18:
					GameScene.player2Score += 1
					ballSpeed = ballSpeedStart
					lastScored = 2
				if position.x > 18:
					GameScene.player1Score += 1
					ballSpeed = ballSpeedStart
					lastScored = 1
	elif GameScene.gameState == -1:
		position = Vector3(0, 1, 0)
		ballSpeed = ballSpeedStart
