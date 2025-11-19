---
marp: true
title: Real-world Experiences with AI-Assisted Development
paginate: true
footer: "Real-world Experiences with AI-Assisted Development"
theme: gaia
---

<!-- IMAGE: images/compass.png
IMAGE PROMPT: A hand-drawn pencil illustration of an old brass compass lying on a blank page, clear N-E-S-W markings, light shadow, off-white paper background, no text.
-->
![bg right:40%](images/compass.png)

# Real-world Experiences with AI-Assisted Development

* Vibes, agents, and real code
* Patterns *and* traps we've seen

<!--
NOTES:
Set the tone: “This is a field report, not a hype talk.”

Explain:
- We’ve all used AI for coding by now.
- This talk is about what actually happens in day-to-day work.
- Equal focus on patterns and anti-patterns.

Tie to compass:
“Tools are the engine. We’re still responsible for direction. Today is about sharpening that sense of direction.”
-->

---

<!-- IMAGE: images/lighthouse.png
IMAGE PROMPT: A hand-drawn pencil illustration of a lighthouse on a rocky shore, light beam cutting through clouds, small figures at the bottom looking up, off-white paper background, no text.
-->
![bg left:40%](images/lighthouse.png)

## Why talk about this now?

* AI is no longer a toy
* Practices are still fuzzy

<!--
NOTES:
Frame the moment.

Mention:
- AI assistants are in most IDEs and editors now.
- Many teams are using them daily, not as an experiment.
- But our working agreements and practices lag behind.

Point at lighthouse:
“We’re shining light on where AI genuinely helps and where it quietly increases risk.”
-->

---

<!-- IMAGE: images/bridge.png
IMAGE PROMPT: A hand-drawn pencil illustration of a sturdy bridge spanning a gap, small figures walking across, simple clouds in the background, off-white paper background, no text.
-->
![bg right:40%](images/bridge.png)

## Where we’ll go

* Quick framing
* Patterns that keep you fast *and* safe
* Anti-patterns that quietly hurt you

<!--
NOTES:
Keep this brief.

Emphasize:
- Not a tool comparison.
- We’ll stay tactical: prompts, workflows, code review, agents.
- Aim: 2–3 concrete changes people can try next week.

Bridge metaphor: architects/devs create paths across uncertainty; AI just changes how we build that bridge.
-->

---

<!-- IMAGE: images/dev-robot-pair.png
IMAGE PROMPT: Hand-drawn pencil illustration of a software developer and a small friendly robot sitting side by side at a desk, both looking at the same laptop screen, collaborative feel, off-white paper background, no text.
-->
![bg left:40%](images/dev-robot-pair.png)

## How we’re using AI today

* Inline suggestions
* Chat- and agent-based “vibe coding”

<!--
NOTES:
Describe the spectrum:

- Inline: Copilot-style completions, boilerplate, API reminders.
- Vibe coding: natural-language “build me X” flows in a chat.
- Agents: tools that edit multiple files, run tests, touch config.

Punchline:
“Across all of these, responsibility hasn’t moved. We still sign off on the change; AI just changes how the change is produced.”
-->

---

<!-- IMAGE: images/map-pencil.png
IMAGE PROMPT: Hand-drawn pencil illustration of a hand holding a pencil over a simple map or blueprint with a clear route marked, off-white paper background, no text.
-->
![bg right:40%](images/map-pencil.png)

## Pattern 1 – Start with a clear intent

* One tight paragraph of *what* & *why*
* Call out constraints explicitly

<!--
NOTES:
Core idea: most “hallucination” is underspecified intent.

Suggest prompt structure:
- What you want.
- Where it lives (which module/layer).
- Constraints (language, framework, performance, security).
- Non-goals (“don’t touch auth”, “don’t change DB schema”).

Example:
“Implement a POST /users endpoint in our existing Spring Boot API. Use the existing User entity, don’t touch auth, return 400 on validation errors.”

Line:
“The model doesn’t know your system; it only knows your words. Be generous with intent.”
-->

---

<!-- IMAGE: images/lego-blocks.png
IMAGE PROMPT: Hand-drawn pencil illustration of several simple building blocks stacked in small groups, suggesting modular pieces that can be rearranged, off-white paper background, no text.
-->
![bg left:40%](images/lego-blocks.png)

## Pattern 2 – Keep asks small

* One function, one test, one endpoint
* Avoid “whole feature in one go”

<!--
NOTES:
Explain why smaller prompts win:

- Limited attention → big requests get fuzzy answers.
- Small units are easier to test and review.
- Keeps diffs and rollback manageable.

Example contrast:
Bad: “Build the entire registration flow front to back.”
Better: “Implement the email verification step for existing registration flow.”

Phrase:
“Think in AI-sized bricks, not full buildings.”
-->

---

<!-- IMAGE: images/test-tubes.png
IMAGE PROMPT: Hand-drawn pencil illustration of a simple lab scene: test tubes in a stand and a checklist beside them, symbolizing experiments and tests, off-white paper background, no text.
-->
![bg right:40%](images/test-tubes.png)

## Pattern 3 – Let tests & contracts steer

* Start from tests, examples, or types
* Use them as the AI’s fitness function

<!--
NOTES:
Connect to TDD and fitness functions.

Workflow example:
1. Write or have the AI draft tests for a behavior.
2. Tighten the tests.
3. Ask the AI to implement until tests pass.

Call out:
- Types and clear interfaces also act as constraints.
- This works especially well with agentic tools that auto-run tests.

Line:
“Tests aren’t just for humans anymore — they’re how we talk to the AI about what ‘good’ looks like.”
-->

---

<!-- IMAGE: images/dev-robot-pair.png
IMAGE PROMPT: (reuse) Hand-drawn pencil illustration of a software developer and a small friendly robot sitting side by side at a desk, both looking at the same laptop screen, collaborative feel, off-white paper background, no text.
-->
![bg left:40%](images/dev-robot-pair.png)

## Pattern 4 – Treat AI like a keen junior

* Ask for the plan before the code
* Use it for options, not final truth

<!--
NOTES:
Lean into the metaphor.

Suggested flow:
- “Propose a plan for implementing X.”
- “List 2–3 approaches with trade-offs.”
- THEN ask it to implement the approach you choose.

Benefits:
- Surfaces misunderstandings early.
- Keeps you in control of design.
- Produces better explanations for reviewers.

Line:
“If you wouldn’t let a new grad silently rewrite a core module, don’t let the AI do it either.”
-->

---

<!-- IMAGE: images/diff-view.png
IMAGE PROMPT: Hand-drawn pencil illustration of two sheets of paper side by side with a few highlighted lines connecting between them, representing a code diff, off-white paper background, no text.
-->
![bg right:40%](images/diff-view.png)

## Pattern 5 – Keep changes reviewable

* Small, coherent diffs
* Explainable in one sentence

<!--
NOTES:
Tie to GitHub / PR reality.

Key ideas:
- Constrain prompts so changes stay local.
- Commit in steps: “add validation”, “extract helper”, etc.
- Use PR templates to tag AI-assisted bits.

Example:
“This PR: AI generated the initial handler; I simplified the logic and added tests.”

Punchline:
“AI can write a lot of code quickly. The bottleneck is still human comprehension — optimize for that.”
-->

---

<!-- IMAGE: images/sketch-lab.png
IMAGE PROMPT: Hand-drawn pencil illustration of a messy workbench with sketches, sticky notes, and a coffee mug, giving a prototype “lab” feel, off-white paper background, no text.
-->
![bg left:40%](images/sketch-lab.png)

## Pattern 6 – Spike with vibes, then sanitize

* Vibe-code spikes are fine
* Rewrite anything that survives

<!--
NOTES:
Make vibe coding situational, not forbidden.

Explain:
- Use full-on vibe mode for exploration: prototypes, “could this work?” ideas.
- Treat spike code as disposable.
- If it becomes real, re-implement or refactor with tests and structure.

Story:
Share a “weekend project that escaped into prod” and the pain that followed vs. a deliberate rewrite.

Line:
“Let AI help you find the shape of the solution. Just don’t confuse the sketch with the final drawing.”
-->

---

<!-- IMAGE: images/tangled-yarn.png
IMAGE PROMPT: Hand-drawn pencil illustration of a tangled ball of yarn with threads going in many directions, off-white paper background, no text.
-->
![bg right:40%](images/tangled-yarn.png)

## Anti-pattern 1 – Vague, multi-ask prompts

* “Do everything” instructions
* No context, no constraints

<!--
NOTES:
Reinforce the opposite of Pattern 1 & 2.

Examples:
- “Make a login system with metrics and tests.”
- “Modernize this service and add observability.”

Typical outcome:
- The AI picks defaults that don’t fit your stack.
- It forgets parts of the ask.
- You spend time untangling (point at yarn).

Smell:
Lots of “and also…” in one prompt.
-->

---

<!-- IMAGE: images/excavator-building.png
IMAGE PROMPT: Hand-drawn pencil illustration of a large excavator or bulldozer awkwardly parked next to a delicate building, suggesting overpowered tools for a precise job, off-white paper background, no text.
-->
![bg left:40%](images/excavator-building.png)

## Anti-pattern 2 – One-shot repo surgery

* Agents touching dozens of files
* Hard to review or roll back

<!--
NOTES:
Paint the scenario:

- “Migrate everything to framework X.”
- Agent changes 40 files, configs, build scripts.
- Reviewers are overwhelmed; subtle breakages appear later.

Recommend:
- Limit scope: one module or feature at a time.
- Human checkpoints between agent runs.

Line:
“Use the excavator for the parking lot, not for adjusting the picture frames inside the house.”
-->

---

<!-- IMAGE: images/noise-vs-signal.png
IMAGE PROMPT: Hand-drawn pencil illustration split in two: on the left a chaotic wall of scribbles, on the right a single clear signal wave or beam, off-white paper background, no text.
-->
![bg right:40%](images/noise-vs-signal.png)

## Anti-pattern 3 – Context stuffing

* “Here’s 20 files, just in case”
* Signal buried under noise

<!--
NOTES:
Explain why “more context” isn’t automatically better:

- Models have a limited window and attention.
- Irrelevant code dilutes important code.
- Prompts become slower and less accurate.

Practical tip:
- Only include the files actually touched by the change.
- If unsure what’s relevant, first ask: “Which files matter for X?” then start a new, clean thread.

Analogy:
“It’s like answering a simple question while someone hands you their entire filing cabinet.”
-->

---

<!-- IMAGE: images/loop-arrow.png
IMAGE PROMPT: Hand-drawn pencil illustration of a person walking in a small circular path marked by arrows, looking confused, off-white paper background, no text.
-->
![bg left:40%](images/loop-arrow.png)

## Anti-pattern 4 – Staying in a bad thread

* Conversation stuck in wrong framing
* You keep patching instead of restarting

<!--
NOTES:
Talk about sunk-cost with chats.

Signs:
- AI keeps repeating wrong assumptions.
- Prompts get longer and more defensive.
- Answers feel increasingly off.

Advice:
- Don’t be sentimental; start a fresh chat.
- Copy only the clarified requirements, not the whole history.

Line:
“Sometimes the most productive thing you can do is close the tab and start over.”
-->

---

<!-- IMAGE: images/red-flag.png
IMAGE PROMPT: Hand-drawn pencil illustration of a prominent warning flag planted next to a sheet of code or an abstract document, off-white paper background, no text.
-->
![bg right:40%](images/red-flag.png)

## Anti-pattern 5 – Blind copy-paste

* Code pasted without review
* No tests, no run, no understanding

<!--
NOTES:
Probably the most important anti-pattern.

Stories:
- AI-generated code that compiled but had subtle logic bugs.
- Security smells: unsafe SQL, naive crypto, etc.

Guidelines:
- Always read AI-generated code you commit.
- Run it. Add or update tests.
- If it’s too complex to understand, ask the AI to simplify.

Line:
“You’re still accountable for this code in production, regardless of who typed it.”
-->

---

<!-- IMAGE: images/robot-control-panel.png
IMAGE PROMPT: Hand-drawn pencil illustration of a complex control panel with many switches and a cute robot reaching for all of them at once, a human hand nearby about to stop it, off-white paper background, no text.
-->
![bg left:40%](images/robot-control-panel.png)

## Anti-pattern 6 – Over-trusting agents

* No boundaries on what they can touch
* Tests, config, commits all on autopilot

<!--
NOTES:
Differentiate “helpful agent” from “unsupervised agent”.

Examples:
- Agents that “fix tests” by deleting them.
- Config changes that work locally but break CI/prod.

Recommendations:
- Restrict what agents can modify in one run.
- Require human approval for commits/merges/deploys.
- Use agents for repetitive edits, not architectural decisions.

Line:
“Today’s agents are powerful, not wise. Wisdom still has to come from us.”
-->

---

<!-- IMAGE: images/puzzle-fit.png
IMAGE PROMPT: Hand-drawn pencil illustration of a few puzzle pieces coming together to form a simple shape, off-white paper background, no text.
-->
![bg right:40%](images/puzzle-fit.png)

## Putting it together

* Use AI where speed helps
* Keep humans owning intent & acceptance

<!--
NOTES:
Synthesize without re-listing everything.

Three roles for humans:
- Decide what’s worth building (intent).
- Shape boundaries: modules, contracts, tests.
- Accept or reject changes.

Connect to puzzle:
“AI is one more powerful piece. It only works when it locks into a clear structure around it.”
-->

---

<!-- IMAGE: images/checklist.png
IMAGE PROMPT: Hand-drawn pencil illustration of a clipboard with a short checklist and a pencil, a couple of items ticked, off-white paper background, no text.
-->
![bg left:40%](images/checklist.png)

## What to try next week

* Formalize 1–2 patterns as team norms
* Name & retire 1–2 anti-patterns

<!--
NOTES:
Make it actionable.

Examples:
- Add a small “AI usage” section to your team README or PR template.
- Try a rule like “ask for plan before code” for one sprint.
- Explicitly call out blind copy-paste as a red flag in reviews.

Encourage small steps:
“You don’t need an AI policy framework to start. A couple of good habits, consistently applied, already move the needle.”
-->

---

<!-- IMAGE: images/questions.png
IMAGE PROMPT: Hand-drawn pencil illustration of two people standing and talking, with a couple of question marks lightly sketched above them, off-white paper background, no text.
-->
![bg right:40%](images/questions.png)

# Q & A

* Stories, questions, disagreements welcome

<!--
NOTES:
Invite conversation.

Good prompts:
- “What’s the best thing your assistant has done for you?”
- “What’s the scariest thing it’s done?”
- “Which pattern or anti-pattern feels most relevant in your team?”

Use their stories to reinforce that everyone is still figuring this out together.
-->