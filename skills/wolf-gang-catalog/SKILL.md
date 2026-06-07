# /wolf-gang-catalog — Single Image → Product Catalog Skill

Turn one product photo into a complete catalog: angles, detail shots, and lifestyle scenes — no photoshoots, no 3D models.

## Trigger
Use this skill when the user says `/wolf-gang-catalog` or asks to "generate catalog images", "create product photos", "expand product shots", or "make catalog from one photo".

## What It Does
1. Takes a single product image (upload or URL)
2. Generates multiple catalog-ready variants using Higgsfield
3. Packages the output as a complete e-commerce catalog

## Catalog Output Structure
For each product, generate:
- **Hero shot** — clean white/neutral background, front-facing, lifestyle-grade lighting
- **Back shot** — rear view, same clean background
- **Detail shots (×2)** — close-ups of fabric texture, hardware, labels, stitching
- **Lifestyle scene (×2)** — worn/styled in a real-world context matching The Wolf Gang aesthetic (streetwear, minimal, editorial)
- **Flat lay** — product laid flat, overhead angle, minimal props

Total: ~7 images per product.

## Workflow

### Step 1 — Get Product Image
Ask the user: "Drop the product image or URL."
If they provide a URL, use `mcp__Claude_in_Chrome__navigate` to access it, or accept a direct file upload.

### Step 2 — Extract Product Info
Ask for (or infer from image):
- Product type (jacket, tee, hat, etc.)
- Colorway / key details
- Target aesthetic (streetwear editorial, minimal luxury, etc.)
- Any brand elements to include (TWG logo placement, tags)

### Step 3 — Generate Using Higgsfield
Use the `/higgsfield-generate` skill with these generation calls:

**Hero shot prompt template:**
```
Professional product photography of [PRODUCT] on pure white background, 
centered, soft even studio lighting, no shadows, e-commerce style, 
high resolution, 8K quality, --ar 1:1
```

**Lifestyle prompt template:**
```
[PRODUCT] worn by a [male/female] model in [urban street / minimal studio / architectural interior], 
editorial fashion photography, Wolf Gang aesthetic, moody natural light, 
film grain, high fashion magazine quality, --ar 4:5
```

**Detail shot prompt template:**
```
Extreme close-up of [FABRIC/DETAIL] on [PRODUCT], macro photography, 
razor sharp focus, studio lighting, textile detail visible, --ar 1:1
```

**Flat lay prompt template:**
```
Flat lay of [PRODUCT] on [marble / concrete / white linen], 
overhead shot, minimal props, editorial styling, 
clean composition, --ar 4:5
```

### Step 4 — Review & Iterate
Present all generated images. Ask: "Which shots need adjusting? Any angles missing?"
Re-run specific shots as needed.

### Step 5 — Package Output
Save all approved images and provide a summary:
- Image count
- Suggested filenames (e.g., `product-hero.jpg`, `product-lifestyle-1.jpg`)
- Notes on any shots that may need manual retouching

## The Wolf Gang Style Notes
- **Aesthetic**: Minimal, editorial, dark/moody with clean moments
- **Models**: Diverse, natural poses, not overly commercial
- **Backgrounds**: Raw concrete, white seamless, architectural interiors, natural outdoor
- **Avoid**: Overly bright commercial lighting, clip-art props, generic stock photo looks

## Usage Examples
```
/wolf-gang-catalog [upload product image]
/wolf-gang-catalog https://thewolfgang.com/products/jacket-01
/wolf-gang-catalog — generate catalog for the new drop
```
