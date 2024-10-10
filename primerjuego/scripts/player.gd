extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -250.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_player = $"../AnimationPlayer"

var procesing = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	# He quitado la funcion is_on_floor() que sale todo el rato en false
	if Input.is_action_just_pressed("Saltar"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction>=0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h= true	
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
		
	if Input.is_action_just_pressed("super_atack") and !procesing:
		procesing = true
		print("super ataque")
		animated_player.play("zoom_in")
	#if  Input.is_action_just_pressed("ataque"):
		#var energy_instance = energy_instance.instance() 
		
		

func play_animation_super_attack() -> void:
	animated_sprite.play("kame_attack")
func play_animation_idle() -> void:
	animated_sprite.play("idle")
	
func _on_animated_sprite_2d_animation_finished() -> void:
	print("acabado")
	if animated_sprite.animation == "kame_attack":
		animated_player.play("zoom_out")
		procesing = false
