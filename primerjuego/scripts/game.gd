extends Node2D
# Called when the node enters the scene tree for the first time.
var textoMostrado = false
func _ready() -> void:
	pass # Replace with function body.

func _on_mostrar_texto_1_body_entered(body: Node2D) -> void:
	print("")
	if body.is_in_group("player") and !textoMostrado:
		print("DD")
		textoMostrado= true
		$AnimationPlayer.play("mostrarAtaques")
