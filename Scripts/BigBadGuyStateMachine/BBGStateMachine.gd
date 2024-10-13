extends Node
class_name BBGStateMachine

@export var initialState : State

var currentState : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transition.connect(on_child_transition)

	if initialState:
		initialState.Enter()
		currentState = initialState

func _process(delta):
	if currentState:
		currentState.Update(delta)

func _physics_process(delta):
	if currentState:
		currentState.PhysicsUpdate(delta)

func on_child_transition(state, newStateName):
	if state != currentState:
		return currentState

	var new_state = states.get(newStateName)
	if !new_state:
		return
	
	if currentState:
		currentState.Exit()
	
	new_state.Enter()
	currentState = new_state
	

