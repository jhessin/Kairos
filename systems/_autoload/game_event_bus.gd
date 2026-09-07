extends Node

@warning_ignore_start('unused_signal')
# Objective signals
signal interacted(source: Entity, target: Entity)
signal collected(source: Entity, target: Entity)
signal killed(source: Entity, target: Entity)
signal dialogue_signal(source: Entity, value: String)

# Quest signals
signal start_quest(player: PlayerEntity, quest: ObjectiveQuest)
signal complete_quest(player: PlayerEntity, quest: ObjectiveQuest)
