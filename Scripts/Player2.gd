extends CharacterBody3D
@export var SPEED = 20.0
#AI variables
var AI = true
var startMoving = false
#check p1 score because when p1 scores, p2 serves the ball
var p1ScoreChange = false
var p1ScoreOld = 0
var AIServing = false
var movementLoop = (randi() % 100) + 100
var currentLoop = 0
var movementDirection = 1
var flippingDirection = false
var AI_REACTION_RANGE = -5 #the smaller, the more difficult the AI. 0 is the midpoint -18 is the hardest

func _physics_process(delta):
	if GameScene.gameState == "playing":
		GameScene.player2Position = position
		var direction = Vector3.ZERO
		if AI:
			if AIServing:
				if position.z > 11.49 and not flippingDirection:
					movementDirection = movementDirection * -1
					flippingDirection = true
				if position.z < -11.49 and not flippingDirection:
					movementDirection = movementDirection * -1
					flippingDirection = true
				if position.z < 11.49 and position.z > -11.49 and flippingDirection:
					flippingDirection = false
				if currentLoop != movementLoop:
					if movementDirection == 1:
						direction.z += 1
						currentLoop += 1
					else:
						direction.z -= 1
						currentLoop += 1
				else:
					AIServing = false
			else:
				if GameScene.ballCoords.x > AI_REACTION_RANGE and GameScene.ballVelocity.x > 0:
					if abs(GameScene.ballCoords[2] - position[2]) > 1.5:
						startMoving = true
					else:
						startMoving = false
					if startMoving:
						if GameScene.ballCoords[2] < position[2]:
							direction.z -= 1
						if GameScene.ballCoords[2] > position[2]:
							direction.z += 1
			if GameScene.serveTimerTime and not AIServing:
				movementLoop = (randi() % 80) + 20
				currentLoop = 0
				movementDirection = movementDirection * -1
				AIServing = true
			p1ScoreOld = GameScene.player1Score
		if Input.is_action_pressed("player2_move_up"):
			AI = false
			direction.z -= 1
		if Input.is_action_pressed("player2_move_down"):
			AI = false
			direction.z += 1
		velocity.z = direction.z * SPEED
		direction = move_and_slide()
	elif GameScene.gameState == "win":
		position.z = 0
