---
name: website-cloner
description: Clone and rebuild any website with Claude in 4 steps — scrape, analyze, redesign, rebuild better. Use for competitive analysis, client pitch demos, or rebuilding your own site. Triggers on "clone this website", "rebuild this site", "scrape this site design", "copy this layout", "analyze competitor site". Source: instagram.com/p/DXqlPU7gmMf/
---

# Website Cloner

Clone any website and rebuild it better in 4 steps. Uses Firecrawl (or Chrome scraping) to extract the design, then Claude Code builds an improved version.

**Source**: [Instagram](https://www.instagram.com/p/DXqlPU7gmMf/)

## 4 Steps

### Step 1 — Scrape the Target Site
Use Firecrawl or Chrome MCP to extract:
- All page text and structure
- Colors (from computed CSS)
- Fonts (from computed styles)
- Layout patterns
- Navigation structure
- Key copy and value propositions

```bash
# With Firecrawl (if configured)
firecrawl scrape [URL] --output ./scraped/

# Without Firecrawl — use Chrome MCP
# Navigate to site, use get_page_text + javascript_tool to extract computed styles
```

### Step 2 — Analyze & Brief
Claude generates a design brief from the scraped data:
- What's working on the site
- What's weak or missing
- Suggested improvements (run `/design-anti-purple` to fix generic look)
- Technology recommendations

### Step 3 — Redesign with `/design-anti-purple`
Run the design brief system first to avoid AI defaults:
- Lock in specific colors, fonts, spacing
- Define the visual language
- Choose 21st.dev components to use

### Step 4 — Rebuild
Claude Code builds the improved version:
```
Stack: Next.js 14 + Tailwind CSS + shadcn/ui + 21st.dev
Animation: Framer Motion
Deploy: Vercel or Cloudflare Pages
```

## Usage
```
/website-cloner https://competitor.com
/website-cloner https://example.com — for client pitch demo
/website-cloner https://thewolfgang.com — audit and rebuild
```

## Common Use Cases
- **Client pitches**: Clone a prospect's site, rebuild it better, show them what's possible
- **Competitive analysis**: Understand what design choices competitors are making
- **Design inspiration**: Extract color palettes and layouts from sites you admire
- **Quick rebuilds**: Client asks for "something like [competitor]" — deliver faster
