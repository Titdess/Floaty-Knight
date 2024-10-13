extends PlayerState
class_name PlayerGlide

@export var player: CharacterBody2D
@export var glide_bar = ProgressBar
@export var flyLimit = Timer

var isGliding: bool

func Enter():
	print("Glide")
	#Set la vitesse de déplacement en vol
	player.playerSpeed = 100
	#Si je joueur peut Glide, lance le Glide
	Glide()
	


func Glide():
	if player.canGlide:
		player.normalGravity = 0
		player.velocity.y = 50
		isGliding = true


func Exit():
	#Set les paramètre du perso en sortie de Glide
	player.normalGravity = player.gravity
	player.playerSpeed = 300
	isGliding = false

# Appelé toutes les frames
func PhysicsUpdate(delta):
	StateUpdate()
	playerMovement(delta)

	
	

func playerMovement(delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.playerSpeed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.playerSpeed)

	player.move_and_slide()

func StateUpdate():
	if player.is_on_floor() :
		transition.emit(self, "Idle")
	if Input.is_action_just_released("Glide") or !player.canGlide:
		transition.emit(self, "Fall")
	if player.isHit:
		transition.emit(self, "Hit")
	if player.isDead:
		transition.emit(self, "Dead")

#Consomme la limite de glide
func _on_fly_limit_timeout():
	if isGliding == true :
		player.currentFlyLimit -= 5
		glide_bar.value = player.currentFlyLimit
	else :
		return
