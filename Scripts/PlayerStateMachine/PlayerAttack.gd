extends PlayerState
class_name PlayerAttack

signal Attack

@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D
@export var attackHitBox: CollisionShape2D

func Enter():
	print("Attack")
	Attack.emit()
	attackHitBox.set_deferred("disabled", false) 
	animation.play("Attack")
	
	
func Exit():
	attackHitBox.set_deferred("disabled", true) 

func Update(delta):
	pass

func PhysicsUpdate(delta):
	pass

func StateUpdate():
	if player.isHit:
		transition.emit(self, "Hit")
	if player.isDead:
		transition.emit(self, "Dead")	


func _on_animated_sprite_2d_animation_finished():
	transition.emit(self, "Idle")
