extends CharacterBody3D
@export var SPEED = 20.0

func _physics_process(delta):
	if GameScene.gameState:
		GameScene.player1Position = position
		var direction = Vector3.ZERO
		if Input.is_action_pressed("player1_move_up"):
			direction.z -= 1
		if Input.is_action_pressed("player1_move_down"):
			direction.z += 1
		velocity.z = direction.z * SPEED
		direction = move_and_slide()
	elif GameScene.gameState == -1:
		position.z = 0
