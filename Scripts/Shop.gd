extends AnimatedSprite2D

@export var objectScene = preload("res://Scene/coin.tscn")
var playerIsInside: bool = false
var isLooted: bool = false


func _ready():
	pass

func _input(event):
	if event.is_action_pressed("Interact") and playerIsInside and !isLooted:
		isLooted = true
		_drop_object()

func _drop_object():
	print("drop object")
	var object = objectScene.instantiate()
	owner.get_node("Objects").add_child(object)
	object.position = self.position + Vector2(0, 100)
	var tween = get_tree().create_tween()
	
	tween.tween_property(object,"position:y", position.y + 150, 1)

func _process(delta):
	pass



func _on_area_2d_body_entered(body):
	playerIsInside = true


func _on_area_2d_body_exited(body):
	playerIsInside = false
