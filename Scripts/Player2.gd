extends CharacterBody3D
@export var SPEED = 20.0
var AI = true

func _physics_process(delta):
	if GameScene.gameState:
		GameScene.player2Position = position
		var direction = Vector3.ZERO
		if AI:
			if GameScene.ballZ < position[2]:
				direction.z -= 1
			if GameScene.ballZ > position[2]:
				direction.z += 1
		if Input.is_action_pressed("player2_move_up"):
			AI = false
			direction.z -= 1
		if Input.is_action_pressed("player2_move_down"):
			AI = false
			direction.z += 1
		velocity.z = direction.z * SPEED
		direction = move_and_slide()
	elif GameScene.gameState == -1:
		position.z = 0
