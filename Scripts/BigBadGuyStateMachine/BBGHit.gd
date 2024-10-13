extends State

@export var bbg: CharacterBody2D
@export var bbgAnimation: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func Enter():
	pass


func Exit():
	bbg.isHit = false

func Update(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsUpdate(delta):
	pass


func _on_animated_sprite_2d_animation_finished():
	transition.emit(self, "Walk")
