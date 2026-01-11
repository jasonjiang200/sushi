extends ProgressBar


@export var player_path: NodePath
var player

func _ready():
	player = get_node(player_path)
	min_value = 0
	max_value = 100 # score needed
	value = player.money_eaten

	player.money_eaten_changed.connect(_on_money_eaten_changed)

func _on_money_eaten_changed(current):
	value = current
