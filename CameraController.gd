extends Camera2D

onready var player = get_node('/root/MainScene/Player')

func _process(_delta):
  position.x = player.position.x
