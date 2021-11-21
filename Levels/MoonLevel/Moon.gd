extends Node2D

onready var transition := $CanvasLayer/TransitionColor

func _on_RespawnZone_body_entered(_body: Area2D) -> void:
	transition.transition_to("res://Levels/MoonLevel/Moon.tscn")


func _on_KillZone_body_entered(_body: Area2D) -> void:
	transition.transition_to("res://UI/End/End.tscn")


func _on_EndZone_body_entered(_body: Area2D) -> void:
	Globals.levelTwoComplete = 1
	transition.transition_to("res://UI/End/End.tscn")
