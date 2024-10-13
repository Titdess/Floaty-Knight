extends State

signal SkeletonIsWalking
@export var skeleton: CharacterBody2D
@export var rayCast: RayCast2D
@export var rayCastFront : RayCast2D
var direction = 1
var facingRight = true

func Enter():
	SkeletonIsWalking.emit()

func Exit():
	pass

func Update(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsUpdate(delta):
	StateUpdate()
	SkeletonMovement()


func SkeletonMovement():
	if !rayCast.is_colliding() or rayCastFront.is_colliding():
		direction = direction * -1
		
	skeleton.velocity.x =  skeleton.speed * direction
	
	skeleton.move_and_slide()

func flip():
	pass


func StateUpdate():
	if skeleton.isHit:
		transition.emit(self, "Hit")
	if skeleton.isDead:
		transition.emit(self, "Dead")


func _on_detection_zone_body_entered(body):
	pass # Replace with function body.
