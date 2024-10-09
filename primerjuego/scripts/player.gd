extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_player = $"../AnimationPlayer"
var procesing = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("super_atack") and !procesing:
		procesing = true
		print("super ataque")
		animated_player.play("zoom_in")
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func play_animation_super_attack() -> void:
	animated_sprite.play("kame_attack")
func play_animation_idle() -> void:
	animated_sprite.play("idle")
	
func _on_animated_sprite_2d_animation_finished() -> void:
	print("acabado")
	if animated_sprite.animation == "kame_attack":
		animated_player.play("zoom_out")
		procesing = false
