extends Area2D
class_name EnemyHitbox

@export var damage = 1

func _init():
	collision_layer = 16
	collision_mask = 0

