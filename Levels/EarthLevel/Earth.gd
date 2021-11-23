extends Node2D

onready var SPAWN_POINT = $SpawnPoint.position
onready var transition := $CanvasLayer/TransitonColor

var vehicle

onready var hud := $CanvasLayer/HUD
func _init():
	Globals.load_vehicle(Globals.car_id)

func _ready():
	vehicle = Globals.get_vehicle()
	var _error = Globals.connect("new_max_speed", hud, "update_speed")
	if vehicle:
		vehicle.position = SPAWN_POINT
	else: 
		vehicle = load("res://Vehicles/RedCar/RedCar.tscn").instance()
		vehicle.position = SPAWN_POINT
	call_deferred("add_child", vehicle)

func _process(_delta):
	var car_velocity = (vehicle.linear_velocity.x + vehicle.linear_velocity.y) /2
	Globals.set_max_speed(car_velocity)

func _on_FinishZone_body_entered(body):
	if body == $Car:
		Globals.disconnect("new_max_speed", hud, "update_speed")
		Globals.determine_current_level(get_tree().current_scene.filename)
		transition.transition_to("res://UI/End/End.tscn")
