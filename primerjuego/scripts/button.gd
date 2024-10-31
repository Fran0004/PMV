extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered():
	modulate = Color(122, 235, 255, 0.8)  # Cambia el color para dar el efecto de hover
	
func _on_mouse_exited():
	modulate = Color(1, 1, 1, 1)  # Restaura el color original
