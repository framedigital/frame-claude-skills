---
name: remotion-editor
description: Claude + Remotion full video editing pipeline — silence detection, transcription, motion graphics, captions, export, and A/B hook variants. All from a single prompt. Use when asked to edit a video, create a reel, add captions, generate motion graphics, or A/B test video hooks. Triggers on "edit this video", "add captions", "create motion graphics", "remotion", "video editing", "generate hook variations", "reel from recording". Source: @seb_intel / instagram.com/p/DY2DRslTEM8/
---

# Remotion Editor — Claude Video Editing Pipeline

Turn raw recordings into polished reels. Drop a video in a folder, give Claude a brief, and the entire editing pipeline runs automatically: silence removal, transcription, captions, motion graphics, and multiple hook variations for A/B testing.

**Source**: [Instagram @seb_intel](https://www.instagram.com/p/DY2DRslTEM8/) | Comment "EDIT" on the post for the official skill file.

## What It Does
- **Silence detection** — removes dead air automatically
- **Transcription** — full speech-to-text via Whisper
- **Motion graphics** — animated titles, transitions, lower thirds
- **Captions** — styled auto-captions synced to speech
- **Hook variants** — generates 3-5 alternative opening hooks for A/B testing
- **Export** — MP4 ready for Instagram, TikTok, YouTube

## Setup
```bash
# Install Remotion globally
npm install -g create-video

# Install in your project
npx create-video my-edit --template blank
cd my-edit && npm install

# Install whisper-cli for transcription (macOS)
brew install whisper-cpp
```

## Workflow

### Step 1 — Drop Raw Recording
Place your raw video file in the `./input/` folder.
Tell Claude: "Edit this recording — it's a [topic] video for [platform]."

### Step 2 — Brief Claude
Provide:
- Platform target (Instagram Reels, TikTok, YouTube Shorts)
- Tone (energetic, calm, educational, entertaining)
- Any specific moments to highlight or cut
- Brand colors / font preferences

### Step 3 — Claude Runs the Pipeline
Claude will:
1. Transcribe the audio via Whisper
2. Detect and cut silence gaps > 0.3s
3. Generate motion graphics config in Remotion
4. Apply captions in your brand style
5. Produce 3 hook variants (first 3 seconds swapped out)
6. Export all variants as MP4

### Step 4 — Pick Your Hook
Review the 3 hook variants, choose one, and Claude merges it with the full edit.

## Usage
```
/remotion-editor [path to video]
/remotion-editor ./recordings/tuesday-takes.mp4
/remotion-editor — start interactive mode
```

## Tweaking
After the first edit, just describe changes:
- "Make the captions bigger and yellow"
- "The hook feels too slow, punch it up"
- "Cut the section between 2:15 and 2:45"
- "Generate 2 more hook variants focused on the pain point"
