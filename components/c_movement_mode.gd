class_name C_MovementMode
extends Component

enum Mode {
	WALK,
	RUN,
}

@export var current: Mode = Mode.WALK
