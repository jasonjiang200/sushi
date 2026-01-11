extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


@export var plate_scene: PackedScene
@export var spawn_x := 700.0      # Offscreen right
@export var spawn_y := 0.0        # Same Y as your belt
@export var spawn_interval := 1.0 # Time in seconds between plates

var timer := 0.0

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_plate()

func spawn_plate():
	if plate_scene == null:
		return
	var plate = plate_scene.instantiate()
	# Randomly pick sushi type
	var type = "tuna" if randi() % 5 == 0 else "salmon"
	plate.sushi_type = type
	plate.position = Vector2(spawn_x, spawn_y)
	add_child(plate)
