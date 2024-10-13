extends PlayerState
class_name PlayerHit

@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D
@export var InvincibilityTimer: Timer




func Enter():
	print("Hit")
	player.invincibility = true
	$HitTimer.start()
	animation.play("Hit")

func Exit():
	player.isHit = false  

func Update(delta):
	pass

func PhysicsUpdate(delta):
	pass

func StateUpdate():
	pass


func _on_animated_sprite_2d_animation_finished():
	if player.is_on_floor():
		transition.emit(self, "Idle")
	if !player.is_on_floor():
		print("fallage")
		transition.emit(self, "Jump")
