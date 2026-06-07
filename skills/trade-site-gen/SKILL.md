---
name: trade-site-gen
description: "Generates unique, production-ready landing pages for local trade businesses (plumbers, electricians, HVAC, gas fitters, cleaners, pest control, landscapers, etc.) from lead database records. Extracts brand assets from existing sites, applies a deterministic design uniqueness system, and outputs a single self-contained HTML file with dark/light mode, Lucide icons, real business imagery, and hyper-local content. Use when: building pitch demo sites for outreach leads, rolling out sites for clients, or generating design variants."
---

# Trade Site Generator Skill

## Purpose

Build a convincing, unique, high-quality landing page for any local trade business using data already in the leads database. Every site must feel custom — not templated — by systematically varying design dimensions based on the lead's own data signals.

---

## Pipeline: Lead → Site

### Step 1: Ingest Lead Data

Pull from the leads DB at `~/Desktop/moltworker/data/leads.db`:

```sql
SELECT id, business_name, owner_name, owner_photo, phone, suburb, niche,
       trade_tag, website, email, abn, abn_status,
       website_score, lead_score, tier, scraped_at
FROM leads WHERE id = ?
```

Also check `~/Desktop/moltworker/data/owner_photos/` for a downloaded headshot.

### Step 2: Scrape Existing Site (if website exists)

Use WebFetch or Chrome MCP on their existing URL. Extract:
- **Primary color**: dominant hex from logo or header background
- **Secondary color**: CTA button or accent color
- **Logo URL**: og:image or first `<img>` in header
- **Real photos**: WordPress uploads, any `<img>` with plausible trade content
- **Tagline/headline**: their existing h1 or meta description
- **Service list**: any `<ul>` or service section text
- **Review count + rating**: Google Reviews widget or structured data
- **Established year**: "since XXXX" or ABN registration date

If scrape fails or site doesn't exist: use trade defaults (Step 3).

### Step 3: Design Brief Generation

Run the **Uniqueness Matrix** to determine design parameters:

#### 3a. Accent Color

| Priority | Source |
|----------|--------|
| 1 | Scraped from existing site logo/header |
| 2 | Trade-type default (see table below) |
| 3 | Suburb-keyed fallback from palette list |

**Trade Color Defaults:**
| Trade | Primary | Dark Variant |
|-------|---------|-------------|
| Plumber | `#208df3` (blue) | `#0a2d5e` |
| Electrician | `#f5a623` (amber) | `#7a4c00` |
| HVAC / Air Con | `#00b4a0` (teal) | `#004d44` |
| Gas Fitter | `#ff6b35` (orange) | `#7a2a00` |
| Solar | `#84cc16` (lime) | `#2d5016` |
| Pest Control | `#a855f7` (violet) | `#3b0764` |
| Landscaper | `#22c55e` (green) | `#14532d` |
| Cleaner | `#38bdf8` (sky) | `#0c4a6e` |
| Painter | `#f472b6` (pink) | `#701a75` |
| Locksmith | `#94a3b8` (slate) | `#1e293b` |
| Default | `#6366f1` (indigo) | `#1e1b4b` |

#### 3b. Hero Layout Variant

Determined by `lead_score`:
- **90–100**: Layout A — Bold split, large stat counter panel, editorial typography
- **70–89**: Layout B — Left headline, right trust panel (default, proven)
- **50–69**: Layout C — Centered headline, full-width image behind with overlay
- **<50**: Layout D — Minimal, clean, single CTA, less visual noise

#### 3c. Font Pair

Determined by `(lead_id % 4)`:
| Mod | Heading | Body |
|-----|---------|------|
| 0 | Clash Display (CDN) | Inter |
| 1 | Space Grotesk | DM Sans |
| 2 | Plus Jakarta Sans | Inter |
| 3 | Syne | Outfit |

All via Google Fonts or Fontshare CDN.

#### 3d. Background Pattern

Determined by `suburb` first letter:
| Letters | Pattern | CSS |
|---------|---------|-----|
| A–E | Radial navy | `radial-gradient(125% 125% at 50% 10%, #0e1114 40%, {accent-dark} 100%)` |
| F–J | Mesh violet | `radial-gradient(at 40% 20%, {accent}22 0%, transparent 50%), radial-gradient(at 80% 0%, #7c3aed22 0%, transparent 50%), radial-gradient(at 0% 50%, {accent}11 0%, transparent 50%)` |
| K–N | Dot grid | `radial-gradient(circle, {accent}33 1px, transparent 1px)` as background-image, 24px size |
| O–S | Clean split | Solid `--bg` with a vertical accent stripe — no gradient |
| T–Z | Noise overlay | `radial-gradient(125% 125% at 50% 10%, #0e1114 45%, {accent-dark} 100%)` + CSS noise filter |

#### 3e. Section Ordering / Emphasis

Determined by strongest asset signal:
- **Reviews ≥ 100**: lead with social proof → order: Hero → Testimonials → Services → Founder → Guarantee
- **`lead_score` ≥ 85**: lead with authority → order: Hero → Trust Badges → Hooks → Services → Founder → Reviews → Guarantee
- **Default**: Hero → Hooks → Services → Founder → Reviews → Guarantee → Gallery → FAQ → Contact

#### 3f. Tone

| Tier | Tone | What changes |
|------|------|-------------|
| A | Premium | Larger typography, more white space, bolder section headings, more review emphasis |
| B | Honest | Standard sizing, clear value props, price transparency |
| C | Direct | Simpler layout, fewer sections, single strong CTA |

---

## Design System

### CSS Custom Properties (always include these)

```css
:root {
  /* Brand */
  --accent: {extracted or default};
  --accent-dark: {dark variant};
  --cta: #ffd700;      /* gold CTA — works across all trade palettes */
  --cta-h: #e6c200;

  /* Light mode defaults */
  --bg: #ffffff;
  --surface: #f8fafc;
  --surface2: #f1f5f9;
  --border: #e2e8f0;
  --text: #0f172a;
  --text-secondary: #475569;
  --muted: #94a3b8;
}

[data-theme="dark"] {
  --bg: #0e1114;
  --surface: #161b22;
  --surface2: #1e2530;
  --border: rgba(255,255,255,0.08);
  --text: #f0f4f8;
  --text-secondary: #94a3b8;
  --muted: #64748b;
}
```

**Default theme**: check `lead_score`. Score ≥ 75 → start dark (premium feel). Score < 75 → start light (trustworthy/approachable feel). Always include the switcher so users can toggle.

### Dark/Light Mode Switcher

Always add this toggle to the nav:

```html
<button id="theme-toggle" aria-label="Toggle theme" onclick="toggleTheme()">
  <i data-lucide="sun" id="icon-sun"></i>
  <i data-lucide="moon" id="icon-moon" style="display:none"></i>
</button>
```

```javascript
function toggleTheme() {
  const isDark = document.documentElement.getAttribute('data-theme') === 'dark';
  document.documentElement.setAttribute('data-theme', isDark ? 'light' : 'dark');
  document.getElementById('icon-sun').style.display = isDark ? 'none' : 'block';
  document.getElementById('icon-moon').style.display = isDark ? 'block' : 'none';
  localStorage.setItem('theme', isDark ? 'light' : 'dark');
}
// On load
const saved = localStorage.getItem('theme') || (leadScore >= 75 ? 'dark' : 'light');
document.documentElement.setAttribute('data-theme', saved);
```

---

## Icons — MANDATORY RULES

**Never use emojis. Always use Lucide icons.**

Load via CDN in `<head>`:
```html
<script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js"></script>
```
Initialise before `</body>`:
```html
<script>lucide.createIcons();</script>
```
Use: `<i data-lucide="icon-name"></i>`

CSS for all icons:
```css
[data-lucide] { display: inline-block; vertical-align: middle; }
.icon { width: 20px; height: 20px; stroke-width: 1.8; }
.icon-sm { width: 16px; height: 16px; }
.icon-lg { width: 28px; height: 28px; }
.icon-xl { width: 40px; height: 40px; stroke-width: 1.5; }
```

### Trade Icon Mappings

#### Plumbing
| Element | Icon |
|---------|------|
| Blocked drain | `droplets` |
| Hot water | `flame` |
| Leaking tap | `droplet` |
| Gas fitting | `gauge` |
| Bathroom reno | `bath` |
| Emergency | `alert-triangle` |
| $0 callout | `banknote` |
| Same-day | `zap` |
| Fixed price | `shield-check` |
| Afterpay | `credit-card` |

#### Electrical
| Element | Icon |
|---------|------|
| Switchboard | `cpu` |
| Power points | `plug` |
| Lighting | `lightbulb` |
| Solar | `sun` |
| Safety inspection | `shield-check` |
| Emergency | `alert-triangle` |
| EV charging | `battery-charging` |
| Ceiling fans | `wind` |
| Data/comms | `wifi` |
| $0 callout | `banknote` |

#### HVAC / Air Con
| Element | Icon |
|---------|------|
| Air con install | `wind` |
| Split system | `thermometer` |
| Ducted | `layout-grid` |
| Servicing | `wrench` |
| Emergency | `alert-triangle` |
| Energy efficiency | `leaf` |

#### Gas
| Element | Icon |
|---------|------|
| Gas fitting | `gauge` |
| Appliance install | `flame` |
| Leak detection | `alert-triangle` |
| Hot water | `thermometer` |
| Certification | `shield-check` |

#### Pest Control
| Element | Icon |
|---------|------|
| General pest | `bug` |
| Termite | `search` |
| Rodent | `target` |
| Treatment | `spray-can` |
| Inspection | `clipboard-check` |

#### Landscaping
| Element | Icon |
|---------|------|
| Lawn mowing | `scissors` |
| Garden design | `flower-2` |
| Irrigation | `droplets` |
| Tree removal | `tree-pine` |
| Paving | `square` |

#### Cleaning
| Element | Icon |
|---------|------|
| Residential | `home` |
| Commercial | `building-2` |
| End of lease | `key` |
| Carpet | `layers` |
| Windows | `square` |

#### Universal (all trades)
| Element | Icon |
|---------|------|
| Phone CTA | `phone` |
| Book online | `calendar` |
| Location | `map-pin` |
| Hours | `clock` |
| Email | `mail` |
| Guarantee | `shield-check` |
| Award/member | `award` |
| Licensed | `badge-check` |
| Reviews | `star` (only for ratings — ★ character also acceptable) |
| Australian owned | `flag` |
| Founded | `calendar-check` |

---

## Section Library

Every site is assembled from these sections. Select and order per Step 3e.

### NAV
- Logo (text if no brand asset found, styled with `--accent`)
- Nav links: Services | About | Reviews | FAQ | Contact
- CTA button: `<i data-lucide="phone">` Call Now
- Theme toggle button (sun/moon)
- Mobile hamburger menu with sticky scroll behaviour

### HERO
See layout variants A–D from Step 3b. All variants must include:
- **Eyebrow**: suburb + trade ("Adelaide's Most Trusted Plumber")
- **Headline**: 3 punchy lines (service type + differentiator)
- **Sub-hooks**: 4 inline icons with key value props
- **CTAs**: Primary (call) + Secondary (book online)
- **Trust line**: review count + certifications
- **Stat panel** (layouts A/B): live job count, avg response time, Google rating

### TRUST BAR
Horizontal strip of 5 trust badges: Google rating, industry member, licensed, Australian owned, founded year.

### HOOKS (3 cards)
Expand on the 3 biggest differentiators. Per trade:
- Plumbing: $0 callout / fixed price / same-day
- Electrical: licensed master / same-day / upfront pricing
- HVAC: branded units / manufacturer warranty / same-day
Write 3–4 sentences per card explaining the WHY.

### SERVICES GRID
6 service cards. Each has: trade icon, service name, price ("from $X"), 2-sentence description, "Get a Quote →" link.

Pricing defaults by trade (use if no scraped data):
- Plumbing: drain $149 / hot water $850 / tap $99 / bathroom $2400 / gas $180 / emergency $0 callout
- Electrical: switchboard $450 / power point $180 / lighting $220 / safety inspection $299 / solar POA / emergency $0 callout
- HVAC: supply+install from $1,400 / service from $149 / ducted from $4,500 / repair from $299

### FOUNDER / ABOUT
- Avatar: use `owner_photo` from DB if available. If not: initials block (first+last initial, styled with `--accent`).
- Name + title from DB `owner_name` field. If null, use business name founder copy.
- Story: 3 paragraphs — founding story, growth, why they still care. Generate from: suburb, years in trade (calculated from ABN date or "established" text from scrape), niche.
- Credential checklist (4–5 items): licence, association membership, insurance, local address, years experience.
- Founder quote block.

### GALLERY (Before/After)
3 cards, each a before/after pair.
- **First priority**: real images scraped from their WP uploads or existing site.
- **Second priority**: trade-specific curated Unsplash IDs (see approved image bank below).
- **Never**: headphones, welders, house exteriors, coffee roasters, or images unrelated to the trade.

**Approved image bank by trade:**

Plumbing:
- Old bathroom: `photo-1552321554-5fefe8c9ef14`
- Modern bathroom: `photo-1638799869566-b17fa794c4de`
- Plumber at work: `photo-1676210134190-3f2c0d5cf58d`
- Modern double vanity: `photo-1629079447777-1e605162dc8d`
- Industrial pipes: `photo-1607472586893-edb57bdc0e39`

Electrical:
- Switchboard old: use `photo-1581092580497-e0d23cbdf1dc` or similar
- Electrician at work: `photo-1621905251918-48416bd8575a`
- Modern lighting: `photo-1558618666-fcd25c85cd64` — **NEVER USE (headphones)**

**Always verify any Unsplash ID by loading the image before using it in a site.**

### GUARANTEE
Seal graphic with 12-month (or scraped guarantee period) written guarantee.

### TESTIMONIALS
- 3 text cards from real scraped reviews if available.
- If no real reviews: generate plausible placeholder reviews (name + suburb + service type + specific detail). Mark clearly as "example reviews" in the HTML comments.
- **Video testimonial**: always generate one using the Higgsfield pipeline below. Embed the 16:9 version above the text cards.

---

## Higgsfield Video Testimonial Pipeline

Run this for every site. Takes ~3 minutes. Produces a 15-second UGC talking-head review that looks like a genuine Google review video.

### Step 1 — Write the prompt

Build a prompt from the lead's data. Structure:

```
A [gender, age range] sits in their [suburban Australian home setting — lounge room / kitchen / back deck]
and gives a warm, genuine word-of-mouth testimonial to camera about [business_name].
They explain they had [problem] — [brief relatable scenario e.g. "the hot water system gave out on a Sunday"].
They called [business_name], who arrived within [response time], fixed the problem, and charged exactly
what was quoted — [price range appropriate to trade]. They laugh warmly and mention they have already
sent the number to a [family member / neighbour]. They end by recommending them to anyone in [suburb] or [nearby suburb].
Casual, genuine, natural Australian home setting with afternoon light.
No heavy makeup. Believable, unscripted feel.
```

**Australian name bank** (never Karen, never anything with meme baggage):
- Female: Mel, Bec, Jess, Nat, Tash, Lisa, Deb, Sue, Caz, Trish, Sharon, Jo, Fiona, Leanne
- Male: Dave, Mick, Trent, Craig, Scott, Damo, Brett, Wayne, Glenn, Robbo, Col, Baz, Grant, Phil

Pick a name that fits the suburb demographic. Inner-city → Jess, Nat, Bec. Outer suburbs → Tash, Deb, Mick, Craig.

**Problem scenarios by trade:**
| Trade | Scenario |
|-------|----------|
| Plumber | Blocked drain backing up for a week / hot water dead on a Sunday / leaking tap destroying the cabinet |
| Electrician | Switchboard tripping constantly / power point stopped working before a big event / solar install after high power bills |
| HVAC | Ducted aircon died mid-summer / new split system install before summer / annual service after it stopped cooling |
| Gas | Gas hot water pilot kept dying / new gas cooktop install / smell of gas freaked them out |
| Pest Control | Found a termite trail in the deck / cockroaches in a new rental / annual inspection before selling |
| Landscaper | Lawn completely dead after summer / garden redesign for a party / overgrown trees blocking light |
| Cleaner | End of lease clean / weekly clean after going back to work / post-reno clean |

### Step 2 — Pick avatar

Always use a **preset** avatar — custom avatars from AI-generated images fail validation.

**Female presets (pick based on suburb vibe):**
| ID | Name | Best for |
|----|------|---------|
| `44ee57aa-d1f4-4a0a-a55f-cdf9dacee265` | Mei | Inner suburbs, younger demographic |
| `bbf8e803-f10b-4e39-801c-eb12850237ab` | Maria | Southern suburbs, Mediterranean feel |
| `bba3087a-ad14-42c2-b51b-7c22b632abf4` | Sofia | Northern suburbs, family homes |
| `cec35719-5848-4455-a9dc-e6df72e03b80` | Lily | Coastal, eastern suburbs |

**Male presets:**
| ID | Name | Best for |
|----|------|---------|
| `35cd52c0-e92b-44b1-b56d-b4ea5e609c00` | Stefan | General suburban, tradespeople demographic |
| `672be390-36ab-4d79-bb95-ff562a57c79c` | Jayden | Younger homeowner, first home buyer |

Alternate gender per site so not every lead gets the same character.

### Step 3 — Generate both cuts

```bash
AVATARS_JSON=$(mktemp)
printf '[{"id":"<avatar_id>","type":"preset"}]' > "$AVATARS_JSON"

# 16:9 — website embed (always use this on the site)
higgsfield generate create marketing_studio_video \
  --prompt "<prompt from Step 1>" \
  --avatars @"$AVATARS_JSON" \
  --mode ugc \
  --duration 15 \
  --resolution 720p \
  --aspect_ratio 16:9 \
  --generate_audio true \
  --wait --wait-timeout 20m

# 9:16 — social cut (save for client handover)
higgsfield generate create marketing_studio_video \
  --prompt "<prompt from Step 1>" \
  --avatars @"$AVATARS_JSON" \
  --mode ugc \
  --duration 15 \
  --resolution 720p \
  --aspect_ratio 9:16 \
  --generate_audio true \
  --wait --wait-timeout 20m

rm "$AVATARS_JSON"
```

**Rules:**
- Duration must be 15s — 30s fails server-side
- Never use `--hook_id` or `--setting_id` for ugc mode testimonials
- If job returns `nsfw`: swap to a different avatar ID and resubmit — certain avatar/prompt combos trigger the filter
- If job returns `failed` with no error: reduce prompt length and resubmit

### Step 4 — Embed in the HTML

Place the 16:9 video **above** the text testimonial cards in the `#testimonials` section:

```html
<!-- Video testimonial — generated via Higgsfield Marketing Studio -->
<div class="testimonial-video-wrap">
  <video controls preload="none"
         style="width:100%;border-radius:var(--radius,8px);aspect-ratio:16/9;display:block;background:#000;">
    <source src="<CDN_URL_HERE>" type="video/mp4" />
  </video>
  <div class="testimonial-video-meta">
    <div class="testimonial-avatar">[INITIALS]</div>
    <div>
      <div class="testimonial-name">[First] [Last initial].</div>
      <div class="testimonial-job">[Suburb] · [Service] · ★★★★★</div>
    </div>
    <div class="testimonial-type">Verified Google</div>
  </div>
</div>
```

Style the meta row to match the site's existing testimonial card design (same avatar shape, colours, fonts).

### Step 5 — Save social cut for handover

Save the 9:16 MP4 to `~/Desktop/moltworker/workspace/social/[trade_tag]-[suburb_slug]-[lead_id]-9x16.mp4`

Include the URL in the handover notes so the client can post it to TikTok/Reels/Stories.

---

### FAQ
6–8 questions. First 2 always: "How much does a [trade] cost in [city]?" and "Do you charge a callout fee?" then trade/suburb specific.

### CONTACT
- Quote form (name, phone, suburb, service dropdown, notes)
- Contact details: phone, email, address, hours, emergency line — all with Lucide icons
- Map placeholder with suburb name
- Response time bar

### FOOTER
- Business name, ABN, licence number
- Nav links
- Trust badges row
- Copyright

---

## Background Patterns (21st.dev ibelick)

Full CSS for each pattern. Swap `{accent}` and `{accent-dark}` with the lead's colour values.

**Pattern A — Radial Deep** (default, works with all trades):
```css
background: radial-gradient(125% 125% at 50% 10%, var(--bg) 40%, {accent-dark} 100%);
```

**Pattern B — Mesh Glow**:
```css
background-color: var(--bg);
background-image:
  radial-gradient(at 40% 20%, {accent}22 0px, transparent 50%),
  radial-gradient(at 80% 0%, #7c3aed22 0px, transparent 50%),
  radial-gradient(at 0% 50%, {accent}18 0px, transparent 50%),
  radial-gradient(at 80% 50%, {accent}12 0px, transparent 50%),
  radial-gradient(at 0% 100%, {accent}15 0px, transparent 50%);
```

**Pattern C — Dot Grid**:
```css
background-color: var(--bg);
background-image: radial-gradient(circle, {accent}44 1px, transparent 1px);
background-size: 24px 24px;
```
(Apply only to hero section, not full page)

**Pattern D — Clean Minimal** (best for light mode, high-trust trades like cleaning/childcare):
```css
background: var(--bg);
/* Add a single accent block as a design element, not a gradient */
```
Use a coloured left-border `8px solid {accent}` on section headings for visual interest.

**Pattern E — Aurora** (electricians, solar, tech-adjacent trades):
```css
background-color: var(--bg);
background-image:
  radial-gradient(ellipse 80% 80% at 50% -20%, {accent}33, transparent),
  radial-gradient(ellipse 60% 60% at 80% 80%, {accent-dark}22, transparent);
```

---

## Award-Winning Design References

Draw inspiration from these when making layout and typography decisions:

**Structure & Hierarchy:**
- Stripe.com — how trust and features are layered, progressive disclosure
- Linear.app — sharp dark UI, strong typographic hierarchy, subtle motion
- Vercel.com — clean hero with live stats, minimal but premium

**Local Business Excellence:**
- Riverside Roofing (Awwwards) — how a trade site can feel premium
- Any site winning Awwwards "Site of the Day" in the Services category

**Specific patterns to borrow:**
- Stripe's pricing cards: feature list, clear price, strong CTA
- Linear's "why us" section: 3-column with large icon and concise copy
- Vercel's hero: bold metric counters with live animation feel
- Notion's testimonials: clean quote blocks, no fake star inflation

**What makes these award-winning:**
1. Hierarchy is obvious — you know what to read first within 2 seconds
2. White space is generous — nothing feels cluttered
3. CTAs are singular and confident — one clear action per section
4. Typography has scale — headlines are BIG, body is readable, labels are small
5. Colour is restrained — 1 accent, 1 gold CTA, everything else neutral

---

## Content Personalisation from Lead Data

Every piece of copy should reference real data where possible:

| DB Field | Where to use |
|----------|-------------|
| `business_name` | Nav, hero, footer, all CTAs |
| `owner_name` | Founder section, quote attribution, "Dean answers his phone" style trust copy |
| `suburb` | Hero eyebrow, FAQ questions, service area copy, meta description |
| `phone` | All CTAs, contact section, footer |
| `trade_tag` / `niche` | Service section headings, hero headline, FAQ |
| `abn` | Footer trust section ("ABN: XX XXX XXX XXX") |
| `lead_score` | Determines layout tier and section count |
| `owner_photo` | Founder section avatar |
| `website` | Source for scraping brand assets and real images |
| Scraped review rating | Trust bar, hero trust line, testimonial section heading |
| Scraped review count | "500+ 5-star reviews" style copy |
| Scraped pricing | Service card prices |
| Scraped established year | "22 years serving [suburb]" copy |

---

## Image Sourcing Rules (in priority order)

1. **Real images scraped from their existing site** — WordPress uploads, og:image, gallery sections. These are the best. Always check first.
2. **Owner photo from DB** (`owner_photo` field) — use in founder section.
3. **Their branded vehicle/team photos** — if found on site, use in hero or gallery.
4. **Approved trade-specific Unsplash IDs** — from the verified image bank above only.
5. **Never guess Unsplash IDs** — always verify by loading the image before using it.
6. **Never use**: headphones, welders, house exteriors, coffee equipment, generic "business" stock, or any image where the trade isn't visually obvious.

---

## Output Format

Single self-contained HTML file:
- No external dependencies except: Google Fonts CDN, Lucide CDN, optional Cloudflare Workers CDN for fonts
- All CSS in `<style>` block in `<head>`
- All JS in `<script>` block before `</body>`
- `data-theme` attribute on `<html>` element
- File named: `{trade_tag}-{suburb_slug}-{lead_id}.html`
- Saved to: `~/Desktop/moltworker/workspace/demos/`

---

## Quality Checklist Before Delivery

- [ ] No emojis anywhere (★ and ✓ in their specific contexts are OK)
- [ ] All icons are Lucide `<i data-lucide>` tags, `lucide.createIcons()` called
- [ ] Dark/light toggle works and persists to localStorage
- [ ] All business_name, owner_name, suburb, phone, ABN are from DB (not placeholder)
- [ ] At least one real image from their existing site OR verified Unsplash ID
- [ ] CTA phone number matches DB `phone` field
- [ ] Service prices are real (scraped) or clearly trade-appropriate defaults
- [ ] Unique accent color — not the same as the last site you built
- [ ] Background pattern matches the suburb letter rule
- [ ] Font pair matches the `(lead_id % 4)` rule
- [ ] File named correctly and saved to workspace/demos/
- [ ] Loads without errors in browser
- [ ] **Video testimonial**: Higgsfield 16:9 URL embedded in `#testimonials` above text cards
- [ ] **Video testimonial**: reviewer name is NOT Karen, no meme-baggage names
- [ ] **Social cut**: 9:16 MP4 saved to `workspace/social/` for client handover

---

## Skill Invocation

Trigger this skill when asked to:
- "Build a demo site for lead [ID/name]"
- "Generate a pitch page for [business name]"
- "Roll out sites for tier A leads"
- "Build a trade site for [name]"

When invoked, always run the full pipeline: ingest → scrape → design brief → build → quality check.
Do not skip the brand extraction step even if you think you know the colors.
Do not reuse the same layout variant as the previously generated site.
