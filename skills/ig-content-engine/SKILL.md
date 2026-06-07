# /ig-content-engine — Instagram Content Autopilot

Scan what's working → generate content via Higgsfield → schedule and post. AI-driven content engine for Frame client accounts and The Wolf Gang without manual overhead.

## Trigger
Use when the user says `/ig-content-engine`, "generate Instagram content", "create posts for [account]", "autopilot Instagram", or "content pipeline".

## What It Does
1. **Analyzes** what formats and topics are currently driving engagement (from the Instagram research DB)
2. **Generates** video/image content using Higgsfield (matching proven formats)
3. **Drafts** captions with hooks optimized for the account's audience
4. **Stages** content for review before any posting
5. **Posts** via Chrome automation after explicit confirmation

---

## Step 1 — Trend Analysis

Pull current intelligence from the research database:
```bash
curl -s "http://localhost:3002/api/saved-posts?limit=50"
curl -s "http://localhost:3002/api/items?status=new&priority=high&limit=20"
```

Identify:
- Top 3 content formats performing well (carousel, reel, static)
- Top 3 topics/hooks appearing across multiple sources
- Aesthetic patterns (lighting, color, pacing, text overlay style)
- Call-to-action patterns that are working

Output: **Trend Report** (5 bullets, max 100 words)

---

## Step 2 — Content Brief

For each piece to generate, define:

```
TYPE: [reel / static / carousel]
HOOK: [first 3 seconds or headline — must be scroll-stopping]
FORMAT: [talking head / b-roll / product showcase / text-on-video / faceless]
TOPIC: [what the content teaches/shows/sells]
CTA: [follow / link in bio / DM me / save this]
AESTHETIC: [reference existing winning post URL if available]
ACCOUNT: [The Wolf Gang / Frame / client name]
```

**Wait for approval on the brief before generating.**

---

## Step 3 — Generate Content (Higgsfield)

Based on the brief, use the appropriate Higgsfield generation mode:

### For Reels / Short Videos
Use `/higgsfield-generate` with Seedance 2.0 or Soul V2:
- If product content → product video mode
- If faceless educational → Seedance with text overlay
- If UGC-style → Marketing Studio with avatar

### For Static Posts
Use `/higgsfield-generate` with GPT Image 2:
- Product hero shots
- Lifestyle images
- Quote/text graphics with brand aesthetic

### For Carousels
Generate 6-8 slides as individual images with consistent visual treatment:
- Slide 1: Hook (big bold statement)
- Slides 2-6: Value delivery
- Slide 7: CTA slide

---

## Step 4 — Caption Writing

Write caption using this structure:
```
[HOOK LINE — matches visual hook]

[2-3 lines of value/story]

[Soft CTA]

[Hashtags: 5-8 specific + 2-3 broad, no spam tags]
```

Tailor voice to the account:
- **The Wolf Gang**: minimal, confident, aesthetic-first, no emoji excess
- **Frame**: authoritative, behind-the-scenes, founder POV, slightly technical
- **Client accounts**: match their established voice

---

## Step 5 — Stage for Review

Present the complete content package:
```
📹 VIDEO/IMAGE: [file or generation result]
📝 CAPTION:
[full caption text]

📊 PREDICTED PERFORMANCE:
- Hook strength: [1-10]
- Format match to trend: [yes/no + reason]
- Best time to post: [day + time for this account]

Approve to post? [yes / revise / skip]
```

**Never post without explicit approval in chat.**

---

## Step 6 — Post via Chrome Automation

Only after approval, use `/instagram comment` flow (adapted for posting):
1. Navigate to Instagram in Chrome
2. Go to Creator Studio or direct post upload flow
3. Upload the generated content
4. Paste the caption
5. **Second confirmation before hitting Post**

---

## Accounts in Scope
- `@thewolfgangofficial` — fashion brand, aesthetic-first, TWG audience
- `@framecreativeagency` (or equivalent) — agency brand, B2B, founders/CMOs
- Client accounts as briefed per project

---

## Usage
```
/ig-content-engine                          # Analyze + generate a content batch
/ig-content-engine wolf-gang               # Generate for The Wolf Gang specifically
/ig-content-engine frame                   # Generate for Frame agency
/ig-content-engine [client] reel           # Generate a reel for a named client
/ig-content-engine analyze                 # Just the trend analysis, no generation
```

---

## Rate Limits & Safety
- Max 3 posts per day per account via automation
- Always stage for human review — never fully autonomous posting
- If Instagram shows any challenge screen, STOP and alert user
- Captions must be reviewed — do not post AI captions verbatim without human pass
