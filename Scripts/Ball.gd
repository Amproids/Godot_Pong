extends RigidBody3D
var velocity = Vector3(-10, 0, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	position.z = GameScene.ballZ
	position.x = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameScene.gameState:
		var collisionInfo = move_and_collide(velocity * delta)
		if collisionInfo:
			velocity = velocity.bounce(collisionInfo.get_normal())
			var DistanceToPlayer1 = GameScene.player1Position - position
			var DistanceToPlayer2 = GameScene.player2Position - position
			if abs(DistanceToPlayer1[0]) < 2 and abs(DistanceToPlayer1[2]) < 3:
				velocity.z = -DistanceToPlayer1[2]*5
				print("bounced off player 1")
			if abs(DistanceToPlayer2[0]) < 2 and abs(DistanceToPlayer2[2]) < 3:
				velocity.z = -DistanceToPlayer2[2]*5
				print("bounced off player 2")
			GameScene.player1Score = DistanceToPlayer1
			GameScene.player2Score = DistanceToPlayer2
