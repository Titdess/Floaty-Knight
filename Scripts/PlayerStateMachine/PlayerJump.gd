extends PlayerState
class_name PlayerJump

signal Jumping
@export var player: CharacterBody2D
@export var glide_bar = ProgressBar
@export var flyLimit = Timer
@export var animation: AnimatedSprite2D
@onready var StateMachinePlayer = $".."


var isFlying : bool

func Enter():
	print("Jump")
	Jumping.emit()
	$Timer.start()
	animation.play("Jump")


func Exit():
	player.normalGravity = player.gravity

	
func PhysicsUpdate(delta):
	StateUpdate()
	playerMovement(delta)
	if Input.is_action_just_released("ui_accept") and isFlying == true or !player.canGlide:
			transition.emit(self, "Fall")
			isFlying = false

func playerMovement(_delta):
	player.playerSpeed = 100
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.playerSpeed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.playerSpeed)
		
	player.move_and_slide()

func _on_timer_timeout():
	if StateMachinePlayer.currentState != self:
		return
	if Input.is_action_pressed("ui_accept") and player.canGlide:
		print("time")
		player.normalGravity = 0
		player.velocity.y = -100
		isFlying = true
		

func _on_fly_limit_timeout():
	if isFlying == true :
		player.currentFlyLimit -= 5
		glide_bar.value = player.currentFlyLimit

func StateUpdate():
	if player.is_on_floor():
		transition.emit(self, "Idle")
	if player.velocity.y > 0:
		transition.emit(self, "Fall")
	if player.isHooked:
		transition.emit(self, "Hook")
