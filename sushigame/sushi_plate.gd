extends Node2D

@export var sushi_type := "salmon"  # "tuna"
@export var value := 10
@export var fill := 15

# Called when the node enters the scene tree for the first time.
func _ready():
	match sushi_type:
		"tuna":
			value = 25
			fill = 30
			$ColorRect.color = Color(1, 0.5, 0.7)  # pink
		"salmon":
			value = 10
			fill = 15
			$ColorRect.color = Color(1, 0.6, 0.2)  # orange




@export var speed := 200.0

func _process(delta):
	position.x -= speed * delta

	if position.x < -700:
		queue_free()
		
func eat(player):
	# Increase the player’s stomach
	player.eat(fill, value)
	# Remove the plate from the game
	queue_free()
