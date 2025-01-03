extends  Area2D

var vida : float = 3
var is_shaking = false
var original_position: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if vida <= 0:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("energy"):
		flash_enemy()
		vida -= 1

func flash_enemy() -> void:
	var tween = create_tween()
	tween.tween_property($AnimatedSprite2D, "modulate", Color(1, 0, 0), 0.1)  # Rojo
	tween.tween_property($AnimatedSprite2D, "modulate", Color(1, 1, 1), 0.1) 	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("rock") :
		flash_enemy()
		vida -= 2
