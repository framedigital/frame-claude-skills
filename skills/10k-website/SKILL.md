# /10k-website — $10k Website Build Workflow

Build a premium client website in one session: competitor branding extraction → design brief → hero generation → full site build. The workflow that commands $10k+ project fees.

## Trigger
Use when the user says `/10k-website`, "build a client site", "frame client site", "website for [client]", or "run the full site workflow".

## The Workflow

```
Firecrawl (brand extraction)
    ↓
Claude Code (design brief + component plan)
    ↓
Nano Banana (hero image + exploded visuals)
    ↓
Stitch MCP (design system + UI mockups)
    ↓
Code build (React/Next.js + 21st.dev + Tailwind)
    ↓
Framer Motion (scroll animations + transitions)
    ↓
Delivered
```

---

## Step 1 — Brand Extraction (Firecrawl)

Ask: "Drop the client's existing site URL and 1-3 competitor URLs."

Use Firecrawl (or Chrome MCP if Firecrawl unavailable) to extract:
- Current color palette (screenshot + DOM computed styles)
- Fonts in use
- Logo and brand mark
- Key copy / value propositions
- Navigation structure
- What's working vs. what's weak

Deliverable: **Brand Audit Summary** (200 words max, bullet points)

---

## Step 2 — Design Brief

Generate a structured brief:

```markdown
## CLIENT: [Name]
## INDUSTRY: [Category]
## GOAL: [Primary conversion action]

### Visual Direction
- Style: [from 67 UI styles in UI/UX Pro Max]
- Colors: [3-5 hex values with roles: primary/accent/bg/text]
- Typography: [Heading font + Body font pairing]
- Mood: [3 adjectives]

### Page Structure
1. Hero — [headline approach + hero visual concept]
2. Problem/Solution section
3. [Service/Product] section
4. Social proof
5. CTA

### Key Differentiator vs. Competitors
[1 sentence]

### 21st.dev Components Needed
- Hero: [component name]
- Cards: [component name]
- Nav: [component name]
- CTA section: [component name]
```

**Wait for client approval before proceeding.**

---

## Step 3 — Hero Visual (Nano Banana)

Generate the hero image using `mcp__nano-banana__generate_image` with:
- A highly specific scene description derived from the brief
- Reference to brand colors and mood
- Aspect ratio: 16:9 or 4:3 depending on hero layout

Also generate an "exploded" variant: product/concept elements floating against a clean background for use as a feature section visual.

**Show both options. Get approval.**

---

## Step 4 — Design System (Stitch MCP)

Use `mcp__stitch__create_design_system` based on approved brief, then `mcp__stitch__generate_screen_from_text` for:
- Hero section
- Features / services section
- CTA section

---

## Step 5 — Code Build

Generate full site with:
- **Stack**: Next.js 14 + Tailwind CSS + shadcn/ui + 21st.dev components
- **Animation**: Framer Motion scroll reveals, hero entrance, card hover states
- **Performance**: Image optimization, lazy loading, Core Web Vitals clean
- **SEO**: metadata, OG tags, sitemap

Scaffold structure:
```
app/
  layout.tsx        # fonts, metadata
  page.tsx          # homepage sections
  components/
    Hero.tsx
    Features.tsx
    Testimonials.tsx
    CTA.tsx
  lib/
    utils.ts
```

---

## Step 6 — Quality Check

Before handing over, verify:
- [ ] Mobile responsive (375px, 768px, 1440px)
- [ ] No purple problem (see `/design-anti-purple`)
- [ ] CTA above fold
- [ ] All images optimized
- [ ] Framer Motion animations don't cause layout shift
- [ ] Lighthouse Performance > 90

---

## Pricing Context (for Frame)
- Discovery + Brief: 2hrs
- Design + Visuals: 3hrs  
- Build: 5hrs
- QA + Handoff: 1hr
- **Total: ~11hrs = $10k at $900/hr effective rate**

Position to clients as: "Strategy + AI-native execution = traditional agency quality in 1/4 the time."
