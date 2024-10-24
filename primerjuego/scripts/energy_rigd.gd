extends RigidBody2D

var moving = true
var direction: int 
var force : float = 5
var launch_direction = Vector2(2000*force,-2000*force)
var colisionado = false
var diley : float = 2

func _ready() -> void:
	if direction == 1:
		launch_direction = Vector2(2000*force,-2000*force)
	elif  direction == -1:
		launch_direction = Vector2(-2000*force,-2000*force)
		
		
	$".".apply_central_force( launch_direction)

func set_direction(dir: int) -> void:
	direction = dir

func _on_gpu_particles_2d_finished() -> void:
	disconnect('body_entered', Callable(self,'_on_body_entered'))
	queue_free()
	
func _on_body_entered(body: Node) -> void:
	if !body.is_in_group("player") and !colisionado:
		print(body.name)
		$AnimatedSprite2D.hide()
		moving = false
		colisionado = true
		$GPUParticles2D.emitting = true 
	else:
		print("player touching")
