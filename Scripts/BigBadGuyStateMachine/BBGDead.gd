extends State

@export var bbg: CharacterBody2D
@onready var respawnTimer = $reviveTimer
@export var bbgHitBox: CollisionShape2D
@export var bbgHurtBox: CollisionShape2D

func Enter():
	$reviveTimer.start()
	bbgHurtBox.set_deferred("disabled", true)
	bbgHitBox.set_deferred("disabled", true)


func Exit():
	bbg.isDead = false
	bbgHurtBox.set_deferred("disabled", false)
	bbgHitBox.set_deferred("disabled", false)

func Update(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsUpdate(delta):
	pass

func StateUpdate():
	pass


func _on_revive_timer_timeout():
	bbg.currentHp = bbg.maxHp
	transition.emit(self, "Walk")
