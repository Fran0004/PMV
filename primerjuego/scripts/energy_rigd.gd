extends RigidBody2D

var moving = true
var direction: int = 1
var force : float = 5
var launch_direction = Vector2()
var colisionado = false

func _ready() -> void:
	if direction == 1:
		launch_direction = Vector2(1,0)
	elif  direction == -1:
		launch_direction = Vector2(1, -0.5)
		
	$".".apply_central_force( Vector2(2000*force,-2000*force))

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
