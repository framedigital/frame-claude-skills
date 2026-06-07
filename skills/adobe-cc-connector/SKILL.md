---
name: adobe-cc-connector
description: Adobe Creative Suite connector for Claude — exposes Photoshop, Premiere, After Effects, Illustrator, and Audition inside Claude chat. Batch edit, cut, animate, and process entire campaigns from one prompt without opening a single Adobe window. Use when asked to edit photos, cut video, animate graphics, or process any Adobe file. Triggers on "edit in photoshop", "cut this video", "animate", "adobe", "batch edit", "post-production", "creative suite". Source: instagram.com/p/DY2qMv8MVnp/
---

# Adobe CC Connector

The entire Adobe Creative Suite as a Claude chat command. One prompt handles the full post-production stack — batch Photoshop edits, Premiere cuts, After Effects animations — without switching apps.

**Source**: [Instagram](https://www.instagram.com/p/DY2qMv8MVnp/) | Comment "EDIT" on the post for the official connector setup guide.

## What It Unlocks
- **Photoshop**: Batch retouching, background removal, color grading, resizing
- **Premiere Pro**: Cutting, silence removal, rough cuts, clip assembly
- **After Effects**: Motion graphics, titles, transitions, animations
- **Illustrator**: Vector work, logo manipulation, print prep
- **Audition**: Audio cleanup, noise reduction, normalization

## Setup

### 1. Install the Adobe for Creativity Connector
The Adobe for Creativity MCP connector bridges Claude and your Adobe apps.

```bash
# Check if Adobe apps are installed
ls /Applications | grep -i adobe

# Install the connector (comment "EDIT" on the source post for the download link)
# Or search: "Adobe for Creativity Claude connector"
```

### 2. Add to MCP Config
```json
{
  "mcpServers": {
    "adobe-creative": {
      "command": "/path/to/adobe-creativity-connector",
      "description": "Adobe Creative Suite — Photoshop, Premiere, After Effects"
    }
  }
}
```

### 3. Verify Connection
Open Claude Code and type: "List available Adobe tools"

## Workflow Examples

### Campaign Batch Edit (Photoshop)
```
Batch edit all images in ./assets/campaign/:
- Remove backgrounds on all product shots
- Apply brand color grade (warm, +15 saturation)
- Export 1:1 for Instagram and 9:16 for Stories
- Save to ./exports/
```

### Video Assembly (Premiere)
```
Cut the interview recording at ./raw/interview.mp4:
- Remove all silences longer than 0.5 seconds
- Add lower thirds with name "Sam Pearce" at 0:03
- Color grade to cinematic (desaturate shadows, warm highlights)
- Export as H.264, 1080p
```

### Motion Graphics (After Effects)
```
Create a 15-second brand reveal animation:
- Logo flies in with motion blur at 0:02
- Text "Frame Creative Agency" fades in at 0:04  
- Brand colors: [your hex values]
- Export as transparent MOV for overlay use
```

## Usage
```
/adobe-cc-connector
/adobe-cc-connector batch edit ./product-photos/
/adobe-cc-connector cut this interview ./raw/footage.mp4
/adobe-cc-connector animate logo reveal
```
