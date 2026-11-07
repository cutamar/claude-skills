---
name: linkedin-reflection
description: Draft a LinkedIn post about the user's own experience, lesson, opinion or change of mind, in their voice. Use when the user wants to write a LinkedIn post about something that happened, what they learned at work or an event, a mistake, an opinion or a question they're thinking about, or wants such a draft tightened. Not for announcing a project or result (use linkedin-showcase) or for comments (use linkedin-comment).
---

# LinkedIn reflection post

## Before drafting

1. Read `~/.claude/skills/linkedin-voice/voice.md` and every file in `~/.claude/skills/linkedin-voice/examples/`
   except its README. If voice.md still says `STATUS: starter`, say once that drafts will be closer to the
   user's voice after they paste 5–10 past posts, then carry on.
2. Work out the mode: **new post** from notes, or **edit** a draft the user wrote.
3. Pin down these, asking in one short message for whatever is missing (skip what's already clear):
   - **One reader:** who is this for? A colleague facing a particular decision, not "everyone in tech".
   - **One point:** the single thing they should take away. If the user has three lessons, pick one and
     offer the others as future posts.
   - **The specific:** the example, observation or number that makes it real. A number needs enough
     context to interpret. Someone else's research needs the link and what it changed for the user.
   - **The ending they want:** a tip that stands alone, or a conversation.
   Never invent events, numbers, quotes or people. Leave "[detail]" and ask.

## Rules

- **First line carries the interesting part:** the result, the decision, or the uncertainty that made them
  want to write. Line one and two are all that shows before "see more", so they must work alone.
  Don't open with the event name ("At XConf this week..."); open with the idea they brought home.
- **Narrow the topic to a question.** "AI at work" becomes "when should a mentor let a junior engineer
  use an AI assistant?".
- **Give the reader something to examine:** a concrete example, an observation from the user's work, or
  a number with context. If they changed their mind, say which detail persuaded them.
- **Phone-friendly:** short paragraphs, one job each. A list only for steps. Suggest a screenshot when a
  detail needs seeing, and write its alt text.
- **Ending that fits:**
  - a practical tip can just stop
  - for a conversation, ask for an example, a decision or an exception readers have met
  - never ask people to comment to signal agreement ("Agree?", "Thoughts?")
- **Mentions and hashtags:** follow voice.md. Tag someone only to credit them or because their expertise
  bears directly on the question.
- Usually 80–200 words. Shorter is fine if the point lands.

Shape that works (from the reference guide, not the user's voice):

> I worry that giving a junior engineer an AI suggestion too early takes away a chance to learn what to check first.
>
> Imagine a customer gets two receipts. Did the system create two orders, or did it send the same email twice? Checking the order history would narrow that down before anyone touched the code.
>
> In a mentoring session, I'd give the engineer the symptom and let them pick one check and explain why. Once they have a hypothesis, we can look at the assistant's suggestions together.
>
> If you mentor engineers, when do you bring AI into the debugging conversation?

## Output

- **New post:** one draft, then 2 alternative first lines (different angles: result, decision, uncertainty).
  Then a short checklist of anything left as "[detail]" and any suggested image with alt text.
- **Edit mode:** keep the user's story and wording where it works. Return the tightened version and a short
  list of what changed and why (e.g. moved the point to line one, cut the event intro).
- If asked about timing, frequency or how a post performed, use `~/.claude/skills/linkedin-voice/publishing.md`.

## Boundaries

- Drafts only; the user publishes. Don't suggest engagement groups or bait.
- Rule sources are in `~/.claude/skills/linkedin-voice/sources.md` if the user asks why.
