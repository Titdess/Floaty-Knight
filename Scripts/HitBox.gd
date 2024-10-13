extends Area2D
class_name Hitbox

@export var damage = 1

func _init():
	collision_layer = 2
	collision_mask = 0
	pass
	

