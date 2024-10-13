extends PlayerState
class_name PlayerWalk


@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D

func Enter():
	print("Walk")
	animation.play("Walk")
	

func Exit():
	pass

func Update(delta):
	pass

func PhysicsUpdate(delta):
	StateUpdate()
	playerMovement(delta)

func playerMovement(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.playerSpeed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.playerSpeed)
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		player.velocity.y = player.playerJumpSpeed
	
	player.move_and_slide()

func StateUpdate():
	if player.isHooked:
		transition.emit(self, "Hook")
	if not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right") and player.is_on_floor():
		transition.emit(self, "Idle")
	if player.velocity.y < 0:
		transition.emit(self, "Jump")
	if player.velocity.y > 0:
		transition.emit(self, "Fall")
	if Input.is_action_pressed("Attack") :
		transition.emit(self, "Attack")
	if player.isHit:
		transition.emit(self, "Hit")
	if player.isDead:
		transition.emit(self, "Dead")


