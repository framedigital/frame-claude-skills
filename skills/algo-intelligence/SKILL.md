---
name: algo-intelligence
description: Instagram/TikTok algorithm intelligence system — scrapes top-performing posts using Apify, ranks them with Python, fans out Claude subagents to transcribe and break down every video, and outputs an HTML report with hooks, engagement stats, and outlier scores. Use for content strategy, competitive analysis, or before any major content push. Triggers on "hack the algo", "what's performing", "content intelligence", "viral analysis", "competitor research", "what should I post". Source: @jasoncooperson / youtu.be/Cz188XkMefQ
---

# Algo Intelligence System

Reverse-engineer what's working in any niche. Scrapes top posts, ranks by performance, fans out Claude subagents to analyze every video, and delivers a ranked HTML report with hooks, engagement data, and outlier scores.

**Source**: [@jasoncooperson](https://www.instagram.com/p/DZQZOVhgNvK/) | Full breakdown: [youtu.be/Cz188XkMefQ](https://youtu.be/Cz188XkMefQ)

## Stack
- **Apify** — scrapes recent posts per creator account
- **Python** — ranks posts, flags outliers (5x+ above creator average)
- **Claude subagents** — transcribes and breaks down each top video
- **Output** — clean HTML report with all data

## What the Report Contains
- Hook analysis (first line / first 3 seconds)
- Engagement stats (likes, comments, shares, view rate)
- Outlier score (how much it outperformed the creator's average)
- Structure breakdown (format, pacing, CTA)
- Why it worked (emotional trigger, novelty, etc.)

## Setup

### 1. Configure Apify
```bash
# Sign up at apify.com (free tier available)
export APIFY_API_TOKEN="your_token_here"

# Test the Instagram scraper
apify call apify/instagram-scraper --input '{"usernames": ["testaccount"]}'
```

### 2. Install Python Dependencies
```bash
pip install apify-client pandas requests
```

### 3. Run the System
```
/algo-intelligence [niche] [account1] [account2] [account3]
```

## Workflow

### Step 1 — Define Targets
Ask the user:
- Which 3-10 creator accounts to analyze?
- Timeframe (last 7 / 30 / 90 days)?
- Platform (Instagram, TikTok, YouTube)?

### Step 2 — Scrape & Rank
```python
# Apify scrapes last N posts per account
# Python script ranks + grabs top 3 per creator by outlier score
# Flags any post beating creator average by 5x+
```

### Step 3 — Fan Out Subagents
For each top post, Claude spawns a subagent to:
- Transcribe audio if it's a video
- Break down hook, structure, CTA
- Score why it performed (0-10 on novelty, emotion, clarity, relatability)

### Step 4 — Generate HTML Report
Final output includes:
- Ranked list of all analyzed posts
- Per-post breakdown cards
- Cross-account hook patterns that appear multiple times
- Recommended hooks + formats for your next 5 posts

## Usage
```
/algo-intelligence AI tools @timkoda_ @seb_intel @abhishek.devini
/algo-intelligence fashion @thewolfgangofficial @nudiejeans @represent
/algo-intelligence — analyze my own account @token.burner
```

## Quick Version (No Apify)
If you don't have Apify set up, manually paste post URLs and Claude will analyze them:
```
/algo-intelligence analyze these posts:
[paste 5-10 Instagram post URLs]
```
