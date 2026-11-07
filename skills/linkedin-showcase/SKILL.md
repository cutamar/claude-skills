---
name: linkedin-showcase
description: Draft a LinkedIn post about something the user built, shipped, published or achieved (a project, tool, open-source release, paper, talk, result or milestone), in their voice and without sounding like an ad. Use when the user wants to share or announce work on LinkedIn ("post about my project", "I launched X", "write a LinkedIn post for this repo"), or wants such a draft tightened. Not for personal lessons (use linkedin-reflection) or comments (use linkedin-comment).
---

# LinkedIn showcase post

The hard part is showing the work without sounding like an ad. The reader should come away knowing
something useful even if they never click the link.

## Before drafting

1. Read `~/.claude/skills/linkedin-voice/voice.md` and every file in `~/.claude/skills/linkedin-voice/examples/`
   except its README. If voice.md still says `STATUS: starter`, say once that drafts will be closer to the
   user's voice after they paste 5–10 past posts, then carry on.
2. Work out the mode: **new post**, or **edit** a draft the user wrote.
3. Gather facts. If the work is in a repo or file you can read (README, changelog, demo), read it first.
   Then ask in one short message for whatever is still missing. **Do not draft until you have the
   problem, a concrete result, and the credits**; showcase posts are where invented facts do most damage.
   - **Reader:** who would use this or care, and what decision does it help them with?
   - **Problem:** what was annoying, slow, broken or unknown before?
   - **What they made:** in one plain sentence. No feature list.
   - **Result:** a number, before/after, or a concrete observation, with enough context to interpret it
     (sample size, compared to what, measured how). If there's no number yet, an honest observation is fine.
   - **What they learned or what surprised them**, including what didn't work.
   - **Credits:** who helped, whose work it builds on. Real names/handles only.
   - **Link** and **visual:** repo, demo, paper; screenshot, chart or short video they have or could make.

## Rules

- **First line is the result or the problem, not the announcement.** "Our test suite went from 40 to 9
  minutes" beats "I'm excited to share my new tool". Lines one and two must work alone before "see more".
- **Structure:** problem → what they made → concrete result → what they learned → link. Bend it if the
  story needs, but keep the result early.
- **Show, don't sell:** no superlatives, no "game-changer", no feature dumps, no calls to "check it out!!".
  One sentence on what it does, then evidence. Mention a limitation or what's next; it builds trust.
- **Numbers need context.** "3× faster" needs "than what, on what". Link the source if it's someone
  else's research and say what it changes for the user.
- **Credit generously.** Tag contributors and projects it builds on. Don't tag people only for reach.
- **Phone-friendly:** short paragraphs, one job each. A list only for steps or a few parallel items.
- **Visual:** suggest a screenshot when readers need to see a detail, or a short video for a
  demonstration. Always write descriptive alt text; remind them to check video captions.
- **Ending that fits:** the link and a stop is fine. For a conversation, ask for an example, a use case or
  an exception ("Where would this break for your setup?"), never agreement-bait.
- **Hashtags and mentions:** follow voice.md.
- Usually 100–220 words.

## Output

- **New post:** a full draft, a shorter version (under ~80 words), and a suggested visual with its alt text.
  Then list anything left as "[detail]".
- **Edit mode:** keep the user's facts and wording where they work. Return the tightened version and a short
  list of what changed and why (e.g. moved the result to line one, cut two adjectives, added credit).
- If asked about timing, frequency or how a post performed, use `~/.claude/skills/linkedin-voice/publishing.md`.

## Boundaries

- Drafts only; the user publishes. Don't suggest engagement groups or bait.
- Rule sources are in `~/.claude/skills/linkedin-voice/sources.md` if the user asks why.
