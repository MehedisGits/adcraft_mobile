# AdCraft Mobile

> AI-Powered Ad Copy Generator — Flutter frontend for the [AdCraft FastAPI backend](https://github.com/MehedisGits/adcraft)

## Features

- **3-Step Wizard** — Product Brief → Platform Selection → Tone & Options
- **6 Platforms** — Facebook, Google Ads, Instagram, LinkedIn, Twitter/X, TikTok
- **6 Tones** — Professional, Casual, Urgent, Inspirational, Humorous, Empathetic
- **Variations slider** — generate 1–10 copy variants per request
- **Quality Scores** — sentiment analysis + safety check displayed per result
- **Platform Compliance** — headline/body/hashtag limit checks
- **One-tap copy** — copy individual headlines, body copy, CTA, or all hashtags
- **Dark Premium UI** — glassmorphism cards, electric violet accent, Plus Jakarta Sans

## Design System

| Token | Value |
|---|---|
| Background | `#0F0F1A` |
| Surface | `#1A1A2E` |
| Accent | `#6C63FF` |
| Accent Alt (CTA) | `#FF6B9D` |
| Font | Plus Jakarta Sans |

## Getting Started

### 1. Clone & install

```bash
git clone https://github.com/MehedisGits/adcraft_mobile
cd adcraft_mobile
flutter pub get
```

### 2. Connect to backend

**Android emulator** (default — no change needed):
```dart
// lib/core/constants/api_constants.dart
static const String baseUrl = 'http://10.0.2.2:8000';
```

**iOS simulator / real device:**
```dart
static const String baseUrl = 'http://192.168.1.YOUR_IP:8000';
```

### 3. Run the backend

```bash
# In the adcraft/ repo
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

### 4. Run the app

```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   ├── constants/   # API URL, platform & tone metadata
│   ├── theme/       # AppColors, AppTheme (M3 dark)
│   └── errors/      # ApiException
├── data/
│   ├── models/      # GenerateRequest, GenerateResponse (Freezed)
│   └── services/    # AdcraftService (Dio)
├── providers/       # WizardFormNotifier, GenerateNotifier (Riverpod)
└── screens/
    ├── home/        # HomeScreen (animated gradient)
    ├── generate/    # 3-step wizard
    ├── generating/  # Loading animation screen
    └── result/      # Result display with copy actions
```

## Dependencies

| Package | Purpose |
|---|---|
| `flutter_riverpod` | State management |
| `dio` | HTTP client |
| `freezed` + `json_serializable` | Immutable models + JSON |
| `google_fonts` | Plus Jakarta Sans |
| `flutter_animate` | Entrance & interaction animations |
| `gap` | Spacing utility |

## Screens

### Home
Animated gradient background with `◈ AdCraft` logo, tagline, and gradient CTA button.

### Generate (3-step wizard)
1. **Brief** — Product name, description, target audience
2. **Platform** — 2×3 branded card grid with glow on selection
3. **Tone** — Emoji chips + variations slider + language field

### Generating
Pulsing concentric rings animation while API call is in progress. Auto-navigates to result on success, shows error dialog on failure.

### Result
Staggered card entrance showing headlines, body copy, CTA, hashtags, quality scores, and compliance badges. Full copy support.

## API Contract

**POST `/generate`**
```json
{
  "product": "TaskFlow Pro",
  "description": "Project management for small teams",
  "target_audience": "SMB owners aged 25-45",
  "platform": "facebook",
  "tone": "professional",
  "language": "en",
  "num_variations": 5
}
```

**Response**
```json
{
  "headlines": ["..."],
  "body_copy": "...",
  "cta": "...",
  "hashtags": ["#productivity"],
  "quality_scores": { "sentiment": "positive", "sentiment_score": 0.94, "safety": "safe", "safety_score": 0.98 },
  "platform_compliance": { "headline_within_limit": true, "body_within_limit": true, "hashtag_count_valid": true },
  "platform": "facebook",
  "tone": "professional",
  "model_used": "gpt-4o-mini"
}
```

## Built by

[Rakibul Islam Mehedi](https://github.com/MehedisGits) — Flutter Developer · Engineer with a Marketer's Eye
