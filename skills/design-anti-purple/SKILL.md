# /design-anti-purple — Structured Design Brief System

Fixes the "purple problem" — the reason AI-generated sites all look the same. Forces specific visual decisions upfront so the output reflects the client, not AI defaults.

## Trigger
Use when the user says `/design-anti-purple`, "fix the design", "make it not look AI", "it looks generic", "purple problem", or "design brief", or invoke automatically before any design/build task.

## What Is the Purple Problem?
When you ask AI to "design a website", it defaults to:
- Purple or teal primary colors
- Inter or Plus Jakarta Sans fonts
- Rounded cards with subtle shadows
- Gradient hero backgrounds
- "Modern SaaS" aesthetic regardless of the actual brand

The fix: **force every visual decision to be made explicitly before a single pixel is rendered.**

---

## The Structured Design Brief

Run through this checklist. Every item must have a specific answer — no vague answers accepted.

### 1. Color System (No Defaults)
Specify ALL of:
- **Primary**: exact hex (e.g., `#E8D5B7` — warm parchment, NOT purple)
- **Accent**: exact hex for CTAs and highlights
- **Background**: light/dark/mid + exact hex
- **Text primary**: exact hex
- **Text secondary**: exact hex
- **Danger/Error**: exact hex
- **Source**: extracted from existing brand, or chosen deliberately from [161 palettes in UI/UX Pro Max]

**Red flag**: If any answer is "blue", "dark", or "modern" — push back and get specific.

### 2. Typography (No Inter by Default)
Specify:
- **Heading font**: specific name + weight (e.g., "Canela Display, 300 Light")
- **Body font**: specific name + weight (e.g., "DM Sans, 400 Regular")
- **Mono font**: if used, which one
- **Type scale**: base size, H1-H6 sizes, line heights
- **Tracking**: tight headlines? loose body?
- **Source**: pulled from brand guidelines, or chosen from [57 pairings in UI/UX Pro Max]

**Red flag**: Inter, Plus Jakarta Sans, or Geist with default weights = generic.

### 3. Spacing & Layout
Specify:
- **Grid**: 12-col, 8-col, or asymmetric
- **Max content width**: 1280px, 1440px, full-bleed?
- **Section padding**: tight (40px), normal (80px), generous (120px+)
- **Component density**: card-heavy, white-space-forward, editorial?
- **Border radius**: none (0), minimal (4px), rounded (12px), pill (9999px)

### 4. Visual Language
Specify:
- **Style**: pick ONE from: editorial / luxury / brutalist / technical / organic / playful / corporate-minimal
- **Photography style**: product-hero / lifestyle / documentary / abstract / no photography
- **Illustration**: none / line art / 3D / icon-only
- **Texture**: flat / subtle grain / heavy texture / glassmorphism
- **Shadow**: none / soft / dramatic / neumorphic

### 5. Motion & Interaction
Specify:
- **Scroll behavior**: static / gentle reveals / parallax / full-scroll story
- **Hover states**: subtle / dramatic / cursor-based
- **Page transitions**: none / fade / slide
- **Animation library**: Framer Motion / GSAP / CSS-only / none

### 6. Anti-Patterns to Explicitly Avoid
Check all that apply to this project (= things to NOT do):
- [ ] No gradient hero backgrounds
- [ ] No rounded pill buttons unless brand uses them
- [ ] No floating chat widget aesthetic
- [ ] No "startup" blue/purple primary
- [ ] No stock photo hero images
- [ ] No generic SaaS icon sets (Heroicons default usage)
- [ ] No cards-on-cards nested layout
- [ ] No excessive white space filling lack of content

---

## Output Format

After running through the checklist, output a **Design Token Block**:

```css
/* Design Tokens — [CLIENT NAME] */
:root {
  /* Colors */
  --color-primary: #[hex];
  --color-accent: #[hex];
  --color-bg: #[hex];
  --color-text: #[hex];
  --color-text-muted: #[hex];

  /* Typography */
  --font-heading: '[Font Name]', [fallback];
  --font-body: '[Font Name]', [fallback];
  --text-base: 16px;
  --leading-tight: 1.2;
  --leading-body: 1.6;
  --tracking-tight: -0.02em;

  /* Spacing */
  --space-section: 96px;
  --space-component: 48px;
  --space-element: 24px;
  --radius: [value];
  --max-width: [value];
}
```

Pass this token block into every subsequent design/build prompt. It eliminates AI defaults because there's no decision left to guess.

---

## Usage
```
/design-anti-purple                     # Run the brief checklist
/design-anti-purple [client name]       # Run for a specific client
/design-anti-purple check               # Review an existing design for purple-problem symptoms
```

Invoke automatically at the start of any Frame client site work.
