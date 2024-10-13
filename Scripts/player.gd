extends CharacterBody2D

#Variables def joueur
@export var playerSpeed = 300.0
@export var playerJumpSpeed = -350.0
@export var currentFlyLimit = 100
@export var playerGlideSpeed = 30

@onready var fly_bar = $flyBar
@onready var player = $"."
@onready var hpBar = $HealthBar

var flipped = true
var canGlide = true

var hasGrapplin:bool = false
var canJump = true
var isHooked : bool
var isHit: bool
var isDead: bool
var invincibility: bool

var maxHp = 3
var currentHp = 3


# Variables def world
# Get the gravity from the project settings to be synced with RigidBody nodes.
var normalGravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var glideGravity = 80
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	$Hitbox/CollisionShape2D.set_deferred("disabled", true)

func flyLimit_timeout():
	if is_on_floor() and currentFlyLimit < fly_bar.max_value:
		currentFlyLimit += 1
		fly_bar.value = currentFlyLimit

	if currentFlyLimit <= 0:
		canGlide = false
	if currentFlyLimit >= 100:
		canGlide = true
		fly_bar.hide()
	if currentFlyLimit != 100:
		fly_bar.show()

func playerMovement():
	if velocity.x > 0 and !flipped:
		flipped = true
		scale.x *= -1
	if velocity.x < 0 and flipped:
		flipped = false
		scale.x *= -1


func hit(damage):
	if invincibility:
		return
	currentHp -= 1
	if currentHp > 0:
		isHit = true
	if currentHp == 0:
		isDead = true

func Death():
	owner.resetLevel()

func _physics_process(delta):
	playerMovement()
	if not is_on_floor():
		player.velocity.y += player.normalGravity * delta
		move_and_slide()
	


func _on_hit_timer_timeout():
	invincibility = false


func _on_chain_hooked(hooked_position):
	isHooked = true
	await get_tree().create_timer(0.2).timeout
	var tween = get_tree().create_tween()
	if hooked_position.y < position.y:
		tween.tween_property(self, "position", hooked_position + Vector2(0,30), 0.2)
	elif hooked_position.x > position.x:
		tween.tween_property(self, "position", hooked_position + Vector2(-12, 0), 0.2)
	elif hooked_position.x < position.x:
		tween.tween_property(self, "position", hooked_position + Vector2(12, 0), 0.2)

