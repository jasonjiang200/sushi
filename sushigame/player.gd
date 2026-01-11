extends Node2D

signal stomach_changed(current)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

# Player stomach
@export var stomach_max := 100
var stomach := 0

# Modes (like Eat / Scan)
enum Mode { EAT, SCAN }
var mode := Mode.EAT

# S Power (ultimate)
var s_power_ready := true

func eat(amount):
	stomach = clamp(stomach + amount, 0, stomach_max)
	emit_signal("stomach_changed", stomach)
	print("Stomach:", stomach)

func activate_s_power():
	if s_power_ready:
		print("S Power activated!")
		eat(-30)
		s_power_ready = false
		
