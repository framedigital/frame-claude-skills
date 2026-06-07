---
name: content-research-os
description: Content Research OS — auto-installing Claude skill that hunts viral outliers, reverse-engineers hooks across X/Instagram/YouTube, and outputs a full content plan in ~15 minutes. Use when asked to research content, find viral hooks, analyze competitors, or plan a content strategy. Triggers on "research content", "find viral hooks", "content plan", "what's working in my niche", "analyze competitors", "outlier posts". Source: @abhishek.devini / devini.io/reelstack
---

# Content Research OS

Automated content intelligence system. Hunts posts beating creator averages 5-10x, reverse-engineers hooks, watches videos to explain WHY they blew up, then outputs a full content plan.

**Source**: [@abhishek.devini](https://www.instagram.com/p/DZKo0DPvYno/) | [devini.io/reelstack](https://devini.io/reelstack)

## What It Does
→ Hunts outliers — posts beating a creator's average 5-10x  
→ Reverse-engineers hooks, structure, and first line across X, Instagram & YouTube  
→ Watches top videos and breaks down WHY they blew up  
→ Outputs full content plan: highest-signal topics, angles, hooks + formats working right now

What was 1/2 day of manual research runs in ~15 minutes.

## Setup
```bash
# Install the skill (auto-setup wizard)
skills add content-research-os
# Or comment "OS" on the post at instagram.com/p/DZKo0DPvYno/ to get the file direct
```

## Workflow

### Step 1 — Define Your Niche & Targets
Ask the user:
- What niche/topic? (e.g. "AI tools for creators", "fashion e-commerce")
- Which 3-5 creator accounts to analyze?
- Timeframe: last 7 days or 30 days?

### Step 2 — Scrape Top Performers
Use Apify (or manual research if Apify not configured):
- Pull recent posts per creator account
- Rank by engagement vs that creator's average
- Flag anything 5x+ above their mean

### Step 3 — Break Down Each Outlier
For each top post, analyze:
- **Hook**: First line / first 3 seconds
- **Structure**: How is the content organized?
- **Format**: Reel, carousel, talking head, b-roll, text-on-screen
- **CTA**: What action does it drive?
- **Why it worked**: Emotional trigger, novelty, relatability, controversy?

### Step 4 — Output Content Plan
Deliver:
1. **Top 5 hooks** stealing from the best-performing posts
2. **3 topic angles** with highest outlier signal
3. **Format recommendations** (what's working: carousels vs reels vs static)
4. **Posting cadence** based on competitor analysis
5. **Sample first lines** for 5 pieces of content

## Usage
```
/content-research-os [niche] [account1] [account2]
/content-research-os AI tools @abhishek.devini @seb_intel @timkoda_
/content-research-os fashion @thewolfgangofficial @nudiejeans
```
