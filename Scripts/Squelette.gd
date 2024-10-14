extends CharacterBody2D

@export var maxHp = 2
var currentHp = maxHp

@export var walkSpeed = 25
@export var chaseSpeed = 35
var speed = walkSpeed
var flipped = true

var gravity =  ProjectSettings.get_setting("physics/2d/default_gravity")

var isHit: bool
var isDead: bool

@onready var anim = $AnimatedSprite2D
@onready var respawnTimer = $StateMachine/Dead/RespawnTimer

func _ready():
	pass

func _physics_process(delta):
	animationOrientation()
	if not is_on_floor():
		velocity.y += gravity * delta
		move_and_slide()

func hit(damage):
	currentHp -= damage
	if currentHp == 0 :
		anim.play("Dead")
		isDead = true
	if currentHp > 0:
		anim.play("Hit")
		isHit = true

func animationOrientation():
	if velocity.x > 0 and !flipped:
		flipped = true
		scale.x *= -1
	if velocity.x < 0 and flipped:
		flipped = false
		scale.x *= -1


func _on_walk_skeleton_is_walking():
	$AnimatedSprite2D.play("Walk")





func _on_detection_zone_body_entered(body):
	pass # Replace with function body.
