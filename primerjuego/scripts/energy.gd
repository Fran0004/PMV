extends Area2D

var speed = 100
var moving = true

func _physics_process(delta: float) -> void:
	if moving:
		position += transform.x * speed * delta
	
func _on_gpu_particles_2d_finished() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		pass
	else:
		$GPUParticles2D.emitting = true 
		moving = false
		$AnimatedSprite2D.hide()
