class_name C_AnimationState
extends Component

enum State {
	IDLE,
	WALK,
	RUN,
}

@export var current: State = State.IDLE
@export var previous: State = State.IDLE
