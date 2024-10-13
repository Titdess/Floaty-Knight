extends State

signal BBGIsWalking
@export var bbg: CharacterBody2D
@export var rayCast: RayCast2D
@export var rayCastFront : RayCast2D
@export var rayCastFront02 : RayCast2D
var direction = 1
var facingRight = true

func Enter():
	BBGIsWalking.emit()

func Exit():
	pass

func Update(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsUpdate(delta):
	StateUpdate()
	SkeletonMovement()


func SkeletonMovement():
	if !rayCast.is_colliding() or rayCastFront.is_colliding() or rayCastFront02.is_colliding():
		direction = direction * -1
		
	bbg.velocity.x =  bbg.speed * direction
	
	bbg.move_and_slide()

func flip():
	pass


func StateUpdate():
	if bbg.isHit:
		transition.emit(self, "Hit")
	if bbg.isDead:
		transition.emit(self, "Dead")
