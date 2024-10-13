extends PlayerState
class_name PlayerFall

signal Fall
@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D


func Enter():
	print("Fall")
	Fall.emit()
	player.playerSpeed = 100
	animation.play("Fall")

	
func Exit():
	player.playerSpeed = 300

func Update(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsUpdate(delta):
	StateUpdate()
	playerMovement(delta)
	

func playerMovement(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.playerSpeed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.playerSpeed)
	
	player.move_and_slide()

func StateUpdate():
	if player.is_on_floor():
		transition.emit(self, "Idle")
	if Input.is_action_pressed("Glide") and player.canGlide:
		transition.emit(self, "Glide")
	if player.isHit:
		transition.emit(self, "Hit")
	if player.isDead:
		transition.emit(self, "Dead")
	if player.isHooked:
		transition.emit(self, "Hook")
