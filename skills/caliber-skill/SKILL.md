---
name: caliber-skill
description: >
  Award-winning design intelligence skill for creative directors who demand the highest visual
  standards. ALWAYS use this skill when the user mentions: "award-winning", "Awwwards", "FWA",
  "CSS Design Awards", "Siteinspire", "Muzli", "scrape a site", "copy this design", "match this
  aesthetic", "steal this layout", "framer motion", "premium animations", "hover effects",
  "magnetic", "parallax", "scroll reveal", "cursor effects", "glassmorphism site", "GSAP-style",
  "recreate this site", "site like X", "design like X", "can you match this", "make it feel like",
  "animate like", "motion design", "21st.dev components", or ANY request to build something that
  competes in quality with top-tier agency or SaaS sites. This extends UI UX Pro Max with live
  design extraction from the web's best sites and maps everything to Framer Motion + 21st.dev
  production code. Use it proactively — if the user shares a URL or describes a premium design,
  this skill should activate automatically.
---

# Caliber Skill

> Extracts award-winning design intelligence from the web's best sites, maps it to Framer Motion
> animations and 21st.dev components, then hands off a structured brief to UI UX Pro Max for
> execution. The full pipeline: **Caliber → UI UX Pro Max → Code**.

---

## TRIGGER

Invoke this skill when the user:
- Shares a URL and wants to understand or replicate its design
- Mentions Awwwards, FWA, CSS Design Awards, Siteinspire, or Muzli
- Asks for "award-winning", "agency-quality", or "premium" feel
- References specific animation terms: magnetic, parallax, stagger, reveal, morph, blob, cursor
- Wants Framer Motion animations beyond basic fade/slide
- Asks to "build something like [site]" or "match the vibe of [site]"
- Is building a portfolio, agency site, SaaS hero, or high-stakes landing page
- Uses UI UX Pro Max but wants to push the motion/interaction quality higher

---

## WORKFLOW

### Phase 0 — Intake

Ask the user exactly one question upfront (combine if possible):

> "Share a URL, an Awwwards/FWA link, or describe the vibe you want to extract.
> What are you building — portfolio, SaaS, agency, e-commerce, editorial?"

If they already provided a URL or site reference in their message, skip asking.

### Phase 1 — Design Extraction

Use `WebFetch` to load the URL. Extract these signals:

**Visual Language**
- Color palette (primary, secondary, accent, background, text — hex values if detectable)
- Typography hierarchy (font families from CSS/meta, sizes, weights, letter-spacing)
- Spacing rhythm (padding/margin patterns — tight/generous/editorial)
- Border radius style (sharp / subtle / pill)
- Shadow language (none / soft / hard / glow)
- Layout system (grid / asymmetric / fullbleed / editorial / bento)

**Motion Language** — look for CSS transitions, animation classes, JS libraries loaded
- Entry animations: fade, slide, scale, stagger, clip-path reveal
- Scroll behavior: parallax, pin, scrub, horizontal scroll
- Hover effects: magnetic, underline, color shift, scale, tilt
- Cursor: custom cursor, trail, blend mode, magnetic pull
- Page transitions: crossfade, slide, morph

**Interaction Quality Score** — rate 1-10 across:
- Microinteraction polish
- Scroll storytelling
- Hover responsiveness
- Typography animation
- Overall wow factor

**Source Attribution**
- Site name and URL
- Award tier if Awwwards/FWA (Site of the Day / Week / Month / Year)
- Studio or agency if known

Present as a **Design Intelligence Report** (see OUTPUT FORMAT section below).

### Phase 2 — Animation Mapping

Map extracted motion signals to named effects from the ANIMATION LIBRARY. For each detected pattern, select the closest match and output the Framer Motion implementation.

Always output at minimum:
- 1 hero entry sequence
- 1 scroll-triggered reveal
- **Char-Roll Nav Hover (Effect #35) — always include on nav and footer links unless overridden**
- 1 additional hover effect (card, button, or image)
- 1 page transition

### Phase 3 — 21st.dev Component Pairing

Map extracted layout patterns to 21st.dev components. Output as a ready-to-run install list:

```bash
npx 21st-cli add [component-name]
```

Reference the 21st.dev PAIRING section for component ↔ pattern mappings.

### Phase 4 — UI UX Pro Max Handoff

Package the extracted intelligence into a structured handoff brief (see HANDOFF FORMAT) and explicitly tell the user:

> "I've extracted the design intelligence. Passing this to UI UX Pro Max now — it will use
> these signals to plan your color system, typography, motion language, and layout. Then I'll
> generate production code directly from the approved direction."

Then invoke UI UX Pro Max with the handoff brief as context.

### Phase 5 — Code Output

After UI UX Pro Max approves the design direction, output production React/Next.js code using:
- Framer Motion for all animation
- 21st.dev components for UI primitives
- Tailwind CSS for layout and spacing
- TypeScript

---

## AWARD SITES — Sources to Scrape

### Tier 1 — Curated Galleries (highest quality bar)
| Source | URL | Best For |
|--------|-----|----------|
| Awwwards | awwwards.com | Agency sites, portfolios, SaaS |
| FWA (Favourite Website Awards) | thefwa.com | Experimental, immersive, WebGL |
| CSS Design Awards | cssdesignawards.com | Clean UI, accessible design |
| Siteinspire | siteinspire.com | Editorial, typography-forward |
| Muzli | muz.li | Product design, SaaS, dashboards |

### Tier 2 — Curated Collections
| Source | URL | Best For |
|--------|-----|----------|
| Land-book | land-book.com | Landing pages |
| Lapa Ninja | lapa.ninja | Startup landing pages |
| Mobbin | mobbin.com | Mobile UI patterns |
| Scrnshts | scrnshts.club | App screenshots |
| Really Good Emails | reallygoodemails.com | Email design |

### Tier 3 — Agency / Studio Portfolios (check these directly)
- Resn (resn.co.nz) — interactive, WebGL
- Active Theory (activetheory.net) — immersive 3D
- Fantasy (fantasy.co) — product design
- Work & Co (work.co) — digital products
- Instrument (instrument.com) — brand + digital
- Huge (hugeinc.com) — enterprise + brand
- EPIC Agency — editorial motion

---

## DESIGN EXTRACTION — What to Pull from Each Site

When fetching a site, look for these signals in this order:

### CSS Signals (highest signal-to-noise)
```
1. :root CSS variables → color tokens, spacing scale, radius
2. font-face declarations → typeface names
3. transition/animation properties → motion timing, easing curves
4. @keyframes → named animations and their properties
5. backdrop-filter, mix-blend-mode → glassmorphism, overlay effects
6. clip-path → geometric reveals
7. transform patterns → scale, rotate, translate used in hover
```

### HTML/JS Signals
```
8. <link> to Google Fonts / Adobe Fonts / custom → typography
9. Script tags → GSAP, Lenis, Locomotive Scroll, Three.js, WebGL
10. data-* attributes → animation triggers, scroll offsets
11. Intersection Observer usage → scroll reveal patterns
12. Canvas/WebGL presence → immersive/3D experience
```

### Visual Signals (describe from page snapshot)
```
13. Hero layout: centered / left-aligned / split / fullbleed / asymmetric
14. Image treatment: sharp edges / masked / bleeding / overlapping
15. Text size: editorial large / balanced / compact
16. Whitespace: generous / tight / mixed
17. Color temperature: warm / cool / neutral / high contrast / muted
```

---

## ANIMATION LIBRARY

All 32 effects are mapped to Framer Motion. Import pattern always:
```tsx
import { motion, useScroll, useTransform, useSpring, AnimatePresence,
         useInView, useMotionValue, useVelocity } from 'framer-motion'
```

---

### ENTRY ANIMATIONS

#### 1. Fade Up Stagger
Classic reveal — each child staggers in from below.
```tsx
const container = {
  hidden: { opacity: 0 },
  show: {
    opacity: 1,
    transition: { staggerChildren: 0.1, delayChildren: 0.2 }
  }
}
const item = {
  hidden: { opacity: 0, y: 24 },
  show: { opacity: 1, y: 0, transition: { duration: 0.6, ease: [0.16, 1, 0.3, 1] } }
}
// Usage: <motion.ul variants={container} initial="hidden" animate="show">
//          <motion.li variants={item}>...</motion.li>
```

#### 2. Clip-Path Reveal (Wipe Up)
Text or image wipes in from bottom — Awwwards staple.
```tsx
const clipReveal = {
  hidden: { clipPath: 'inset(100% 0% 0% 0%)' },
  show: {
    clipPath: 'inset(0% 0% 0% 0%)',
    transition: { duration: 0.9, ease: [0.76, 0, 0.24, 1] }
  }
}
```

#### 3. Scale Bloom
Element scales up from 0.85 with fade — feels premium, not cheap.
```tsx
const bloom = {
  hidden: { opacity: 0, scale: 0.85 },
  show: {
    opacity: 1, scale: 1,
    transition: { duration: 0.8, ease: [0.16, 1, 0.3, 1] }
  }
}
```

#### 4. Letter Stagger (Headline Reveal)
Each letter animates individually — use for hero headlines.
```tsx
// Split text into spans first, then:
const letterVariants = {
  hidden: { opacity: 0, y: '1em' },
  visible: (i: number) => ({
    opacity: 1, y: 0,
    transition: { delay: i * 0.04, duration: 0.5, ease: [0.22, 1, 0.36, 1] }
  })
}
```

#### 5. Horizontal Slide In
Content enters from left or right — good for split layouts.
```tsx
const slideIn = (direction: 'left' | 'right') => ({
  hidden: { opacity: 0, x: direction === 'left' ? -60 : 60 },
  show: { opacity: 1, x: 0, transition: { duration: 0.7, ease: [0.25, 1, 0.5, 1] } }
})
```

#### 6. Blur Reveal
Element fades in while sharpening from blur — editorial feel.
```tsx
const blurReveal = {
  hidden: { opacity: 0, filter: 'blur(12px)' },
  show: {
    opacity: 1, filter: 'blur(0px)',
    transition: { duration: 0.8, ease: 'easeOut' }
  }
}
```

---

### SCROLL-TRIGGERED ANIMATIONS

#### 7. Scroll Fade In View
```tsx
function ScrollReveal({ children }: { children: React.ReactNode }) {
  const ref = useRef(null)
  const isInView = useInView(ref, { once: true, margin: '-10% 0px' })
  return (
    <motion.div ref={ref}
      initial={{ opacity: 0, y: 40 }}
      animate={isInView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.7, ease: [0.16, 1, 0.3, 1] }}>
      {children}
    </motion.div>
  )
}
```

#### 8. Parallax Scroll
Element moves at a different rate than scroll — depth illusion.
```tsx
function Parallax({ speed = 0.5, children }: { speed?: number; children: React.ReactNode }) {
  const ref = useRef(null)
  const { scrollYProgress } = useScroll({ target: ref, offset: ['start end', 'end start'] })
  const y = useTransform(scrollYProgress, [0, 1], [`-${speed * 100}px`, `${speed * 100}px`])
  return <motion.div ref={ref} style={{ y }}>{children}</motion.div>
}
```

#### 9. Horizontal Scroll Section
Content scrolls horizontally as user scrolls vertically.
```tsx
function HorizontalScroll({ children }: { children: React.ReactNode }) {
  const ref = useRef(null)
  const { scrollYProgress } = useScroll({ target: ref })
  const x = useTransform(scrollYProgress, [0, 1], ['0%', '-75%'])
  return (
    <section ref={ref} className="relative h-[400vh]">
      <div className="sticky top-0 overflow-hidden">
        <motion.div style={{ x }} className="flex">
          {children}
        </motion.div>
      </div>
    </section>
  )
}
```

#### 10. Progress-Based Scale
Element scales up as it enters the viewport.
```tsx
const { scrollYProgress } = useScroll({ target: ref, offset: ['start end', 'center center'] })
const scale = useTransform(scrollYProgress, [0, 1], [0.8, 1])
const opacity = useTransform(scrollYProgress, [0, 0.5], [0, 1])
```

#### 11. Scrub Text Highlight
Words highlight sequentially as user scrolls — Stripe / Linear style.
```tsx
// Each word gets opacity tied to scroll progress ranges
const words = text.split(' ')
// word[i] opacity: useTransform(scrollYProgress, [i/n, (i+1)/n], [0.2, 1])
```

#### 12. Counter / Number Morphing
Numbers animate to final value on scroll enter.
```tsx
function Counter({ from = 0, to, duration = 2 }: { from?: number; to: number; duration?: number }) {
  const ref = useRef(null)
  const isInView = useInView(ref, { once: true })
  const count = useMotionValue(from)
  const rounded = useTransform(count, Math.round)
  useEffect(() => {
    if (isInView) animate(count, to, { duration, ease: 'easeOut' })
  }, [isInView])
  return <motion.span ref={ref}>{rounded}</motion.span>
}
```

---

### HOVER EFFECTS

#### 13. Magnetic Hover
Element is pulled toward cursor — seen on premium CTAs and nav items.
```tsx
function Magnetic({ children }: { children: React.ReactNode }) {
  const ref = useRef<HTMLDivElement>(null)
  const x = useMotionValue(0)
  const y = useMotionValue(0)
  const springX = useSpring(x, { stiffness: 150, damping: 15, mass: 0.1 })
  const springY = useSpring(y, { stiffness: 150, damping: 15, mass: 0.1 })

  const handleMouseMove = (e: React.MouseEvent) => {
    const rect = ref.current!.getBoundingClientRect()
    const centerX = rect.left + rect.width / 2
    const centerY = rect.top + rect.height / 2
    x.set((e.clientX - centerX) * 0.35)
    y.set((e.clientY - centerY) * 0.35)
  }
  const handleMouseLeave = () => { x.set(0); y.set(0) }

  return (
    <motion.div ref={ref} style={{ x: springX, y: springY }}
      onMouseMove={handleMouseMove} onMouseLeave={handleMouseLeave}>
      {children}
    </motion.div>
  )
}
```

#### 14. Tilt Card (3D Perspective)
Card tilts on mouse position — depth on hover.
```tsx
function TiltCard({ children }: { children: React.ReactNode }) {
  const x = useMotionValue(0)
  const y = useMotionValue(0)
  const rotateX = useTransform(y, [-0.5, 0.5], [12, -12])
  const rotateY = useTransform(x, [-0.5, 0.5], [-12, 12])

  const handleMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect()
    x.set((e.clientX - rect.left) / rect.width - 0.5)
    y.set((e.clientY - rect.top) / rect.height - 0.5)
  }
  return (
    <motion.div style={{ rotateX, rotateY, transformStyle: 'preserve-3d' }}
      onMouseMove={handleMouseMove}
      onMouseLeave={() => { x.set(0); y.set(0) }}
      whileHover={{ scale: 1.02 }}
      transition={{ type: 'spring', stiffness: 300, damping: 30 }}>
      {children}
    </motion.div>
  )
}
```

#### 15. Underline Draw
Animated underline draws in on hover — elegant link effect.
```tsx
// Wrap text in relative span, add ::after via className, then animate scaleX
<motion.span className="relative">
  text
  <motion.span
    className="absolute bottom-0 left-0 h-px w-full bg-current origin-left"
    initial={{ scaleX: 0 }}
    whileHover={{ scaleX: 1 }}
    transition={{ duration: 0.3, ease: [0.16, 1, 0.3, 1] }}
  />
</motion.span>
```

#### 16. Hover Lift with Shadow
Element rises with shadow on hover — tactile, material feel.
```tsx
<motion.div
  whileHover={{ y: -6, boxShadow: '0 20px 60px rgba(0,0,0,0.15)' }}
  transition={{ type: 'spring', stiffness: 400, damping: 25 }}
/>
```

#### 17. Background Spotlight (Radial Follow)
Spotlight follows cursor within a card — glassmorphism enhancement.
```tsx
function SpotlightCard({ children }: { children: React.ReactNode }) {
  const [position, setPosition] = useState({ x: 0, y: 0 })
  const [opacity, setOpacity] = useState(0)

  const handleMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect()
    setPosition({ x: e.clientX - rect.left, y: e.clientY - rect.top })
  }
  return (
    <div className="relative overflow-hidden rounded-2xl"
      onMouseMove={handleMouseMove}
      onMouseEnter={() => setOpacity(1)}
      onMouseLeave={() => setOpacity(0)}>
      <div className="pointer-events-none absolute inset-0 transition-opacity duration-300"
        style={{
          opacity,
          background: `radial-gradient(600px circle at ${position.x}px ${position.y}px,
            rgba(255,255,255,0.06), transparent 40%)`
        }} />
      {children}
    </div>
  )
}
```

#### 18. Color Shift Hover
Background or text transitions between colors — chromatic, editorial.
```tsx
<motion.div
  initial={{ backgroundColor: '#000000' }}
  whileHover={{ backgroundColor: '#FF3366' }}
  transition={{ duration: 0.4, ease: 'easeInOut' }}
/>
```

#### 19. Image Zoom Reveal
Image zooms out from inside container on hover — gallery effect.
```tsx
<div className="overflow-hidden rounded-xl">
  <motion.img
    src={src}
    whileHover={{ scale: 1.08 }}
    transition={{ duration: 0.7, ease: [0.25, 1, 0.5, 1] }}
    className="w-full h-full object-cover"
  />
</div>
```

#### 20. Rotate on Hover
Element rotates slightly — playful but precise.
```tsx
<motion.div whileHover={{ rotate: 6 }} transition={{ type: 'spring', stiffness: 300 }} />
```

#### 36. Arrow Nudge Hover (Service Row)
Border-separated list rows where a `→` glyph slides right on hover — the standard agency service list interaction. Clean, minimal, communicates clickability without visual clutter.
```javascript
// GSAP — vanilla JS
document.querySelectorAll('a.group').forEach(function (row) {
  var arrow = Array.from(row.querySelectorAll('span'))
    .find(function (s) { return s.textContent.trim() === '→'; });
  if (!arrow) return;
  row.addEventListener('mouseenter', function () {
    gsap.to(arrow, { x: 8, duration: 0.32, ease: 'expo.out' });
  });
  row.addEventListener('mouseleave', function () {
    gsap.to(arrow, { x: 0, duration: 0.32, ease: 'expo.out' });
  });
});
```
```tsx
// React / Framer Motion
<motion.a className="group flex justify-between items-center border-b py-6"
  initial="rest" whileHover="hover">
  <span>{label}</span>
  <motion.span variants={{ rest: { x: 0 }, hover: { x: 8 } }}
    transition={{ duration: 0.32, ease: [0.19, 1, 0.22, 1] }}>
    →
  </motion.span>
</motion.a>
```
**Pattern rules:** Arrow starts at `x: 0`, nudges to `x: 8` on hover. The row itself can also darken/invert on hover (`hover:bg-[#171717]`). Works best with `border-t` or `border-b` separators — the border acts as visual structure so the row needs no background at rest.

#### 37. Letter Spacing Breathe ("→" CTA Links)
Subtle tracking expansion on hover for inline "Learn more →" or "Read more →" links. Creates breathing room without movement — feels refined on editorial sites.
```javascript
// GSAP
document.querySelectorAll('a').forEach(function (el) {
  if (el.textContent.trim().slice(-1) !== '→') return;
  el.addEventListener('mouseenter', function () {
    gsap.to(el, { letterSpacing: '0.04em', duration: 0.3, ease: 'power2.out' });
  });
  el.addEventListener('mouseleave', function () {
    gsap.to(el, { letterSpacing: '0', duration: 0.3, ease: 'power2.out' });
  });
});
```
```tsx
// Framer Motion
<motion.a whileHover={{ letterSpacing: '0.04em' }}
  transition={{ duration: 0.3, ease: [0.25, 1, 0.5, 1] }}>
  Read more →
</motion.a>
```

#### 35. Char-Roll Nav Hover ⭐ DEFAULT FOR ALL NAV LINKS
**The agency-standard nav interaction.** Text splits into two stacked layers (top = visible at rest, bottom = hidden below). On hover, top chars slide up and out (`yPercent: -105`), bottom chars slide up into position (`yPercent: 105 → 0`). Produces a clean vertical roll — the hallmark of Awwwards-tier navigation.

**When to use:** Every nav link, footer link, and any short label link where you want premium tactile feedback. Apply by default unless the client explicitly requests a different nav style.

**React / Framer Motion implementation:**
```tsx
'use client'
import { useRef } from 'react'
import { motion } from 'framer-motion'

function CharRollLink({ href, children }: { href: string; children: string }) {
  const chars = children.split('')

  return (
    <a href={href} className="relative overflow-hidden inline-block align-top"
       style={{ verticalAlign: 'top' }}>
      {/* Top layer — visible at rest, rolls up on hover */}
      <motion.span
        className="flex"
        initial="rest"
        whileHover="hover"
        animate="rest">
        {chars.map((char, i) => (
          <motion.span
            key={`t-${i}`}
            className="inline-block"
            variants={{
              rest:  { yPercent: 0 },
              hover: { yPercent: -105 }
            }}
            transition={{ duration: 0.38, ease: [0.19, 1, 0.22, 1] }}>
            {char === ' ' ? ' ' : char}
          </motion.span>
        ))}
      </motion.span>
      {/* Bottom layer — hidden below at rest, rolls up on hover */}
      <motion.span
        className="flex absolute top-0 left-0 w-full"
        initial="rest"
        whileHover="hover"
        animate="rest">
        {chars.map((char, i) => (
          <motion.span
            key={`b-${i}`}
            className="inline-block"
            variants={{
              rest:  { yPercent: 105 },
              hover: { yPercent: 0 }
            }}
            transition={{ duration: 0.38, ease: [0.19, 1, 0.22, 1] }}>
            {char === ' ' ? ' ' : char}
          </motion.span>
        ))}
      </motion.span>
    </a>
  )
}
```

**Vanilla JS / GSAP implementation (static HTML sites):**
```javascript
// Call once after DOM ready. Works with any <a> element.
function initCharRoll(selector) {
  document.querySelectorAll(selector).forEach(function (link) {
    if (link.querySelector('svg')) return; // skip icon-only links
    var text = link.textContent.trim();
    if (!text || text.length > 60) return; // skip long strings

    link.textContent = '';
    gsap.set(link, { position: 'relative', overflow: 'hidden',
                     display: 'inline-block', verticalAlign: 'top' });

    var top = document.createElement('span');
    var bot = document.createElement('span');
    gsap.set(top, { display: 'block' });
    gsap.set(bot, { display: 'block', position: 'absolute',
                    top: 0, left: 0, width: '100%' });

    text.split('').forEach(function (char) {
      var t = document.createElement('span');
      var b = document.createElement('span');
      t.textContent = b.textContent = char === ' ' ? ' ' : char;
      gsap.set(t, { display: 'inline-block' });
      gsap.set(b, { display: 'inline-block', yPercent: 105 });
      top.appendChild(t);
      bot.appendChild(b);
    });

    link.appendChild(top);
    link.appendChild(bot);

    var topChars = top.querySelectorAll('span');
    var botChars = bot.querySelectorAll('span');
    var EX = 'expo.out';

    link.addEventListener('mouseenter', function () {
      gsap.killTweensOf([topChars, botChars]);
      gsap.to(topChars, { yPercent: -105, duration: 0.38, ease: EX, stagger: 0 });
      gsap.to(botChars, { yPercent: 0,    duration: 0.38, ease: EX, stagger: 0 });
    });
    link.addEventListener('mouseleave', function () {
      gsap.killTweensOf([topChars, botChars]);
      gsap.to(topChars, { yPercent: 0,   duration: 0.38, ease: EX, stagger: 0 });
      gsap.to(botChars, { yPercent: 105, duration: 0.38, ease: EX, stagger: 0 });
    });
  });
}

// Usage — call after GSAP loads:
initCharRoll('nav a');
initCharRoll('footer a');
```

**Key details that make it feel premium:**
- `overflow: hidden` on the link wrapper is mandatory — clips both layers cleanly
- `yPercent: 105` (not 100) adds a tiny gap so chars don't clip at the exact boundary
- `stagger: 0` on nav links — all chars move simultaneously for a solid, deliberate feel
- `stagger: 0.02–0.04` on display headlines — sequential for a typewriter/cascade feel
- `expo.out` / `[0.19, 1, 0.22, 1]` easing — snaps into place, never feels mechanical
- Skip links with `svg` children (logo links, icon buttons) — they have no text to split
- Skip strings longer than 40–60 chars (addresses, emails) — too many DOM nodes

---

### CURSOR EFFECTS

#### 21. Custom Cursor
Replace default cursor — follows with spring physics.
```tsx
function CustomCursor() {
  const cursorX = useMotionValue(-100)
  const cursorY = useMotionValue(-100)
  const springX = useSpring(cursorX, { stiffness: 500, damping: 28 })
  const springY = useSpring(cursorY, { stiffness: 500, damping: 28 })

  useEffect(() => {
    const move = (e: MouseEvent) => { cursorX.set(e.clientX); cursorY.set(e.clientY) }
    window.addEventListener('mousemove', move)
    return () => window.removeEventListener('mousemove', move)
  }, [])

  return (
    <motion.div
      className="fixed top-0 left-0 w-4 h-4 rounded-full bg-white mix-blend-difference
                 pointer-events-none z-[9999]"
      style={{ translateX: springX, translateY: springY, x: '-50%', y: '-50%' }}
    />
  )
}
```

#### 22. Cursor Follower (Lag)
Larger circle that lags behind cursor with more damping.
```tsx
// Same pattern as above but slower spring:
const springXSlow = useSpring(cursorX, { stiffness: 100, damping: 20 })
// Two layered circles: fast dot + slow ring
```

#### 23. Cursor Blend Mode
White circle with mix-blend-mode: difference — inverts colors beneath.
```tsx
className="mix-blend-difference bg-white"
// No border needed — blend mode creates contrast against any background
```

---

### PAGE TRANSITIONS

#### 24. Curtain Wipe
Colored overlay sweeps across screen between routes.
```tsx
// In layout.tsx with AnimatePresence:
<AnimatePresence mode="wait">
  <motion.div key={pathname}
    initial={{ opacity: 0 }}
    animate={{ opacity: 1 }}
    exit={{ opacity: 0 }}
    transition={{ duration: 0.4 }}>
    {children}
  </motion.div>
</AnimatePresence>

// Curtain overlay:
<motion.div
  className="fixed inset-0 bg-black z-50 pointer-events-none"
  initial={{ scaleY: 1, originY: 0 }}
  animate={{ scaleY: 0, originY: 0, transition: { duration: 0.6, ease: [0.76, 0, 0.24, 1] } }}
/>
```

#### 25. Morph Transition
Layout elements animate to their new positions (shared layout animation).
```tsx
<motion.div layoutId="hero-image"  // same layoutId on both pages
  transition={{ duration: 0.6, ease: [0.25, 1, 0.5, 1] }}
/>
// Framer Motion automatically animates between the two positions
```

---

### ADVANCED EFFECTS

#### 26. Liquid / Blob Morphing
SVG path morphs between shapes — used in background decorations.
```tsx
<motion.path
  animate={{
    d: [
      'M 50,20 C 80,0 100,40 80,70 C 60,100 20,90 10,60 C 0,30 20,40 50,20',
      'M 50,10 C 90,10 95,50 75,80 C 55,110 10,95 5,65 C 0,35 10,10 50,10',
    ]
  }}
  transition={{ duration: 4, repeat: Infinity, repeatType: 'mirror', ease: 'easeInOut' }}
/>
```

#### 27. Infinite Ticker / Marquee
Horizontal looping text — brand strips, client logos.
```tsx
function Ticker({ items }: { items: string[] }) {
  return (
    <div className="overflow-hidden">
      <motion.div
        className="flex gap-8 whitespace-nowrap"
        animate={{ x: ['0%', '-50%'] }}
        transition={{ duration: 20, repeat: Infinity, ease: 'linear' }}>
        {[...items, ...items].map((item, i) => <span key={i}>{item}</span>)}
      </motion.div>
    </div>
  )
}
```

#### 28. Grid Reveal Stagger
Grid of cards reveals row by row or item by item.
```tsx
const gridContainer = {
  hidden: {},
  show: { transition: { staggerChildren: 0.08 } }
}
const gridItem = {
  hidden: { opacity: 0, scale: 0.9 },
  show: { opacity: 1, scale: 1, transition: { duration: 0.5, ease: [0.16, 1, 0.3, 1] } }
}
```

#### 29. Typewriter Effect
Text types out character by character — editorial, code-adjacent.
```tsx
function Typewriter({ text, delay = 0.05 }: { text: string; delay?: number }) {
  return (
    <>
      {text.split('').map((char, i) => (
        <motion.span key={i}
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: i * delay, duration: 0 }}>
          {char}
        </motion.span>
      ))}
    </>
  )
}
```

#### 30. Accordion / Expand
Smooth height animation for expandable content.
```tsx
<AnimatePresence>
  {isOpen && (
    <motion.div
      initial={{ height: 0, opacity: 0 }}
      animate={{ height: 'auto', opacity: 1 }}
      exit={{ height: 0, opacity: 0 }}
      transition={{ duration: 0.4, ease: [0.25, 1, 0.5, 1] }}>
      {content}
    </motion.div>
  )}
</AnimatePresence>
```

#### 31. Drag to Dismiss / Sort
Draggable elements with snap-back or reorder.
```tsx
<motion.div drag dragConstraints={constraintRef}
  dragElastic={0.1}
  whileDrag={{ scale: 1.05, zIndex: 10 }}
  dragTransition={{ bounceStiffness: 300, bounceDamping: 20 }}
/>
```

#### 32. Smooth Scroll with Lenis + Framer
Butter-smooth scrolling that syncs with Framer Motion scroll utilities.
```tsx
// Install: npm i lenis
import Lenis from 'lenis'
import { useEffect } from 'react'

function useLenis() {
  useEffect(() => {
    const lenis = new Lenis({ lerp: 0.1, wheelMultiplier: 0.8 })
    const raf = (time: number) => { lenis.raf(time); requestAnimationFrame(raf) }
    requestAnimationFrame(raf)
    return () => lenis.destroy()
  }, [])
}
// Use in root layout alongside Framer Motion useScroll
```

#### 33. Scroll-Driven SVG Filter (zero re-render)
Drive any SVG filter attribute directly from a Framer Motion MotionValue — no React
state, no re-renders, runs at 60fps. Use for scroll-driven blur, glow, distortion, or
any effect where a filter parameter needs to track scroll position.
```tsx
import { useRef, useEffect } from 'react'
import { useScroll, useTransform } from 'framer-motion'

function ScrollDistortSection() {
  const ref = useRef<HTMLElement>(null)
  const blurRef = useRef<SVGFEGaussianBlurElement>(null)

  const { scrollYProgress } = useScroll({ target: ref, offset: ['start start', 'end start'] })
  const blurAmount = useTransform(scrollYProgress, [0, 0.6], [0, 24])

  // Key insight: .on('change') writes directly to the SVG DOM attribute.
  // No useState, no useMotionTemplate, no component re-render on every frame.
  useEffect(() => {
    return blurAmount.on('change', (v) => {
      blurRef.current?.setAttribute('stdDeviation', String(v))
    })
  }, [blurAmount])

  return (
    <section ref={ref}>
      <svg className="absolute w-0 h-0 overflow-hidden" aria-hidden="true">
        <defs>
          <filter id="scroll-blur" x="-20%" y="-20%" width="140%" height="140%">
            <feGaussianBlur ref={blurRef} in="SourceGraphic" stdDeviation="0" result="blurred" />
            {/* Chain additional filter primitives here — feColorMatrix, feDisplacementMap, etc. */}
          </filter>
        </defs>
      </svg>
      <div style={{ filter: 'url(#scroll-blur)' }}>
        {/* content */}
      </div>
    </section>
  )
}
```

#### 34. Gooey / Liquid Blob Effect (SVG feColorMatrix)
The gooey effect combines CSS blur with an SVG alpha-threshold filter. The
`feColorMatrix` snaps blurry semi-transparent edges into solid shapes, creating a
liquid merging effect between elements or a melting effect on a single element.

**Critical:** Always zero the RGB rows (`0 0 0 0 0`) when targeting a solid-colour
output. Leaving them as pass-through (`1 0 0 0 0`) lets blurred background-colour
pixels leak into the blob, creating grey/patchy edges instead of clean solid colour.
```tsx
{/* SVG filter — place once, reference anywhere via filter: url(#gooey) */}
<svg className="absolute w-0 h-0 overflow-hidden" aria-hidden="true">
  <defs>
    <filter id="gooey" x="-20%" y="-20%" width="140%" height="140%">
      <feGaussianBlur in="SourceGraphic" stdDeviation="8" result="blurred" />
      {/*
       * RGB rows zeroed → output is always pure black (or swap 0→1 in offset col for white)
       * Alpha row: 255 × alpha_in − 140 → pixels above ~55% alpha snap to fully opaque
       * Raise the offset (e.g. -100 instead of -140) for fatter blobs
       * Lower it (e.g. -180) for tighter, more separated blobs
       */}
      <feColorMatrix
        in="blurred"
        type="matrix"
        values="0 0 0 0 0
                0 0 0 0 0
                0 0 0 0 0
                0 0 0 255 -140"
      />
    </filter>
  </defs>
</svg>

{/* Wrap target elements — they merge/pool where blurred edges overlap */}
<div style={{ filter: 'url(#gooey)' }}>
  <span className="blob-item">A</span>
  <span className="blob-item">B</span>
</div>
```

---

## 21st.dev PAIRING — Components by Design Pattern

Every layout pattern maps to the best 21st.dev component. Always output the install command.

| Design Pattern | 21st.dev Component | Install Command |
|---|---|---|
| Hero with large headline | hero-with-mockup | `npx 21st-cli add hero-with-mockup` |
| Minimal text-only hero | minimal-hero | `npx 21st-cli add minimal-hero` |
| Feature grid (3-4 col) | bento-grid | `npx 21st-cli add bento-grid` |
| Feature cards with icons | feature-cards | `npx 21st-cli add feature-cards` |
| Testimonial carousel | testimonials | `npx 21st-cli add testimonials` |
| Pricing table | pricing-table | `npx 21st-cli add pricing-table` |
| Navigation (sticky) | navbar | `npx 21st-cli add navbar` |
| Mobile hamburger nav | mobile-nav | `npx 21st-cli add mobile-nav` |
| Logo ticker / marquee | logo-ticker | `npx 21st-cli add logo-ticker` |
| FAQ accordion | accordion | `npx 21st-cli add accordion` |
| CTA banner | cta-section | `npx 21st-cli add cta-section` |
| Footer | footer | `npx 21st-cli add footer` |
| Stats / numbers | stats | `npx 21st-cli add stats` |
| Timeline | timeline | `npx 21st-cli add timeline` |
| Team grid | team-grid | `npx 21st-cli add team-grid` |
| Image gallery | image-gallery | `npx 21st-cli add image-gallery` |
| Blog card grid | blog-cards | `npx 21st-cli add blog-cards` |
| Dashboard sidebar | sidebar | `npx 21st-cli add sidebar` |
| Data table | data-table | `npx 21st-cli add data-table` |
| Modal / dialog | dialog | `npx 21st-cli add dialog` |
| Form | form | `npx 21st-cli add form` |
| Command palette | command | `npx 21st-cli add command` |
| Notification toast | toast | `npx 21st-cli add toast` |
| Avatar stack | avatar | `npx 21st-cli add avatar` |
| Dark mode toggle | theme-toggle | `npx 21st-cli add theme-toggle` |

**Animation wrappers to always add around 21st.dev components:**
- Wrap cards in `ScrollReveal` (effect #7)
- Wrap CTAs in `Magnetic` (effect #13)
- Wrap hero headlines in `Fade Up Stagger` (effect #1) or `Letter Stagger` (effect #4)
- Wrap image sections in `Parallax` (effect #8)
- **Replace all nav link text with `CharRollLink` (effect #35) — non-negotiable default**
- **Replace all footer link text with `CharRollLink` (effect #35)**

---

## DESIGN EXTRACTION REPORT FORMAT

Present findings in this exact structure:

```
## Caliber Report: [Site Name]
**Source**: [URL] | **Award**: [e.g., Awwwards SOTD] | **Studio**: [if known]

### Visual DNA
- **Colors**: [list hex values with role] — primary: #xxx, accent: #xxx, bg: #xxx
- **Typography**: [font names + usage] — headline: X, body: Y, mono: Z
- **Spacing**: [tight / generous / editorial] — [describe rhythm]
- **Radius**: [sharp / subtle (4-8px) / rounded (12-24px) / pill]
- **Shadows**: [none / soft / hard / glow] — [describe]
- **Layout**: [grid system description]

### Motion Language
- **Entry**: [describe what happens on load]
- **Scroll**: [parallax / pin / horizontal / scrub / none]
- **Hover**: [magnetic / tilt / underline / glow / scale / none]
- **Cursor**: [custom / blend / trail / default]
- **Transitions**: [page transitions description]

### Interaction Quality Score: [X]/10
[1-sentence reasoning]

### Animation Matches
[List of 3-5 named effects from the ANIMATION LIBRARY that best match]
- Effect #XX — [Name]: [why it matches]

### Component Recommendations
[List 21st.dev components with install commands]

### UI UX Pro Max Brief
[Packaged handoff — see HANDOFF FORMAT below]
```

---

## UI UX PRO MAX HANDOFF FORMAT

When passing to UI UX Pro Max, provide this exact brief:

```
## Caliber → UI UX Pro Max Handoff

**Building**: [what the user is building]
**Reference Site(s)**: [extracted sites]
**Target Quality Level**: Awwwards-tier / Agency / Premium SaaS

### Extracted Signals for Planning

COLOR SYSTEM:
- Primary: [hex] — [usage]
- Secondary: [hex] — [usage]
- Accent: [hex] — [usage]
- Background: [hex] — [tone: warm/cool/neutral]
- Text: [hex] — [contrast approach]

TYPOGRAPHY:
- Headline: [font] — [weight, size treatment]
- Body: [font] — [size, line-height philosophy]
- Accent/Mono: [font if any]

MOTION LANGUAGE:
- Primary entry: [Effect name from library]
- Scroll behavior: [Effect name]
- Hover personality: [Effect names]
- Easing philosophy: [snappy spring / smooth ease / dramatic cubic]

LAYOUT APPROACH:
- System: [grid / editorial / fullbleed / bento]
- Whitespace: [generous / tight]
- Image treatment: [description]

ANIMATION EFFECTS TO IMPLEMENT:
[List effect numbers and names from ANIMATION LIBRARY]

21st.dev COMPONENTS TO INSTALL:
[npx install commands]

ADDITIONAL CONTEXT:
[Any other extracted signals — brand voice, photography style, UI personality]
```

UI UX Pro Max will use these signals to select from its 161 color palettes, 57 font pairings, and 67 UI styles — but biased toward what Caliber extracted rather than starting from scratch.

---

## CODE OUTPUT FORMAT

All generated code follows this structure:

```
src/
├── app/
│   ├── layout.tsx          ← Lenis + CustomCursor + AnimatePresence wrapper
│   └── page.tsx            ← Page composition
├── components/
│   ├── motion/             ← Reusable Framer Motion wrappers
│   │   ├── ScrollReveal.tsx
│   │   ├── Magnetic.tsx
│   │   ├── TiltCard.tsx
│   │   ├── Parallax.tsx
│   │   └── CustomCursor.tsx
│   ├── sections/           ← Page sections using 21st.dev components
│   │   ├── Hero.tsx
│   │   ├── Features.tsx
│   │   └── CTA.tsx
│   └── ui/                 ← 21st.dev installed components
└── lib/
    └── animations.ts       ← Shared variant objects
```

### Standard Imports for Every File
```tsx
'use client'
import { motion, AnimatePresence, useScroll, useTransform,
         useSpring, useInView, useMotionValue } from 'framer-motion'
// Tailwind for layout, 21st.dev for primitives, Framer Motion for everything that moves
```

### Easing Constants (use consistently)
```ts
export const ease = {
  // Smooth out — most general purpose
  smooth: [0.25, 1, 0.5, 1] as const,
  // Snappy spring feel — buttons, interactive
  snap: [0.16, 1, 0.3, 1] as const,
  // Dramatic editorial — headlines, reveals
  dramatic: [0.76, 0, 0.24, 1] as const,
  // Gentle — background elements
  gentle: [0.4, 0, 0.2, 1] as const,
}
```

---

## GSAP STATIC SITE PATTERNS

For static HTML / no-build projects (no React, no bundler), use GSAP instead of Framer Motion. All the same effects apply — just different syntax.

### Setup — Async CDN Load Without Jank

**The problem:** When GSAP loads from a CDN, it arrives 200–500ms after first paint. Any `gsap.from()` with `ScrollTrigger` defaults to `immediateRender: false`, so elements snap to their "from" state when the trigger fires rather than on parse — causing a visible jump.

**The fix — two-pronged:**
```html
<!-- 1. Preload hints in <head> — reduce the CDN load window -->
<link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" as="script" crossorigin>
<link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js" as="script" crossorigin>
```

```javascript
// 2. immediateRender: true on ALL scroll-triggered gsap.from() calls
gsap.from(el, {
  y: 20, opacity: 0, duration: 0.8, ease: 'expo.out',
  immediateRender: true,  // ← sets from-state immediately when run() fires, not on scroll
  scrollTrigger: { trigger: el, start: 'top 90%', once: true }
});
```

### Batch Animations (rows, grids) — Pre-Hide Pattern

**Problem:** `gsap.from()` inside `ScrollTrigger.batch onEnter` snaps elements to their offset state on scroll entry rather than animating smoothly.

**Fix:** Pre-hide with `gsap.set()` before the batch, then use `gsap.to()` inside `onEnter`:
```javascript
// ✅ Correct — pre-hide + animate to final state
var cards = document.querySelectorAll('.grid > *');
gsap.set(cards, { opacity: 0, y: 24, scale: 0.98 });
ScrollTrigger.batch(cards, {
  onEnter: function (batch) {
    gsap.to(batch, {
      y: 0, opacity: 1, scale: 1, duration: 0.65,
      stagger: 0.07, ease: 'expo.out',
      clearProps: 'transform,opacity'  // ← cleans up inline styles after animation
    });
  },
  start: 'top 90%',
  once: true
});

// ❌ Wrong — snaps to from-state on scroll
ScrollTrigger.batch(cards, {
  onEnter: function (batch) {
    gsap.from(batch, { y: 24, opacity: 0, ... }); // causes jank
  }
});
```

### Standard GSAP Scroll Reveal Stack
```javascript
function run() {
  gsap.registerPlugin(ScrollTrigger);
  var EX = 'expo.out';

  // Section headings
  document.querySelectorAll('section h1, section h2, section h3').forEach(function (el) {
    gsap.from(el, { y: 20, opacity: 0, duration: 0.8, ease: EX,
                    immediateRender: true,
                    scrollTrigger: { trigger: el, start: 'top 90%', once: true } });
  });

  // Body paragraphs
  document.querySelectorAll('section p').forEach(function (el) {
    gsap.from(el, { y: 14, opacity: 0, duration: 0.65, ease: EX,
                    immediateRender: true,
                    scrollTrigger: { trigger: el, start: 'top 92%', once: true } });
  });

  // Grid cards — batch pattern
  var cards = Array.from(document.querySelectorAll('.grid > div, .grid > a'));
  if (cards.length) {
    gsap.set(cards, { opacity: 0, y: 24, scale: 0.98 });
    ScrollTrigger.batch(cards, {
      onEnter: function (batch) {
        gsap.to(batch, { y: 0, opacity: 1, scale: 1, duration: 0.65,
                         stagger: 0.07, ease: EX, clearProps: 'transform,opacity' });
      },
      start: 'top 90%', once: true
    });
  }

  // Nav + footer char-roll hover
  initCharRoll('nav a');
  initCharRoll('footer a');

  // Button lift + shadow
  document.querySelectorAll('a[class*="border"]').forEach(function (btn) {
    btn.addEventListener('mouseenter', function () {
      gsap.to(btn, { y: -3, boxShadow: '0 10px 32px rgba(0,0,0,0.13)', duration: 0.28, ease: EX });
    });
    btn.addEventListener('mouseleave', function () {
      gsap.to(btn, { y: 0, boxShadow: '0 0px 0px rgba(0,0,0,0)', duration: 0.28, ease: EX });
    });
  });
}
```

### GSAP Easing Reference
| Feel | GSAP string | Framer Motion equivalent |
|------|------------|--------------------------|
| General purpose | `expo.out` | `[0.19, 1, 0.22, 1]` |
| Smooth | `power2.out` | `[0.25, 1, 0.5, 1]` |
| Dramatic/editorial | `power4.inOut` | `[0.76, 0, 0.24, 1]` |
| Spring-like | `elastic.out(1, 0.5)` | `type: 'spring'` |

---

## DESIGN TOKEN PATTERNS

### Hover Tint Colour (Learned Pattern)
When a brand has a single accent colour (e.g. `#5391ce`), **don't use the same colour for hover states** — it gives no feedback. Generate a lighter tint at ~65% lightness for button hover:

```
Primary:    #5391ce  (base accent)
Hover tint: #79adf2  (lighter, ~20% brighter — use on hover bg)
Dark hover: #171717  (use when hovering over light/neutral elements)
```

Rule of thumb:
- **Blue button at rest → hover bg = lighter tint** (`#79adf2`), **text = dark** (`#171717`)
- **Light/bordered button → hover bg = dark** (`#171717`), **text = light** (`#c8c9c5`)
- **Nav links → hover colour = accent** (`#5391ce`), not opacity change

Never use `opacity` as the only hover signal on nav links — it reads as disabled, not interactive.

---

---

## SWISS / INTERNATIONAL TYPOGRAPHIC STYLE LAYOUT SYSTEM

The Swiss grid is the correct system for: advisory firms, law firms, financial services, architecture studios, editorial brands, and any identity that prioritises rigour over decoration. It is **NOT** a default — it is a deliberate style choice. Use it when the brief calls for authority, precision, and typographic sophistication.

### Core Philosophy
- Structure is visible: columns, baselines, and hairline rules ARE the decoration
- Zero border-radius. Zero box-shadow. No gradients. No glassmorphism.
- Typography does all the heavy lifting — size, weight, tracking, and leading are the hierarchy
- Whitespace is intentional and generous. Margins breathe.
- Accent colour used sparingly: only for category labels, active states, and key underlines

### Grid Definition
```css
.grid-swiss {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 20px;
}

/* Common column spans */
.col-4  { grid-column: span 4; }
.col-5  { grid-column: span 5; }
.col-7  { grid-column: span 7; }
.col-8  { grid-column: span 8; }
.col-12 { grid-column: span 12; }

/* Asymmetric layouts — always use these over symmetrical halves */
/* Hero: content 8 / sidebar 4 */
/* Body: body 7 / aside 4 (col-start-9) */
/* Feature: image 4 / copy 8 */
```

### Tailwind Equivalent Patterns
```html
<!-- Hero: asymmetric -->
<div class="grid grid-cols-12 gap-5">
  <div class="col-span-12 lg:col-span-8"> <!-- headline --> </div>
  <div class="col-span-12 lg:col-span-4"> <!-- meta/aside --> </div>
</div>

<!-- Article body + sidebar -->
<div class="grid grid-cols-12 gap-16">
  <div class="lg:col-span-7"> <!-- body copy --> </div>
  <aside class="lg:col-span-4 lg:col-start-9"> <!-- sidebar --> </aside>
</div>

<!-- Feature section: image left, copy right -->
<div class="grid grid-cols-12 gap-5">
  <div class="lg:col-span-5"> <!-- image --> </div>
  <div class="lg:col-span-6 lg:col-start-7"> <!-- copy --> </div>
</div>
```

### Typography Rules
| Role | Size | Weight | Leading | Tracking |
|------|------|--------|---------|----------|
| Hero display | `clamp(80px, 8vw, 130px)` | 300–400 | `0.88` | `-0.04em` |
| Section headline | `clamp(40px, 4vw, 72px)` | 300–400 | `0.92` | `-0.03em` |
| Subheading | `clamp(22px, 2.5vw, 36px)` | 400 | `1.1` | `-0.02em` |
| Body | `17–18px` | 400 | `1.8` | `0` |
| Label / eyebrow | `11–12px` | 400 | `1` | `0.12–0.15em` |
| Caption / meta | `12–13px` | 400 | `1.4` | `0.08em` |

**Rule**: headings are always `font-weight: 300` or `400` — never `700`. Weight is irrelevant when size already commands the hierarchy.

### Eyebrow / Section Numbers
Swiss layouts use numbered section markers instead of decorative icons:
```html
<!-- Section opener pattern -->
<span class="text-[#5391ce] text-[13px] tracking-[0.15em] uppercase block mb-4">01</span>
<h2 class="font-normal leading-[0.92]" style="font-size:clamp(40px,4vw,72px);letter-spacing:-0.03em;">
  Section heading
</h2>
```

### Hairline Border System
```css
.hairline-black { border-top: 1px solid #171717; }
.hairline-grey  { border-top: 1px solid rgba(23, 23, 23, 0.2); }
.hairline-v-grey { border-right: 1px solid rgba(23, 23, 23, 0.15); }
```
Rules span the full column width. They define sections — no padding-top gap before them.

### Service List Row (Swiss Standard)
Used for service listings, team members, capabilities, case studies:
```html
<div class="border-t border-[#171717] border-opacity-20 py-8 flex items-center justify-between group cursor-pointer">
  <div class="flex items-center gap-8">
    <span class="text-[#5391ce] text-[12px] tracking-[0.15em] uppercase w-16 shrink-0">01</span>
    <span class="text-[18px] font-normal">Service Name</span>
  </div>
  <span class="text-[20px] opacity-40 group-hover:opacity-100 group-hover:translate-x-2 transition-all duration-300">→</span>
</div>
```

### Flat Accent Nav
Swiss advisory sites use the accent colour as a solid nav background (not dark, not white):
```html
<nav style="background-color: #5391ce;" class="fixed top-0 left-0 right-0 z-50">
  <!-- Logo in dark/neutral, links in dark -->
  <a class="text-[#171717] text-[12px] tracking-[0.1em] uppercase">Link</a>
  <!-- CTA: dark bg, light text — inverts the nav colour -->
  <a class="bg-[#171717] text-[#c8c9c5] px-6 py-3 text-[12px] tracking-[0.08em] uppercase">Enquire</a>
</nav>
```

### No-Decoration Rules
Apply these to any Swiss layout:
```html
<!-- All containers: no rounded corners -->
class="rounded-none"

<!-- All images: sharp crop, no shadow -->
<img class="w-full h-full object-cover" style="border-radius:0;box-shadow:none;">

<!-- All cards: border only, no shadow -->
class="border border-[#171717] p-8"

<!-- Pull quote: left rule only, no bg tint -->
<blockquote class="border-l-2 border-[#5391ce] pl-8 my-12">
```

### Swiss Colour Palette Pattern
```
Background:  #c8c9c5  (warm grey — never pure white)
Foreground:  #171717  (near-black — never pure black)
Accent:      #5391ce  (single brand blue — used sparingly)
Hover tint:  #79adf2  (lighter tint for hover states)
Mid tone:    rgba(23, 23, 23, 0.2)  (hairlines and dividers)
Muted text:  rgba(23, 23, 23, 0.5)  (captions, labels, meta)
```

---

## STATIC SITE COMPONENT ARCHITECTURE

For HTML/CSS/JS static sites without a framework build step, use the **JS injection pattern** for shared nav, footer, and breadcrumbs.

### Pattern: Placeholder + Runtime Injection
```html
<!-- In every .html page, before </body>: -->
<div id="vca-nav"></div>          <!-- top of body -->
<div id="vca-breadcrumb"></div>   <!-- after first hero section closes -->
<div id="vca-footer"></div>       <!-- bottom of body -->

<script src="nav.js"></script>
<script src="animations.js"></script>
```

### nav.js Core Structure
```js
// Page registry — single source of truth
const PAGES = {
  'index.html':   { label: 'Home',     parent: null,         navGroup: 'home' },
  'about.html':   { label: 'About',    parent: null,         navGroup: 'about' },
  'services.html':{ label: 'Services', parent: null,         navGroup: 'services' },
  'news.html':    { label: 'News',     parent: null,         navGroup: 'news' },
  // Detail pages inherit parent for breadcrumbs:
  'news-article.html': { label: 'Article Title', parent: 'news.html', navGroup: 'news' },
};

function currentHref() {
  return window.location.pathname.split('/').pop() || 'index.html';
}

// Breadcrumb: walk parent chain
function buildBreadcrumb(href) {
  if (href === 'index.html' || !href) return '';
  const crumbs = [];
  let cur = href;
  while (cur && cur !== 'index.html') {
    const page = PAGES[cur];
    crumbs.unshift({ href: cur, label: page?.label || cur });
    cur = page?.parent;
  }
  crumbs.unshift({ href: 'index.html', label: 'Home' });
  const parts = crumbs.map((c, i) =>
    i < crumbs.length - 1
      ? `<a href="${c.href}">${c.label}</a><span class="sep">/</span>`
      : `<span>${c.label}</span>`
  );
  return `<div class="vca-breadcrumb max-w-[1440px] mx-auto px-10">${parts.join('')}</div>`;
}

// Inject on load
document.addEventListener('DOMContentLoaded', () => {
  const active = currentHref();
  const navEl = document.getElementById('vca-nav');
  const bcEl  = document.getElementById('vca-breadcrumb');
  const ftEl  = document.getElementById('vca-footer');
  if (navEl) navEl.outerHTML = buildNav(active);
  if (bcEl)  bcEl.outerHTML  = `<section class="bg-[#c8c9c5]">${buildBreadcrumb(active)}</section>`;
  if (ftEl)  ftEl.outerHTML  = buildFooter();
  initMobileMenu();
});
```

### Active Link Detection
```js
function buildNav(activeHref) {
  return NAV_LINKS.map(link => {
    const isActive = PAGES[activeHref]?.navGroup === link.group;
    return `<a href="${link.href}"
      class="nav-link text-[12px] tracking-[0.1em] uppercase ${isActive ? 'nav-link-active' : ''}">
      ${link.label}
    </a>`;
  }).join('');
}
```

**Key rules for the injection pattern:**
- Always use `outerHTML` assignment to replace the entire placeholder, not `innerHTML`
- Mobile menu `id` must be unique — never repeat an `id` across included HTML strings
- Test with `file://` protocol locally — `location.pathname` works; `location.href` includes the domain
- The placeholder divs are `<div>` not `<section>` — the injected HTML provides the semantic wrapper

### Global CSS File
Extract all shared styles to `global.css` — loaded after Tailwind CDN script:
```html
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="global.css">
```

`global.css` should contain:
- `font-family` reset
- `.nav-logo` responsive height
- `.nav-link` / `.nav-link-active` hover styles
- `.vca-breadcrumb` with border-bottom
- Any animation keyframes used globally (e.g. `.bar` chart grow)
- Anything that would otherwise be duplicated across 20+ `<style>` blocks

---

## SEO CHECKLIST — STATIC HTML SITES

Run this against every page before shipping:

### `<head>` Requirements (per page)
```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Page Title — Max 65 chars | Brand Name</title>
<meta name="description" content="50–160 chars. Specific to this page. No duplicate descriptions.">
<meta name="robots" content="index, follow">
<link rel="canonical" href="https://www.domain.com/page.html">

<!-- Open Graph -->
<meta property="og:type" content="website"> <!-- or "article" for news -->
<meta property="og:title" content="...">
<meta property="og:description" content="...">
<meta property="og:url" content="https://www.domain.com/page.html">
<meta property="og:image" content="https://www.domain.com/images/og-image.jpg"> <!-- 1200×630px -->
<meta property="og:site_name" content="Brand Name">
```

### Schema.org (JSON-LD — add to `<head>`)
```html
<!-- Home + About pages: LocalBusiness or ProfessionalService -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ProfessionalService",
  "name": "Firm Name",
  "url": "https://www.domain.com",
  "address": { "@type": "PostalAddress", "addressLocality": "Adelaide", "addressRegion": "SA" },
  "description": "..."
}
</script>

<!-- News/article pages -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Article Title",
  "author": { "@type": "Person", "name": "Author Name" },
  "datePublished": "2025-05-01",
  "publisher": { "@type": "Organization", "name": "Brand Name" }
}
</script>
```

### Content Rules
- `<h1>`: exactly one per page — never skip to `<h2>` without an `<h1>`
- Heading order: `h1 → h2 → h3` — no level skips
- Images: all `<img>` tags need `alt=""` (empty string is OK for decorative)
- Links: no "click here" — anchor text must describe the destination
- Title tags: unique across all pages — never duplicate
- Meta descriptions: unique across all pages — never duplicate

### Performance Signals
```html
<!-- Preload critical scripts (GSAP CDN) -->
<link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" as="script" crossorigin>
<link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js" as="script" crossorigin>

<!-- Hero images: eager load, not lazy -->
<img src="hero.jpg" loading="eager" fetchpriority="high">

<!-- Below-fold images: lazy load -->
<img src="team.jpg" loading="lazy">
```

### Internal Linking
- Every page must be reachable from at least one other page
- Breadcrumbs provide crawlable internal link paths
- News index → all article detail pages (visible linked list)
- Footer: link to all top-level pages

---

## INTEGRATION NOTES

### With Nano Banana 2
Use extracted photography/imagery style to generate matching visuals:
- Describe the exact aesthetic from the reference site
- Include color temperature, subject matter, compositional style

### Quality Check
Before presenting code to the user, verify:
- [ ] Every moving element uses Framer Motion (no CSS-only transitions for primary interactions)
- [ ] All cards/sections wrapped in appropriate motion wrappers from this library
- [ ] Magnetic effect on primary CTA
- [ ] Scroll reveal on all below-fold content
- [ ] Custom cursor if the reference site had one
- [ ] Lenis installed for smooth scroll
- [ ] Easing constants from `animations.ts` used consistently (not random values)
