class_name DialogueNode
extends Resource

# The id of this node
@export var id: StringName

# The choices the player has. These are mutually exclusive with linear
# continuation.
@export var choices: Array[DialogueChoice]

# Used when there are no choices. Empty means this node ends the conversation.
@export var continue_to_node_id: StringName

# The text that the NPC speaks.
@export_multiline var text: String
