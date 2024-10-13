extends Node
class_name PlayerState 

@export var can_hook : bool = true
signal transition

func stateInput(event: InputEvent):
	pass

func Enter():
	pass

func Exit():
	pass

func Update(delta: float):
	pass

func PhysicsUpdate(delta: float):
	pass
