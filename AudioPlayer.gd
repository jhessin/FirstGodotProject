extends AudioStreamPlayer2D

var coinSfx = preload("res://Audio/coin.ogg")

func play_coin_sfx():
  stream.loop = false
  play()
