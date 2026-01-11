extends ProgressBar


@export var player_path: NodePath
var player

func _ready():
	player = get_node(player_path)
	min_value = 0
	max_value = player.stomach_max
	value = player.stomach

	player.stomach_changed.connect(_on_stomach_changed)

func _on_stomach_changed(current):
	value = current
