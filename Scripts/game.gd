extends Node2D



func _on_killzone_player_death():
	resetLevel()

func resetLevel():
	get_tree().reload_current_scene()
