class_name QuestDatabase
extends RefCounted

static var quests: Dictionary = {
	"Q001": Quest.new(
		"Q001",
		"A Stranger in Eliab's Life",
		"Learn enough about Eliab's life to maintain your synchronization.",
		[
			QuestObjective.new("synchronize_with_eliab", "Synchronize with Eliab"),
			QuestObjective.new("meet_yosef", "Meet Yosef"),
		],
	),
	"Q002": Quest.new(
		"Q002",
		"The Master's Errand",
		"Help Yosef with his daily work.",
		[
			QuestObjective.new("gather_clay", "Gather clay", 3),
			QuestObjective.new("gather_water", "Gather water", 1),
			QuestObjective.new("craft_vessel", "Craft a simple vessel"),
			QuestObjective.new("deliver_vessel", "Deliver the vessel to Yosef"),
		],
		["Q001"],
	),
	"Q003": Quest.new(
		"Q003",
		"A Friend's Challenge",
		"Meet Yohanan and learn the basics of combat.",
		[
			QuestObjective.new("meet_yohanan", "Meet Yohanan"),
			QuestObjective.new("complete_combat_training", "Complete combat training"),
		],
		["Q002"],
	),
	"Q004": Quest.new(
		"Q004",
		"A Wife's Question",
		"Meet Mara and navigate the pressure of Eliab's memories.",
		[
			QuestObjective.new("meet_mara", "Meet Mara"),
			QuestObjective.new("resolve_identity_choice", "Respond to Mara"),
		],
		["Q003"],
	),
}


static func get_quest(quest_id: String) -> Quest:
	return quests.get(quest_id)


static func has_quest(quest_id: String) -> bool:
	return quests.has(quest_id)
