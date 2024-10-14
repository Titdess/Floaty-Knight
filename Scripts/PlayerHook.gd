extends PlayerState
class_name PlayerHook

@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D


func Enter():
	print("Hook")
	animation.play("Idle")
	player.normalGravity = 0
	player.canJump = false

	

func Exit():
	player.isHooked = false
	player.normalGravity = player.gravity
	player.canJump = true


func Update(delta):
	pass

func PhysicsUpdate(delta):
	StateUpdate()
	player.velocity = Vector2(0,0)

func StateUpdate():
	if player.isHit:
		transition.emit(self, "Hit")
	if player.isDead:
		transition.emit(self, "Dead")
		
func _input(event):
	if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right") :
		transition.emit(self, "Walk")
	if event.is_action_pressed("Glide"):
		transition.emit(self, "Fall")

