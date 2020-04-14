extends Area2D

export var speed: int = 100
export var moveDist: int = 100

onready var startX: int = position.x
onready var targetX: int = position.x + moveDist

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
    new += step

    # clamp to path
    if new > to:
      new = to
  else:
    # moving backward
    new -= step

    # clamp to path
    if new < to:
      new = to

  return new
