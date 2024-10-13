extends Area2D
@onready var deadTimer = $Timer
signal playerDeath


func _on_body_entered(body):
	print("u dead baka uwu")
	deadTimer.start()
	

func _on_timer_timeout():
	emit_signal("playerDeath")
	print("you respawn kono baka da")
