---
name: spline-3d-web
description: Add Spline 3D assets to client websites — browse the 3D library, customize scenes, embed in Claude Code or WordPress, and fix file-size issues by converting to optimized video. Use when asked for 3D website effects, interactive 3D, or premium visual differentiators. Triggers on "3D website", "spline", "3D animation", "interactive 3D", "premium website visual", "3D effect". Source: instagram.com/p/DXEsl6BkZ8Z/
---

# Spline 3D Web

Add premium-looking interactive 3D assets to any website in minutes. Browse Spline's 3D library, customize scenes, then embed directly — or convert to a compressed video for 10x better performance.

**Source**: [Instagram](https://www.instagram.com/p/DXEsl6BkZ8Z/) | [spline.design](https://spline.design)

## The Performance Fix
Spline embeds are ~5MB — that kills page speed. The workaround:
1. Record the 3D scene as a screen recording
2. Compress via [compress-video.io](https://compress-video.io) or HandBrake
3. Embed as a looping `<video>` tag

**Result**: Same visual impact. ~200KB instead of 5MB. Lighthouse green.

## Workflow

### Step 1 — Find a Scene
Go to [spline.design](https://spline.design) → Browse Community → filter by style.

Best categories for client work:
- **Abstract** — flowing shapes, liquid metal, glass
- **Product** — clean product showcases with lighting
- **Geometric** — architectural, minimal
- **UI/Tech** — dashboards, interfaces in 3D space

### Step 2 — Customize
In the Spline editor:
- Swap colors to match brand tokens from `/design-anti-purple`
- Adjust lighting and camera angle
- Set interaction (orbit, scroll-based parallax, click-triggered)

### Step 3 — Embed (Choose One)

**Option A: Direct Embed (interactive but heavy)**
```html
<script type="module" src="https://unpkg.com/@splinetool/viewer/build/spline-viewer.js"></script>
<spline-viewer url="https://prod.spline.design/YOUR-SCENE-ID/scene.splinecode"></spline-viewer>
```

**Option B: Video (recommended for performance)**
```html
<video autoplay loop muted playsinline class="hero-3d">
  <source src="/assets/hero-3d.mp4" type="video/mp4" />
</video>
```

### Step 4 — React / Next.js Integration
```tsx
// For Claude Code builds — use Option B with Next.js Image/Video
import { useEffect, useRef } from 'react'

export function Hero3D() {
  return (
    <video 
      autoPlay loop muted playsInline
      className="absolute inset-0 w-full h-full object-cover opacity-60"
    >
      <source src="/3d-hero.mp4" type="video/mp4" />
    </video>
  )
}
```

## Usage
```
/spline-3d-web — browse and recommend a scene for my project
/spline-3d-web embed [spline URL] into my Next.js hero
/spline-3d-web optimize [existing embed] — convert to video
/spline-3d-web wolf-gang — find a fashion-appropriate 3D scene
```

## Best Pairings
- Combine with `/design-anti-purple` for the full visual token set before adding 3D
- Pair with `/10k-website` workflow for premium client deliverable
- The Wolf Gang: abstract flowing fabric or geometric luxury scenes work best
