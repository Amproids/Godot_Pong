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
