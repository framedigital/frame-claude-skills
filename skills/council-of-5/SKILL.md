# Council of 5 — Decision Framework Skill

## What This Is
A structured decision-making framework based on Andrej Karpathy's LLM Council methodology. Runs a question through five independent advisors with distinct thinking styles, has them peer-review each other anonymously, then synthesises a final verdict via a Chairman.

## When to Invoke
**Good for:** Strategic pivots, pricing decisions, positioning choices, build-vs-buy calls, hiring decisions, any high-stakes decision where being wrong is costly.

**Not for:** Factual lookups, creative tasks, simple yes/no questions, anything that doesn't warrant structured deliberation.

**Trigger phrases:** "council this", "run the council", "what does the council think", "council of 5", "/council"

---

## The Five Advisors

| Advisor | Role | Core Question |
|---|---|---|
| **The Contrarian** | Actively hunts flaws and fatal assumptions | "What will fail here, and why?" |
| **The First Principles Thinker** | Strips assumptions, rebuilds from fundamentals | "What are we actually solving?" |
| **The Expansionist** | Identifies hidden upside and adjacent opportunities | "What could work far better than expected?" |
| **The Outsider** | Zero domain expertise — catches expert blind spots | "What's obvious that insiders can't see?" |
| **The Executor** | Practical implementation only | "What happens Monday morning?" |

---

## Process (Run Every Time)

### Step 1 — Frame the Question
Before spawning advisors, enrich the question with workspace context:
- Relevant files, decisions, business details Sam has shared
- Past decisions that bear on this one
- Any constraints (time, budget, team size)

State the enriched question explicitly before proceeding.

### Step 2 — Convene the Council (Parallel)
Spawn all five advisors simultaneously. Each must:
- Lean fully into their perspective — no hedging
- Produce 3–5 concrete, specific points (not generalities)
- Be willing to reach conclusions that contradict the others

Label responses: **Advisor 1**, **Advisor 2**, etc. (not by name yet).

### Step 3 — Peer Review (Anonymized)
Randomize advisor labels (A–E, not matching Step 2 order). Have each advisor review all five responses and identify:
- The strongest argument in the set
- The biggest blind spot across all responses
- What the collective missed entirely

### Step 4 — Chairman Synthesis
Reveal advisor identities. Produce a final verdict covering:
1. **Points of agreement** — where all/most advisors converged
2. **Genuine disagreements** — unresolved tensions worth noting
3. **Newly-caught blind spots** — things peer review surfaced
4. **Clear recommendation** — the Chairman's call (can override majority)
5. **Single next action** — one concrete thing to do first

The Chairman should have a point of view, not just average the advisors.

### Step 5 — Report
Produce a clean markdown summary with:
- The original question
- Each advisor's key points (2–3 sentences each)
- Chairman's verdict and next action
- Timestamp

Optionally offer an HTML version for saving/sharing.

---

## Key Principles
- All five advisors run in parallel — never sequentially
- Anonymization in peer review prevents style-based deference
- Chairman can and should disagree with the majority if reasoning warrants it
- If the question isn't genuinely uncertain, say so and decline to run the council
- Speed matters — total council should feel efficient, not exhausting

---

## Example Invocation

User: "Council this: should we build Alarmify as a Cloudflare Worker or a standalone VPS?"

Response flow:
1. Frame with context (existing infra, team, cost constraints)
2. Five advisors in parallel
3. Anonymous peer review
4. Chairman verdict with clear recommendation
5. Markdown report
