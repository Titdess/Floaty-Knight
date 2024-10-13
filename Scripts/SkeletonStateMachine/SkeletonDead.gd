extends State
class_name SkeletonDead

@export var skeleton: CharacterBody2D
@onready var respawnTimer = $reviveTimer
@export var skeletonHitBox: CollisionShape2D
@export var skeletonHurtBox: CollisionShape2D



func Enter():
	$reviveTimer.start()
	skeletonHurtBox.set_deferred("disabled", true)
	skeletonHitBox.set_deferred("disabled", true)
	


func Exit():
	skeletonHurtBox.set_deferred("disabled", false)
	skeletonHitBox.set_deferred("disabled", false)
	skeleton.isDead = false

func Update(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsUpdate(delta):
	pass

func StateUpdate():
	pass


func _on_revive_timer_timeout():
	skeleton.currentHp = skeleton.maxHp
	transition.emit(self, "Walk")
