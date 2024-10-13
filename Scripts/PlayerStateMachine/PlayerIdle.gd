extends PlayerState
class_name PlayerIdle

signal Idle
@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D

func jump():
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor() and player.canJump:
		player.velocity.y = player.playerJumpSpeed
		player.move_and_slide()

func Enter():
	print("Idle")
	Idle.emit()
	animation.play("Idle")
	
	

func Exit():
	pass

func Update(delta):
	pass

func PhysicsUpdate(delta):
	StateUpdate()
	jump()
		
func StateUpdate():
	if player.velocity.y < 0:
		transition.emit(self, "Jump")
	if player.velocity.y > 0:
		transition.emit(self, "Fall")
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") :
		transition.emit(self, "Walk")
	if Input.is_action_pressed("Attack") :
		transition.emit(self, "Attack")
	if player.isHit:
		transition.emit(self, "Hit")
	if player.isDead:
		transition.emit(self, "Dead")
	if player.isHooked:
		transition.emit(self, "Hook")
