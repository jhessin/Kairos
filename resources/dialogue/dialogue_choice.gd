class_name DialogueChoice
extends Resource

# Empty means this node ends the conversation.
@export var next_node_id: StringName

# The quest action this dialogue choice should take
@export var action: DialogueAction

# The text the player should select.
@export_multiline var text: String
