---
name: meta-ads-claude
description: Connect Claude to your Meta ads account to analyze campaigns, generate creative briefs, optimize audiences, and automate reporting. Use for any Meta advertising task. Triggers on "meta ads", "facebook ads", "instagram ads", "campaign analysis", "ad creative", "audience setup", "ad reporting", "optimize ads". Source: instagram.com/p/DYEZs7gF2iL/
---

# Meta Ads × Claude

Connect Claude directly to your Meta Business Manager account for automated campaign analysis, creative briefing, audience optimization, and reporting.

**Source**: [Instagram](https://www.instagram.com/p/DYEZs7gF2iL/) | Comment "AGENCY" on the post for the full setup guide.

## What It Does
- **Campaign analysis** — pull performance data, flag underperformers
- **Creative briefs** — generate briefs based on what's working
- **Audience strategy** — 730-day purchase audiences, lookalikes, retargeting stacks
- **Ad copy** — write and test multiple variants
- **Reporting** — automated weekly summaries
- **Budget allocation** — reallocation recommendations based on ROAS

## Setup

### 1. Meta API Access
```bash
# You need:
# 1. Meta Business Manager account
# 2. App with Marketing API permission
# 3. System User token with ads_read + ads_management

# Test your token:
curl "https://graph.facebook.com/me/adaccounts?access_token=YOUR_TOKEN"
```

### 2. Configure in Claude
Add to your environment:
```bash
META_ACCESS_TOKEN=your_system_user_token
META_AD_ACCOUNT_ID=act_XXXXXXXXXX
META_BUSINESS_ID=XXXXXXXXXX
```

### 3. Install Meta MCP (if available)
```bash
# Search for Meta Ads MCP connector or use the setup guide from the post
# Comment "AGENCY" at instagram.com/p/DYEZs7gF2iL/ for the config file
```

## Key Workflows

### Campaign Health Check
```
/meta-ads-claude health-check
→ Pulls all active campaigns
→ Flags CPM spikes, frequency caps exceeded, learning phase issues
→ Recommends immediate actions
```

### Purchase Audience Setup (2026 Best Practice)
```
/meta-ads-claude setup-purchase-audience
→ Creates 730-day purchase audience
→ Segments by repurchase window (30/90/300 days)
→ Sets up win-back campaigns
→ Excludes recent purchasers from prospecting
```

### Creative Brief Generator
```
/meta-ads-claude brief [product/campaign]
→ Analyzes top-performing existing ads
→ Extracts winning hook patterns
→ Generates 3 new creative briefs with hooks, body copy, CTA options
```

### Weekly Report
```
/meta-ads-claude report [date range]
→ Pulls spend, impressions, clicks, ROAS by campaign
→ Compares to previous period
→ Flags wins and losses
→ Recommends budget shifts
```

## Usage
```
/meta-ads-claude health-check
/meta-ads-claude brief wolf-gang-summer-drop
/meta-ads-claude report last-7-days
/meta-ads-claude setup-purchase-audience
/meta-ads-claude optimize — let Claude reallocate budgets
```
