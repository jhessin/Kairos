# Timeline

> **Build one polished 30–45 minute playable story experience that proves Kairos
> is fun.**

That means one small historical zone, a handful of characters, one quest chain,
basic combat, one Macro, one simple archaeology activity, one crafting activity,
progression, death/reset, and a return to the modern hub.

I would plan this as a **solo 20-week vertical-slice project**, assuming roughly
**15–25 hours/week**. If you're working closer to 10 hours/week, I'd stretch it
to ~30–32 weeks rather than cutting the core experience.

---

## 1. What the prototype should actually be

The prototype should be called something like:

### **Kairos — Capernaum Vertical Slice**

The player experiences:

- **Modern Kairos Facility**

↓

- **Introduction / Synchronization**

↓

- **Capernaum, 1st century**

↓

- **Explore**

↓

- **Meet locals**

↓

- **Small quest**

↓

- **Combat training with Yohanan**

↓

- **Archaeological discovery**

↓

- **Crafting activity**

↓

- **Discover first Word of Power which unlocks first Macro Grid**

↓

- **Combat encounter**

↓

- **Use first Macro**

↓

- **Resolve local problem**

↓

- **Discover Quantum Anchor**

↓

- **Sync destabilizes / return**

↓

- **Modern Kairos Facility**

↓

- **Researchers analyze discovery**

↓

- **Next zone teased**

That gives you an actual beginning, middle, and end rather than a collection of
disconnected systems.

---

## 2. What I would NOT build

This is extremely important for a solo developer.

The original design is excellent as a **long-term vision**, but almost
everything in it should be considered future scope.

For this prototype, **do not build**:

- persistent MMO servers
- open-world multiplayer
- large-scale NPC schedules
- economy simulation
- multiple historical zones
- mounts
- swimming
- climbing
- player trading
- crafting trees
- multiple classes
- large Macro grids
- dozens of Words of Power
- elaborate inventory
- player housing
- guilds
- matchmaking
- server persistence
- sophisticated AI
- full language-learning system
- hundreds of NPCs
- extensive character customization
- complete archaeological simulation

Instead, **fake the MMO architecture where necessary**.

The prototype only needs to demonstrate that those systems _could eventually exist_.

---

## 3. Prototype scope

I would lock the prototype to approximately:

| Category             | Prototype Scope          |
| -------------------- | ------------------------ |
| Modern hub           | 1 small facility room    |
| Historical zone      | 1 Capernaum village area |
| Playtime             | 30–45 minutes            |
| Main quest           | 1 complete quest chain   |
| Side quests          | 1–2                      |
| NPCs                 | 6–8                      |
| Important characters | 4–5                      |
| Enemies              | 1–2 types                |
| Combat               | Basic melee + dodge      |
| Macro                | 1 usable Macro           |
| Word of Power        | 2–3                      |
| Archaeology          | 1 excavation             |
| Crafting             | 1 pottery activity       |
| Resources            | 3–5                      |
| Dialogue             | ~150–250 lines           |
| Cutscenes            | 3–4                      |
| Zone                 | 1                        |
| Death                | Yes                      |
| Sync progression     | Yes                      |
| Quantum progression  | Minimal                  |
| Knowledge/Codex      | 5–10 entries             |
| Multiplayer          | **No**                   |
| MMO persistence      | **No**                   |

That is enough to prove the concept.

---

## 4. Story outline

The biggest change I recommend from the current story material is making the
first prototype's story **small and personal**.

Don't immediately try to explain the entire Resonance mystery.

The player should leave the prototype thinking:

> **“What exactly happened to me, and why does this ancient artifact exist in
> both worlds?”**

rather than:

> “I have now learned the entire mythology of Kairos.”

---

## ACT I — THE RESONANCE

### Scene 1 — Excavation

Use your existing opening scene.

Dr. Miriam Halevi and Dr. Evelyn Saroyan uncover the ancient chamber.

The quantum anomaly appears.

Miriam touches the artifact.

**FLASH.**

The ancient world appears.

A young girl grabs Miriam's hand.

> “Come on, Mary. We are going to be late!”

Miriam realizes she can see an ancient world that should be long gone.

Cut back to modern day.

---

#### Scene 2 — The Player

The player arrives at the Kairos Initiative.

Introduce only the characters needed for the prototype.

I recommend:

**Dr. Miriam Halevi**
Mentor / director

**Dr. Evelyn Saroyan**
Archaeology / historical grounding

**Dr. Daniel Kessler**
Science / skeptical interpretation

**Dr. Naomi Feld**
Language calibration

**Dr. Asha Raman**
Synchronization technology

That's enough.

Do not introduce the entire 25-person research staff yet.

They can exist in the GDD but remain off-screen.

---

#### Scene 3 — Calibration

The player goes through:

1. identity verification
2. cognitive test
3. language calibration
4. equipment preparation
5. synchronization briefing

This is also where you teach:

- movement
- camera
- interaction
- dialogue
- basic UI

The player is told:

> Their counterpart lived in Capernaum.

The exact identity is deliberately withheld.

---

## ACT II — CAPERNAUM

The player awakens in the ancient world.

The first major emotional beat should be:

### The world is alive

Not a quest marker.

Not a tutorial dungeon.

Just:

- people talking
- animals
- merchants
- fishermen
- children
- pottery
- food
- tools
- buildings
- people working

The player realizes:

**This isn't a simulation.**

Or at least, it doesn't _feel_ like one.

---

## Quest 1 — “A Stranger in Capernaum”

The player meets their first local NPC.

I would create a fictional character rather than immediately attaching the
player to a famous biblical figure.

For example:

### Eliab

A young craftsman/fisherman.

He recognizes the player's counterpart.

But the player doesn't recognize him.

This establishes the central mystery:

> **Your counterpart had a life here.**

The player isn't simply visiting history.

They are stepping into someone else's life.

---

## Quest 2 — “The Broken Vessel”

Eliab asks the player to help retrieve materials needed to repair pottery.

This introduces:

- exploration
- gathering
- crafting
- NPC interaction

The player collects:

- clay
- water
- fuel

Then makes a simple vessel.

This becomes the prototype's first crafting loop.

---

## Quest 3 — “The Robbers”

On the way back, the player encounters a small group of hostile NPCs.

This introduces combat.

The player learns:

- basic attack
- dodge
- positioning
- enemy targeting

The fight should be short.

Maybe:

**2–3 enemies maximum.**

The goal is to demonstrate the combat system, not create an RPG progression grind.

---

## ACT III — THE HIDDEN PLACE

After helping Eliab, the player learns about an unusual old object discovered
near the settlement.

Eliab tells the player:

> “Your counterpart knew something about this place.”

Now we begin tying the historical story to the Resonance mystery.

---

## Quest 4 — “The Buried Memory”

The player accompanies an NPC to an excavation location.

This is your first archaeology system.

The player:

1. identifies the excavation area
2. clears debris
3. brushes the artifact
4. extracts it
5. examines it

The artifact contains an inscription.

The player recognizes a Hebrew word.

### First Word of Power

For example:

- **אוֹר — Or**

Meaning:

> **Light**

The important thing is that the Word isn't merely a spell.

The player learns:

- its linguistic meaning
- its historical context
- its gameplay function
- its narrative importance

Exactly as the GDD specifies.

---

## Quest 5 — “Or”

The player discovers that the Word of Power can interact with their Macro.

The first Macro could be deliberately simple:

### OR — Light Strike

**Base stat:** Intelligence

**Word:** Or

**Effect:** Short-range burst of resonance energy.

This is where the game's unique gameplay identity first becomes obvious.

The player isn't merely pressing:

> “Fireball.”

They're combining a linguistic/historical discovery with a gameplay system.

---

## ACT IV — THE DISTURBANCE

Something is wrong.

The archaeological discovery causes a synchronization fluctuation.

Back in the modern world, the researchers notice it.

This is the first indication that:

> **The player isn't merely observing history.**

Their presence is affecting the Resonance.

---

## Quest 6 — “The Anchor”

The player follows clues to a small hidden location.

There they discover an ancient artifact.

The artifact is identical to an object currently being excavated in the modern world.

This is the prototype's major revelation.

The researchers realize:

### The artifact exists in both realities

That gives you your first true **Quantum Anchor**.

---

## ACT V — RETURN

The player's synchronization begins destabilizing.

Asha tells the player:

> “We need to pull you out. Now.”

The player has a short final sequence.

The world becomes unstable.

The player returns to the Kairos facility.

---

## Final Scene — The Impossible Artifact

The player wakes.

Miriam and the research team examine the recovered data.

Evelyn compares the ancient artifact to the modern archaeological record.

They match.

Daniel tries to explain it scientifically.

He can't.

Miriam asks:

> “What did you see?”

The player explains.

Miriam looks at the artifact.

Then:

> “Then we know where we're going next.”

Cut to a monitor showing another archaeological site.

**END OF PROTOTYPE.**

---

## 5. Prototype character roster

Keep the cast deliberately small.

### Modern

**Miriam Halevi**
Primary mentor.

**Evelyn Saroyan**
Archaeology/history.

**Daniel Kessler**
Scientific skeptic.

**Naomi Feld**
Language.

**Asha Raman**
Synchronization technology.

#### Ancient

**Eliab**
Primary companion.

**Mara**
Village NPC / personal relationship.

**Yosef**
Crafting NPC.

**Bandit Leader**
Combat antagonist.

**Elder**
Historical/contextual NPC.

That's enough.

---

## 6. The prototype gameplay loop

The finished prototype should establish this loop:

### Explore

↓

#### Talk

↓

#### Discover

↓

#### Gather

↓

#### Craft

↓

#### Fight

↓

#### Learn

↓

#### Unlock Word

↓

#### Build Macro

↓

#### Investigate

↓

#### Discover Artifact

↓

#### Return to Hub

↓

#### Advance Mystery

This is the core of Kairos.

---

## 7. Development schedule

I'd use **20 development milestones**, with each milestone representing
approximately one week.

This is more useful than assigning arbitrary “months” because you can move
milestones around depending on how much time you have.

---

### PHASE 1 — FOUNDATION

#### Week 1 — Production Setup

- **Coding**

- Clean Lesson 10 project
- Establish Git repository
- Create prototype branch
- Establish folder conventions
- Create basic game state structure

- **Story**

- Lock prototype premise
- Lock character roster
- Lock quest sequence
- Lock ending

- **Deliverable**

> Playable Lesson 10 baseline + locked prototype design document.

**Do not add gameplay yet.**

---

#### Week 2 — Player Controller

Build on your current movement/camera system.

Add:

- movement polish
- acceleration
- running
- dodge
- gamepad support
- camera tuning
- camera collision
- animation transitions

- **Deliverable**

> Player can move around a test environment and feels good to control.

#### Definition of Done

You should be able to play for five minutes without thinking:

> “The controls feel bad.”

---

## PHASE 2 — CORE GAMEPLAY

### Week 3 — Interaction Framework

Expand your existing interaction architecture.

Add:

- interactable types
- interaction prompts
- NPC interaction
- object interaction
- contextual interaction
- interaction locking

- **Deliverable**

> Player can approach objects/NPCs and interact consistently.

---

#### Week 4 — Dialogue System

Take the Lesson 10 dialogue system and turn it into a real narrative system.

Add:

- dialogue UI
- speaker names
- line progression
- portraits
- dialogue events
- branching support
- quest triggers
- dialogue completion events

Also fix the architecture so dialogue cannot accidentally skip the first line.

- **Deliverable**

> A complete 3–5 minute conversation works from beginning to end.

---

#### Week 5 — Quest System

Create a lightweight quest architecture.

You only need:

```text
Quest
 ├── Objectives
 ├── Progress
 ├── Completion
 └── Rewards
```

Prototype objectives:

- Talk to Eliab
- Collect clay
- Craft vessel
- Defeat enemies
- Investigate excavation
- Recover artifact
- Return to hub

- **Deliverable**

> One complete quest can start, progress, and finish.

---

## PHASE 3 — COMBAT

### Week 6 — Combat Prototype

Build the simplest possible combat system.

Player:

- attack
- dodge
- health
- damage

Enemy:

- detection
- approach
- attack
- damage
- death

Don't build elaborate AI.

- **Deliverable**

> One player can fight 2–3 enemies and win.

---

#### Week 7 — Combat Polish

Add:

- hit reactions
- attack timing
- invulnerability during dodge
- damage feedback
- death
- respawn
- enemy targeting

- **Deliverable**

> Combat feels like an action RPG rather than debugging an AI system.

---

## PHASE 4 — KAIROS SYSTEMS

### Week 8 — Progression

Implement:

#### Quantum Level

and

#### Sync Level

But keep them extremely simple.

For example:

```text
Quantum Level: 1
Sync Level: 1
```

Quantum XP persists.

Sync XP resets on death.

- **Deliverable**

> Player can gain progression and lose Sync progression through death.

---

#### Week 9 — Macro System

This is one of your most important milestones.

Create:

```text
Macro
 ├── Base Stat
 ├── Word
 ├── Modifier
 └── Effect
```

For the prototype:

#### Macro 1

- **Strength + basic attack**

#### Macro 2

- **Intelligence + Or**

But you only need one usable combat Macro for the finished prototype.

- **Deliverable**

> Player presses Y and performs a custom Macro ability.

---

#### Week 10 — Word of Power

Implement the first actual Word.

#### OR — “Light”

The player:

1. discovers it
2. learns it
3. unlocks it permanently
4. places it into a Macro
5. uses it

- **Deliverable**

> A Word discovered through exploration changes gameplay.

This is an important proof-of-concept.

---

## PHASE 5 — CAPERNAUM

### Week 11 — Environment Blockout

Build the entire Capernaum prototype using primitive geometry.

Do **not** wait for finished art.

Create:

- village
- shoreline
- workshop
- market
- excavation site
- combat area
- hidden artifact location

- **Deliverable**

> Entire prototype can be walked through from start to finish.

---

#### Week 12 — NPCs

Implement:

- Eliab
- Mara
- Yosef
- Elder
- enemies

Give them:

- dialogue
- interaction
- simple movement
- quest relationships

- **Deliverable**

> Capernaum feels populated.

---

#### Week 13 — Crafting

Implement pottery.

The complete loop:

```text
Find clay
   ↓
Collect clay
   ↓
Prepare clay
   ↓
Shape vessel
   ↓
Fire vessel
   ↓
Receive item
```

Keep the actual minigame extremely simple.

- **Deliverable**

> Player can make one useful object.

---

## PHASE 6 — ARCHAEOLOGY

### Week 14 — Archaeology Prototype

Build:

- excavation site
- dig interaction
- brush interaction
- artifact extraction
- artifact identification
- artifact inventory

You don't need realistic excavation physics.

- **Deliverable**

> Player discovers an artifact through an archaeology activity rather than
> picking it up from the ground.

---

#### Week 15 — Knowledge/Codex

Implement the first Knowledge system.

Entries might include:

- Capernaum
- pottery
- fishing
- Roman occupation
- Hebrew language
- Or
- artifact

Each entry can contain:

```text
Title
Description
Category
Discovery source
```

- **Deliverable**

> Exploration produces permanent knowledge.

---

## PHASE 7 — STORY

### Week 16 — Modern Hub

Build the Kairos Initiative room.

It only needs:

- synchronization chamber
- research station
- artifact table
- 4–5 researchers
- dialogue

The room can be tiny.

- **Deliverable**

> Player can enter the modern facility, interact with researchers, and begin the
> mission.

---

#### Week 17 — Synchronization Sequence

Build:

```text
Modern Hub
     ↓
Preparation
     ↓
Sync Chamber
     ↓
Visual distortion
     ↓
Capernaum
```

Then the return:

```text
Capernaum
     ↓
Synchronization failure
     ↓
Modern Hub
```

- **Deliverable**

> The player experiences the defining Kairos transition.

---

## PHASE 8 — COMPLETE VERTICAL SLICE

### Week 18 — Story Integration

Now connect everything.

The complete sequence should work:

- **Opening**

→ Modern Hub

→ Calibration

→ Synchronization

→ Capernaum

→ Eliab

→ Crafting

→ Combat

→ Archaeology

→ Word of Power

→ Macro

→ Artifact

→ Sync failure

→ Modern Hub

→ Ending

- **Deliverable**

> First complete playable version.

It will be ugly.

That's okay.

---

#### Week 19 — Polish

Now stop adding systems.

Fix:

- dialogue timing
- animations
- camera
- UI
- sound
- quest clarity
- bugs
- transitions
- pacing

Add:

- basic music
- ambient sound
- footsteps
- combat sounds
- environmental audio

- **Deliverable**

> Someone unfamiliar with the project can play it without your help.

This is a critical test.

---

#### Week 20 — Prototype Release

Create:

#### Kairos Prototype 0.1

Produce:

- Windows build
- controller support
- title screen
- settings
- credits
- tutorial
- complete story
- ending screen

Then playtest with several people.

Ask only:

1. Was it fun?
2. Was anything confusing?
3. Did the world feel interesting?
4. Did the Resonance concept make sense?
5. Did the Macro system feel unique?
6. Would you play the next zone?

- **Deliverable**

> A complete small-scale Kairos prototype that can be handed to someone else.

---

## 8. Your milestone roadmap

Here's the condensed version I'd keep beside you while developing:

| Week | Milestone   | Deliverable              |
| ---: | ----------- | ------------------------ |
|    1 | Production  | Locked prototype design  |
|    2 | Player      | Polished movement/camera |
|    3 | Interaction | Object/NPC interaction   |
|    4 | Dialogue    | Complete conversation    |
|    5 | Quests      | Functional quest chain   |
|    6 | Combat      | Basic combat             |
|    7 | Combat 2    | Polished combat/death    |
|    8 | Progression | Quantum + Sync           |
|    9 | Macros      | First functional Macro   |
|   10 | Words       | First Word of Power      |
|   11 | Capernaum   | Full blockout            |
|   12 | NPCs        | Populated village        |
|   13 | Crafting    | Pottery loop             |
|   14 | Archaeology | Excavation loop          |
|   15 | Knowledge   | Codex                    |
|   16 | Hub         | Kairos facility          |
|   17 | Resonance   | Sync transition          |
|   18 | Integration | Full playable slice      |
|   19 | Polish      | Playtest build           |
|   20 | Release     | Prototype 0.1            |

---

## 9. Story deliverables

I would actually maintain a separate story production schedule alongside the programming.

### Week 1

Lock:

- protagonist
- counterpart
- central mystery
- prototype ending

#### Week 2

Write:

- opening cutscene

#### Week 3

Write:

- modern facility dialogue

#### Week 4

Write:

- calibration dialogue

#### Week 5

Write:

- Eliab introduction
- first quest

#### Week 6

Write:

- combat encounter dialogue

#### Week 7

Write:

- crafting dialogue

#### Week 8

Write:

- archaeology dialogue

#### Week 9

Write:

- Word of Power discovery

#### Week 10

Write:

- Macro explanation

#### Week 11

Write:

- Capernaum ambient NPC dialogue

#### Week 12

Write:

- NPC conversations

#### Week 13

Write:

- pottery quest

#### Week 14

Write:

- excavation sequence

#### Week 15

Write:

- Codex entries

#### Week 16

Write:

- modern researchers

#### Week 17

Write:

- synchronization sequence

#### Week 18

Write:

- ending

#### Week 19

Edit everything.

#### Week 20

Freeze the script.

---

## 10. The story should have three mysteries

This is where I think Kairos can become substantially stronger.

Don't make the first prototype's mystery simply:

> “Can we travel into the past?”

That's answered almost immediately.

Instead, establish three layers.

### Mystery 1 — What is the Resonance?

The scientific mystery.

How is the player connecting to another reality?

---

#### Mystery 2 — Who was the player's counterpart?

The personal mystery.

Why does the ancient counterpart appear to know things about the player?

---

#### Mystery 3 — What is the artifact?

The larger narrative mystery.

Why does the same object appear to exist in both realities?

The prototype should answer **Mystery 1 partially**, introduce **Mystery 2**,
and end by opening **Mystery 3**.

That gives the eventual MMO somewhere to go.

---

## 11. The most important production rule

I would adopt one rule for this project:

> **Every new system must earn its place by improving the vertical slice.**

For example:

You might think:

> “I need an inventory system.”

Not necessarily.

You need:

> “The player needs to carry clay and an artifact.”

So implement the smallest inventory capable of doing that.

Likewise:

You don't need a complete MMORPG quest architecture.

You need:

> “Six quests can exist and progress reliably.”

You don't need a complete MMO networking architecture.

You need:

> “The game can eventually accommodate multiplayer without requiring me to
> rewrite everything.”

That distinction could save you **months**.

---

## 12. Architecture priority

Given where Lesson 10 currently is, I'd continue your existing ECS-oriented
architecture rather than throwing it away.

Your current project already has separate systems/components for things like:

- player input
- movement
- camera
- animation
- interaction
- dialogue
- entities

That is a good foundation.

I would next introduce systems roughly in this order:

```text
Input
 ↓
Movement
 ↓
Interaction
 ↓
Dialogue
 ↓
Quest
 ↓
Combat
 ↓
Health
 ↓
Progression
 ↓
Macro
 ↓
Archaeology
 ↓
Crafting
 ↓
Knowledge
 ↓
Sync
```

And keep presentation separate from gameplay logic wherever practical.

That will matter enormously if you eventually turn this into multiplayer.

---

## 13. Your definition of “done”

The prototype is **not done** when every system in the GDD exists.

It is done when you can give the build to somebody who knows absolutely nothing
about Kairos and they can:

1. Start the game.
2. Meet Miriam.
3. Understand what the experiment is.
4. Enter the ancient world.
5. Walk around Capernaum.
6. Talk to NPCs.
7. Complete a quest.
8. Gather something.
9. Craft something.
10. Fight something.
11. Discover an archaeological artifact.
12. Learn a Word of Power.
13. Use a Macro.
14. Discover the Quantum Anchor.
15. Return to the modern world.
16. Understand that something impossible has happened.
17. Reach the ending.
18. Want to know what happens next.

**If you accomplish that, you have proven Kairos.**

And importantly, you will have done it without needing to build the MMO first.

---

### Recommended next step

Given your current progression through **Lesson 10**, I would make **Week 1 the
next actual development lesson** rather than jumping straight into combat.

The next milestone should be:

> **Turn the Lesson 10 sandbox into the foundation of the actual Kairos prototype.**

That would mean I can take the Lesson 10 architecture you currently have and lay
out **Lesson 11 as a complete step-by-step implementation**, including the
folder structure, components, systems, scenes, and full source code, while
simultaneously beginning the Capernaum vertical slice.
