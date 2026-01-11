extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


@export var fill := 15

@export var speed := 200.0

func _process(delta):
	position.x -= speed * delta

	if position.x < -700:
		queue_free()
		
func eat(player):
	# Increase the player’s stomach
	player.eat(fill)
	# Remove the plate from the game
	queue_free()
