extends Area2D

export var speed: int = 100
export var moveDist: int = 100
export var rotate_speed: float = 20.0

onready var startX: int = position.x
onready var targetX: int = position.x + moveDist
onready var sprite: Sprite = get_node("Sprite")

func _process(delta):
  position.x = move_to(position.x, targetX, speed * delta)

  if position.x == targetX:
    if targetX == startX:
      targetX = position.x + moveDist
    else:
      targetX = startX


# moves 'current' toward 'to' at a rate of 'step'
func move_to(current, to, step):
  var new = current

  if new < to:
    # moving forward
    sprite.rotate(rotate_speed)
    new += step

    # clamp to path
    if new > to:
      new = to
  else:
    # moving backward
    sprite.rotate(-rotate_speed)
    new -= step

    # clamp to path
    if new < to:
      new = to

  return new
