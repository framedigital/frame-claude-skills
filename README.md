# Frame Claude Skills

> A curated library of Claude Code skills for AI-native creative work — video generation, web builds, UGC, content strategy, business advisors, and more.

Built and maintained by [Frame Creative Agency](https://framecreative.com.au). Skills are sourced from the Frame intelligence pipeline: daily scans of saved Instagram posts and DMs, enriched with full workflow documentation.

---

## Install

**One-liner (recommended):**
```bash
git clone https://github.com/framedigital/frame-claude-skills && bash frame-claude-skills/install.sh
```

**Or keep it fresh with a pull + reinstall:**
```bash
cd frame-claude-skills && git pull && bash install.sh
```

**Auto-update daily** (add to your crontab):
```bash
# crontab -e
0 9 * * * cd ~/frame-claude-skills && git pull --quiet && bash install.sh --quiet
```

---

## Skills (43 installed)

### 🎬 Video Generation
| Skill | Command | Description |
|-------|---------|-------------|
| Higgsfield Generate | `/higgsfield-generate` | Full Higgsfield platform — GPT Image 2, Seedance 2.0, Nano Banana, Marketing Studio, Kling 3.0 |
| Seedance Auto Generate | `/seedance-auto-generate` | Automated Seedance 2.0 video generation via Playwright |
| UGC Video Auto | `/ugc-video-auto` | End-to-end UGC ad pipeline: character image → Seedance video |
| UGC Hot Girl | `/ugc-hot-girl` | UGC-style lifestyle ads with consistent female character |
| Remotion Editor | `/remotion-editor` | Full video editing in Claude: silence cut, captions, motion graphics, A/B hooks |
| Adobe CC Connector | `/adobe-cc-connector` | Entire Adobe Creative Suite (Photoshop, Premiere, AE) inside Claude |

### 🎨 Video Styles
| Skill | Command |
|-------|---------|
| Cinematic | `/01-cinematic` |
| 3D CGI | `/02-3d-cgi` |
| Cartoon | `/03-cartoon` |
| Comic to Video | `/04-comic-to-video` |
| Fight Scenes | `/05-fight-scenes` |
| Motion Design Ad | `/06-motion-design-ad` |
| E-Commerce Ad | `/07-ecommerce-ad` |
| Anime Action | `/08-anime-action` |
| Product 360° | `/09-product-360` |
| Music Video | `/10-music-video` |
| Social Hook | `/11-social-hook` |
| Brand Story | `/12-brand-story` |
| Fashion Lookbook | `/13-fashion-lookbook` |
| Food & Beverage | `/14-food-beverage` |
| Real Estate | `/15-real-estate` |

### 🌐 Web & Design
| Skill | Command | Description |
|-------|---------|-------------|
| UI/UX Pro Max | `/ui-ux-pro-max` | 67 UI styles, 161 color palettes, 57 font pairings, 99 UX guidelines |
| Design Anti-Purple | `/design-anti-purple` | Structured design brief system — kills generic AI look, forces explicit visual decisions |
| $10k Website | `/10k-website` | Full agency website workflow: Firecrawl → brief → Nano Banana → Next.js + 21st.dev build |
| Website Cloner | `/website-cloner` | Clone + rebuild any site better in 4 steps |
| Spline 3D Web | `/spline-3d-web` | Add Spline 3D assets to sites with the video-compression performance fix |
| Trade Site Gen | `/trade-site-gen` | Professional sites for trades businesses |

### 📸 Image & Product
| Skill | Command | Description |
|-------|---------|-------------|
| Higgsfield Image Auto | `/higgsfield-image-auto` | Automated Higgsfield image generation |
| Higgsfield Product Photoshoot | `/higgsfield-product-photoshoot` | AI product photography — no shoot needed |
| Higgsfield Marketplace Cards | `/higgsfield-marketplace-cards` | E-commerce listing cards for Amazon, Shopify |
| Wolf Gang Catalog | `/wolf-gang-catalog` | 1 product photo → 7 catalog images (hero, back, details, lifestyle, flat lay) |
| Higgsfield Soul ID | `/higgsfield-soul-id` | Consistent face/character training for UGC campaigns |

### 📱 Content & Instagram
| Skill | Command | Description |
|-------|---------|-------------|
| IG Content Engine | `/ig-content-engine` | Instagram autopilot — trend analysis → Higgsfield content → staged posting |
| Content Research OS | `/content-research-os` | Outlier hunting + hook reverse-engineering across X/IG/YouTube in 15 min |
| Algo Intelligence | `/algo-intelligence` | Apify + Claude subagents viral content analysis → HTML report |
| Instagram Research | `/instagram` | Scan saved posts, read DMs, transcribe videos, generate ideas |

### 💼 Business & Strategy
| Skill | Command | Description |
|-------|---------|-------------|
| Founder Mode | `/founder-mode` | Claude Founder Thinking Mode — direct, operator-level decisions, no hedging |
| Hormozi Advisor | `/hormozi` | Alex Hormozi lens: offers, pricing, lead gen, scaling |
| Naval Advisor | `/naval` | Naval Ravikant lens: wealth, leverage, product thinking |
| Rubin Advisor | `/rubin` | Rick Rubin lens: stripping to essence, creative decisions |
| Council of 5 | `/council-of-5` | 5 thinking modes stress-test any decision before committing |
| Meta Ads × Claude | `/meta-ads-claude` | Connect Claude to Meta Business Manager for campaign automation |

---

## How Skills Work

Skills are Markdown files placed in `~/.claude/skills/<skill-name>/SKILL.md`. Claude Code reads them automatically — no restart needed.

To use a skill, either:
1. **Type the command** — e.g. `/higgsfield-generate`
2. **Describe what you want** — Claude auto-triggers the right skill from context

---

## Contributing / Adding Skills

Found a useful skill on Instagram? Add it:

1. Fork this repo
2. Create `skills/<skill-name>/SKILL.md`
3. Include: trigger conditions, workflow steps, usage examples, and the source post URL
4. PR it in

The skill frontmatter format:
```markdown
---
name: skill-name
description: One-line trigger description. Include when to use and key trigger phrases.
---

# Skill Display Name

Full workflow documentation here...
```

---

## Updates

Skills are updated daily via the Frame Instagram intelligence pipeline. New skills are sourced from:
- Saved posts on [@token.burner](https://www.instagram.com/token.burner/)
- DM inbox signals from creators
- Manually built workflows for Frame client work

Star this repo to get notified of new skills.

---

*Built by [Frame Creative](https://framecreative.com.au) · AI-native creative agency*
