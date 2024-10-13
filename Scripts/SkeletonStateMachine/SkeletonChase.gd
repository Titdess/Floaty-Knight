extends State
class_name SkeletonChase

signal SkeletonIsWalking
@export var skeleton: CharacterBody2D


func Enter():
	SkeletonIsWalking.emit()


func Exit():
	pass

func Update(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsUpdate(delta):
	StateUpdate()

func StateUpdate():
	pass



func _on_detection_zone_body_entered(body):
	pass # Replace with function body.


func _on_detection_zone_body_exited(body):
	pass # Replace with function body.
