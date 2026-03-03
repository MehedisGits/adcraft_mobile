# AdCraft Mobile

> AI-Powered Ad Copy Generator — Flutter frontend for the [AdCraft FastAPI backend](https://github.com/MehedisGits/adcraft)
>
> [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.3.0-02569B?logo=flutter)](https://flutter.dev) [![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)](https://flutter.dev)

## Features

- **3-Step Wizard** — Product Brief → Platform Selection → Tone & Options
- **6 Platforms** — Facebook, Google Ads, Instagram, LinkedIn, Twitter/X, TikTok
- **6 Tones** — Professional, Casual, Urgent, Inspirational, Humorous, Empathetic
- **Variations slider** — generate 1–10 copy variants per request
- **Quality Scores** — sentiment analysis + safety check displayed per result
- **Platform Compliance** — headline/body/hashtag limit checks
- **One-tap copy** — copy individual headlines, body copy, CTA, or all hashtags
- **Dark Premium UI** — glassmorphism cards, electric violet accent, Plus Jakarta Sans

## Architecture Overview

```
┌──────────────────────────────────────────────────────────┐
│  Flutter Mobile App (This Repo)                          │
│  ├─ Input: Product, Platform, Tone                       │
│  └─ Output: Generated Ad Copy & Scores                   │
└────────────────────┬─────────────────────────────────────┘
                     │ LAN (local) / HTTPS (production)
                     ▼
┌──────────────────────────────────────────────────────────┐
│  FastAPI Backend (adcraft repo)                          │
│  ├─ POST /api/v1/generate (AI copy generation)           │
│  ├─ GET /api/v1/platforms (platform metadata)            │
│  └─ External: OpenAI API + HuggingFace Models            │
└──────────────────────────────────────────────────────────┘
```

## Prerequisites

Before you start, ensure you have:

| Tool | Version | Install |
|------|---------|---------|
| Flutter SDK | ≥ 3.3.0 | [flutter.dev](https://flutter.dev/docs/get-started/install) |
| Dart SDK | ≥ 3.3.0 | (bundled with Flutter) |
| Python | ≥ 3.10 | [python.org](https://www.python.org/downloads/) |
| OpenAI API Key | — | [platform.openai.com/api-keys](https://platform.openai.com/account/api-keys) |
| Android Studio / Xcode | latest | for device/emulator setup |

**Check your versions:**
```bash
flutter --version
python --version
```

---

## Quick Start

### Part A: Backend Setup

The AdCraft FastAPI backend is a separate repository. Set it up first:

```bash
# Clone the backend
git clone https://github.com/MehedisGits/adcraft
cd adcraft

# Create virtual environment
python -m venv .venv
source .venv/bin/activate        # On Windows: .venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Copy and configure .env
cp .env.example .env
# Edit .env and add your OpenAI API key:
# OPENAI_API_KEY=sk-your-key-here
```

**Start the backend:**
```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

**⚠️ Important: Model Download on First Run**

The first call to `/api/v1/generate` will download ~938 MB of HuggingFace models. This is a **one-time operation** that may take 2–5 minutes. **Do not interrupt it.** Subsequent calls are fast (< 5 seconds).

**Verify the backend is running:**
```bash
curl http://localhost:8000/api/v1/platforms
# Should return a JSON list of platforms (facebook, google_ads, etc.)
```

---

### Part B: Flutter App Setup

```bash
# Clone this repository
git clone https://github.com/MehedisGits/adcraft_mobile
cd adcraft_mobile

# Get dependencies
flutter pub get

# Generate Freezed models (required for data models)
dart run build_runner build
```

**Configure the backend URL in `lib/core/constants/api_constants.dart`:**

Choose the correct URL based on your target:

| Target | URL | Notes |
|--------|-----|-------|
| Android emulator | `http://10.0.2.2:8000` | Default; Android emulator sees host as 10.0.2.2 |
| iOS simulator | `http://localhost:8000` | Simulator can access localhost on host machine |
| Real Android device (local) | `http://<YOUR_LAN_IP>:8000` | See "Finding Your LAN IP" below |
| Real iOS device (local) | `http://<YOUR_LAN_IP>:8000` | See "Finding Your LAN IP" below |
| Production server | `https://your-domain.com` | Use HTTPS URL of deployed backend |

**Finding Your LAN IP:**
```bash
# macOS / Linux
ipconfig getifaddr en0

# Windows
ipconfig
# Look for "IPv4 Address" under your Wi-Fi adapter (e.g., 192.168.1.42)
```

Then update `api_constants.dart`:
```dart
// lib/core/constants/api_constants.dart
static const String baseUrl = 'http://<YOUR_LAN_IP>:8000';  // e.g., 'http://192.168.1.42:8000'
```

**Run the app:**
```bash
flutter run
```

---

## Production Deployment

### Deploy the Backend

**Example: Using [Render](https://render.com)**

1. Push the `adcraft/` repository to GitHub
2. On Render, create a new **Web Service**
3. Connect your repository
4. Set environment variables:
   - `OPENAI_API_KEY` = your OpenAI key
5. Set **Start Command**: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
6. Deploy and copy the service URL (e.g., `https://adcraft-api.onrender.com`)

**Other platforms:** Railway, Heroku, AWS, DigitalOcean — all support FastAPI.

### Deploy the Flutter App

**Build release APK (Google Play):**
```bash
# Update baseUrl in api_constants.dart to your production URL
flutter build apk --release
# APK: build/app/outputs/flutter-apk/app-release.apk
```

**Build App Bundle (Play Store):**
```bash
flutter build appbundle --release
# AAB: build/app/outputs/bundle/release/app-release.aab
```

**Build for iOS:**
```bash
flutter build ios --release
# Upload via Xcode or TestFlight
```

**Security note for production:** Once your backend uses HTTPS, remove `android:usesCleartextTraffic="true"` from `AndroidManifest.xml`. This setting only allows HTTP (non-encrypted) traffic and is unsafe for production.

---

## Troubleshooting

| Error | Cause | Fix |
|-------|-------|-----|
| `ApiException(0): Connection failed` | Wrong baseUrl IP or backend unreachable | Verify the IP in `api_constants.dart` is correct. Ensure backend runs with `--host 0.0.0.0`. Test with `curl http://<IP>:8000/api/v1/platforms`. |
| `404 Not Found` on API call | Wrong endpoint path | Endpoint must be `/api/v1/generate`. Check `api_constants.dart` for the correct path. |
| `DioException [receive timeout]` | HuggingFace model downloading on first run | Normal on first `/api/v1/generate` call. Wait 2–5 minutes. If it persists, increase timeout in `AdcraftService` and ensure backend has 2+ GB RAM. |
| `flutter pub get` fails | Wrong Flutter version or pub cache issue | Ensure Flutter ≥ 3.3.0: `flutter --version`. Run `flutter clean` and try again. |
| `Error: build_runner failed` | Freezed code generation failed | Run `dart run build_runner clean` then `dart run build_runner build`. |
| Android app shows: "No internet" | Missing internet permission | Ensure `AndroidManifest.xml` has `<uses-permission android:name="android.permission.INTERNET"/>`. |
| "Operation not permitted" on real device | Backend requires HTTPS but app uses HTTP | Update `baseUrl` to HTTPS URL or ensure `android:usesCleartextTraffic="true"` is set for that domain in `network_security_config.xml`. |

---

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

## Design System

| Token | Value |
|---|---|
| Background | `#0F0F1A` |
| Surface | `#1A1A2E` |
| Accent | `#6C63FF` |
| Accent Alt (CTA) | `#FF6B9D` |
| Font | Plus Jakarta Sans |

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

**POST `/api/v1/generate`**
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

## Dependencies

| Package | Purpose |
|---|---|
| `flutter_riverpod` | State management |
| `dio` | HTTP client |
| `freezed` + `json_serializable` | Immutable models + JSON |
| `google_fonts` | Plus Jakarta Sans |
| `flutter_animate` | Entrance & interaction animations |
| `gap` | Spacing utility |

## Built by

[Rakibul Islam Mehedi](https://github.com/MehedisGits) — Flutter Developer · Engineer with a Marketer's Eye
