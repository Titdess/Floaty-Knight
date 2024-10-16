extends Area2D
class_name HurtBox


func _init():
	collision_layer = 0
	collision_mask = 16

func _ready():
	connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox):
	if hitbox == null:
		return
	
	if owner.has_method("hit"):
		owner.hit(hitbox.damage)
