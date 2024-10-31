extends Area2D

@onready var timer = $Timer
var directionParaProyectil : float = 0
var playerDetected = false
@onready var Energy = preload("res://scens/enemi_energy.tscn")

func _ready() -> void:
	$CollisionShape2D.scale = Vector2(1,1)
	timer.one_shot = true
	
func _process(_delta: float) -> void:
	if playerDetected:
		shootEnemie(Energy)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		playerDetected = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		playerDetected = false
		
func shootEnemie(e):
	if timer.is_stopped():
			
		var collider = $CollisionShape2D
		var b = e.instantiate()  # Instancia el proyectil
		b.set_direction(-1)
		get_parent().add_child(b)  # Añade el proyectil al padre del jugador

		b.global_position = collider.global_position
		timer.wait_time = b.diley
		timer.start()
