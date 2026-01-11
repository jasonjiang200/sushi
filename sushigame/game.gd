extends Node2D

@export var target_value := 100
@onready var player := $Player

func _process(delta):
	# Auto-return to LevelSelect if target reached
	if player.money_eaten >= target_value:
		GameState.current_level += 1
		get_tree().change_scene_to_file("res://level_select.tscn")
