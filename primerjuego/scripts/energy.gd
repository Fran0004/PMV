extends Area2D

var speed = 300
var moving = true
var direction: int = 1

func _physics_process(delta: float) -> void:
	if moving:
		if direction < 0:
			position += -transform.x * speed * delta
			$particulasMovimiento.rotate(0)
		else:
			$particulasMovimiento.rotate(90)
			position += transform.x * speed * delta
	else:
		$particulasMovimiento.hide()
	
func _on_gpu_particles_2d_finished() -> void:
	queue_free()
	
func set_direction(dir: int) -> void:
	direction = dir

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		pass
	else:
		$GPUParticles2D.emitting = true 
		moving = false
		$Sprite2D.hide()
