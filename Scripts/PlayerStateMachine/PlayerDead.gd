extends PlayerState
class_name PlayerDead

@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D
@export var playerHitBox: Area2D
@export var playerCollisionBox: CollisionShape2D




func Enter():
	print("Dead")
	$RespawnTimer.start()
	animation.play("Dead")

func Exit():
	player.isDead = false  

func Update(delta):
	pass

func PhysicsUpdate(delta):
	pass

func StateUpdate():
	pass
func _on_respawn_timer_timeout():
	owner.Death()
