---
name: linkedin-comment
description: Draft a LinkedIn comment on someone else's post, or a reply to a comment on the user's own post, in the user's voice. Use when the user pastes a LinkedIn post or comment (or a link) and wants to respond, asks "what should I comment", "help me reply", or wants their own comment draft tightened. Not for writing the user's own posts (use linkedin-reflection or linkedin-showcase).
---

# LinkedIn comment

## Before drafting

1. Read `~/.claude/skills/linkedin-voice/voice.md` and every file in `~/.claude/skills/linkedin-voice/examples/`
   except its README. If voice.md still says `STATUS: starter`, say once that drafts will be closer to the
   user's voice after they paste 5–10 past posts or comments, then carry on.
2. Get the post text. If the user only gave a link, try to fetch it; if that fails (LinkedIn usually needs
   a login), ask them to paste the text. Never comment on a post you haven't read.
3. Work out the mode: **comment** on someone else's post, **reply** to someone who commented on the
   user's post, or **edit** a draft the user wrote.
4. Ask only if needed: what the user wants to add (their experience, a disagreement, a question). If they
   gave no angle, propose one from the post and the user's background in the examples. Never invent
   experience for them: write "[your example]" where a personal fact belongs and ask for it.

## Rules for a comment

- **Open with the detail you're responding to.** Name the decision, result or phrase that caught your eye.
- **Add one thing another reader can use**, one of:
  - ask for a missing detail
  - offer a different view with the condition that changes the advice
  - give an example from the user's own work
  - specific appreciation: what was useful and why
- **Disagree so it's easy to answer.** Describe the situation where you'd choose differently and give
  the reason. No "Actually..." and no lecturing.
- **Questions:** remind the user to skim the thread first in case the author already answered it.
- **Length:** 1–4 sentences. Add a link only when it is evidence or something someone asked for.
- None of the "Never write this" items in voice.md, especially generic praise or restating the post.

Shapes that work (from the reference guide, not the user's voice):

- Missing detail, on a post about faster releases: "When you measured release time, did the clock stop at
  deployment or when customers could use the feature? A feature flag can put those events days apart."
- Different view, on measuring training: "For a mandatory course, completion tells me who reached the end.
  I'd also check whether someone can do the task unaided a week later."
- Specific appreciation, on research: "Including the failed runs alongside the final benchmark helped me
  see where I could trust the result. I'd have missed that from the average alone."

## Rules for a reply on the user's own post

- Answer their question directly, in the first sentence.
- If they offer a counterexample, say how it affects the user's thinking, including where it changes
  the advice. Example: "Good point about incidents. During an outage I'd bring in help immediately. I'd save
  the exercise for the debrief, when we can give the junior engineer the first alert and ask what they'd check."
- Thank people by engaging with what they said, not with "Thanks for your comment!".

## Output

- **Comment / reply mode:** 2–3 options of different lengths or angles (e.g. one-line question, two-sentence
  view, three-sentence example). Label each with its angle in a few words. Then one line on which you'd pick.
- **Edit mode:** keep the user's point and wording where it works. Return the tightened version, then a
  short list of what changed and why. Don't rewrite into a different comment.

## Boundaries

- Drafts only. The user posts comments personally. Don't build or suggest automated commenting, scheduled
  comment batches, or engagement groups that trade likes or comments: LinkedIn acts against both.
- Using AI to polish is fine as long as the idea is one the user can explain themselves. If the user has no
  view on the post, say so rather than manufacturing one.
- Rule sources are in `~/.claude/skills/linkedin-voice/sources.md` if the user asks why.
