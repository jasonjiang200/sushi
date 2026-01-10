extends Node2D

@onready var player = get_node("/root/Game/Player")
@onready var plate_spawner = get_parent().get_node("PlateSpawner")

@export var grab_radius := 30.0
@onready var debug_rect = $ColorRect

func _ready():
	# Set the debug rectangle size to match the grab radius
	debug_rect.size = Vector2(grab_radius*2, grab_radius*2)
	debug_rect.position = Vector2(-grab_radius, -grab_radius)  # center the rect

func _process(delta):
	# Detect left mouse click
	if Input.is_action_just_pressed("click") and player.mode == player.Mode.EAT:
		for plate in plate_spawner.get_children():
			if plate.position.distance_to(position) <= grab_radius and player.stomach < player.stomach_max:
				print("NOM")
				if plate.has_method("eat"):
					plate.eat(player)
					break
