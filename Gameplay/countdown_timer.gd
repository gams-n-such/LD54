class_name CountdownTimer
extends Node

signal tick(seconds_left)
signal timeout

@export var countdown_seconds : int = 3
@export var autostart : bool = false
@export var tick_on_timeout : bool = false

var countdown_counter : int = 1

func _ready():
	if autostart:
		start()
	return

func start(seconds : int = -1):
	if seconds > 0:
		countdown_seconds = seconds
		
	if countdown_seconds <= 0:
		timeout.emit()
		return
		
	countdown_counter = countdown_seconds
	tick.emit(countdown_counter)
	begin_next_tick()
	
	return

func stop():
	%TickTimer.stop()
	return

func begin_next_tick():
	%TickTimer.start()
	return

func _on_tick_timeout():
	countdown_counter -= 1
	
	if countdown_counter > 0 or tick_on_timeout:
		tick.emit(countdown_counter)
	
	if countdown_counter > 0:
		begin_next_tick()
	else:
		timeout.emit()
		
	return
