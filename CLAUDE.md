# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Personal portfolio website for a Senior Mobile Architect (Android, iOS, Flutter). Aesthetic: "Precision Engineering Meets Elegant Craft" — dark-first, architectural minimalism with deliberate accent pops. Built entirely in Flutter targeting web (primary), with macOS/iOS/Android/Linux/Windows shells available.

## Commands

```bash
# Install dependencies
flutter pub get

# Run
flutter run -d chrome                          # web (primary target)
flutter run -d macos                           # desktop

# Build for web (production)
flutter build web --release --web-renderer canvaskit

# Lint / analyze
flutter analyze

# Tests
flutter test                                   # all tests
flutter test test/widget_test.dart             # single file
flutter test --coverage                        # with coverage
```

## Architecture

Single-page scrollable app. All content is static, loaded from JSON assets — no backend except an optional contact form (EmailJS or Firebase Functions).

### State management & routing

- **Riverpod 2.x** for all state (theme toggle, scroll/nav active section, data loading)
- **go_router** with hash routes (`/#about`, `/#projects`, etc.)
- **freezed + json_serializable** for immutable data models

### Planned project structure

```
lib/
├── core/
│   ├── theme/          # app_colors.dart, app_typography.dart, app_theme.dart, app_spacing.dart
│   ├── responsive/     # breakpoints.dart, responsive_layout.dart, responsive_value.dart
│   ├── constants/      # app_strings.dart, app_assets.dart, social_links.dart
│   ├── widgets/        # section_label, gradient_text, tech_chip, animated_card, device_mockup
│   └── utils/          # scroll_utils.dart, animation_helpers.dart
├── data/
│   ├── models/         # project, expertise, repo, testimonial, article (all freezed)
│   ├── datasources/    # local_data_source.dart (JSON), github_data_source.dart (optional)
│   └── repositories/   # portfolio_repository.dart
├── presentation/
│   ├── home_page.dart  # single scrollable page, houses all sections
│   ├── sections/       # nav/, hero/, stats/, about/, expertise/, projects/, open_source/,
│   │                   # tech_stack/, testimonials/, blog/, contact/, footer/
│   └── shared/         # scroll_reveal.dart (viewport-triggered animation wrapper)
├── state/
│   └── providers/      # theme_provider, nav_provider, portfolio_provider
├── router/
│   └── app_router.dart
└── main.dart
```

### Data

All content is JSON under `assets/data/` (projects.json, expertise.json, experience.json, repos.json, testimonials.json, skills.json, articles.json). Images are WebP under `assets/images/`.

### Key dependencies (to be added to pubspec.yaml)

| Package | Purpose |
|---|---|
| `flutter_riverpod` | State management |
| `go_router` | Hash-based routing |
| `freezed` / `json_serializable` | Immutable models + codegen |
| `flutter_animate` | Scroll-triggered reveals, stagger animations |
| `google_fonts` | Playfair Display, Space Grotesk, Inter, JetBrains Mono |
| `very_good_analysis` | Strict linting |
| `flutter_meta_seo` | OG tags, Twitter cards |
| `dio` | GitHub API (optional, Phase 3) |

Web renderer: **CanvasKit** (required for rich animations and consistent cross-browser rendering).

## Design system

### Colors (dark-first palette)

| Token | Value | Usage |
|---|---|---|
| `--bg-primary` | `#0D1117` | Page background |
| `--bg-surface` | `#161B22` | Cards, panels |
| `--bg-elevated` | `#1F2937` | Hover states |
| `--accent-primary` | `#54C5F8` | CTAs, links, highlights (Flutter Blue) |
| `--accent-deep` | `#0288D1` | Gradient anchor, borders |
| `--accent-dart` | `#FF6E40` | Tags, badges (rare) |
| `--text-primary` | `#F0F6FC` | Headings, body |
| `--text-secondary` | `#8B949E` | Subtext, captions |
| `--text-muted` | `#484F58` | Decorative, disabled |

Gradients: hero glow = radial `rgba(84,197,248,0.08)→transparent`; blue = `linear-gradient(135deg, #54C5F8, #0288D1, #01579B)`; section dividers = 1px `linear-gradient(90deg, transparent, #54C5F8, transparent)`.

### Typography

| Element | Font | Size | Weight |
|---|---|---|---|
| Hero Name | Playfair Display | 80px | 700 |
| Section Title | Space Grotesk | 42px | 600 |
| Hero Title / Card Title | Space Grotesk | 22px / 20px | 400 / 600 |
| Body | Inter | 16px | 400 |
| Code / Tag / Section label | JetBrains Mono | 13px | 400 |
| Navigation | Space Grotesk | 14px | 500 |

Section label motif: every section prefixed with `// 0N section-name` in JetBrains Mono 13px, `--accent-primary` color.

### Layout

- Max content width: 1200px centered
- Responsive breakpoints: Mobile <640px · Tablet 640–1024px · Desktop 1024–1280px · Wide >1280px
- Section vertical padding: 120px desktop / 80px tablet / 60px mobile
- Border radius: Cards 16px · Buttons 8px · Tags 6px · Images 20px

## Page sections (scroll order)

Nav (fixed 64px) → Hero (100vh, 60/40 split) → Stats strip (~120px, 5 count-up metrics) → About (60/40, ProfileWidget terminal card) → Expertise (2×3 card grid) → Projects (3 alternating full-width rows) → Open Source (3-col repo cards + contribution graph) → Tech Stack (3-col chip groups) → Testimonials → Writing (optional) → Contact (terminal card + form) → Footer

## Build priorities (start here)

1. `core/theme/app_colors.dart` — 13 color tokens as static constants
2. `core/theme/app_typography.dart` — 4 font families + type scale
3. `core/theme/app_theme.dart` — ThemeData composing both
4. `core/responsive/breakpoints.dart` — breakpoint constants
5. `presentation/home_page.dart` — scroll controller + section layout
6. `presentation/sections/nav/` — nav bar (most reused)
7. `presentation/sections/hero/` — first impression, highest design effort
8. `state/providers/` — theme toggle + nav active state

## Coding rules (enforced)

These rules apply to every file written or modified in this project. Violations must be fixed before considering a task complete.

### No hardcoded values

| What | Where to put it | Import |
|---|---|---|
| Strings, labels, bios, section text | `lib/core/constants/app_strings.dart` → `AppStrings` | `../constants/app_strings.dart` |
| Social/external URLs | `lib/core/constants/social_links.dart` → `SocialLinks` | `../constants/social_links.dart` |
| Asset paths | `lib/core/constants/app_assets.dart` → `AppAssets` | `../constants/app_assets.dart` |
| Colors, gradients | `lib/core/theme/app_colors.dart` → `AppColors` | `../theme/app_colors.dart` |
| Text styles | `lib/core/theme/app_typography.dart` → `AppTypography` | `../theme/app_typography.dart` |
| Spacing, radii, widths | `lib/core/theme/app_spacing.dart` → `AppSpacing` | `../theme/app_spacing.dart` |
| Breakpoint values | `lib/core/responsive/breakpoints.dart` → `Breakpoints` | `../responsive/breakpoints.dart` |

**Never** write a raw `Color(0xFF...)`, a pixel literal for spacing, a font size literal, a URL string, or a display string directly inside a widget file. Define the constant first, then reference it.

### Linting

- Dart `very_good_analysis` is in effect. Run `flutter analyze` before marking a task done; zero warnings is the target.
- Use `const` constructors and `const` literals wherever Dart allows it.
- Remove redundant named arguments (e.g. default-value arguments the analyzer flags).
- Do not use adjacent string literals inside list literals — extract each string to a named `static const` first.

### Responsive dimensions

- Use `Breakpoints.isMobile(width)` / `Breakpoints.isDesktop(width)` for branch logic.
- Use `AppSpacing.sectionPadding(width)` for section-level padding.
- Never hard-code a numeric breakpoint value inline; reference `Breakpoints.mobile`, `Breakpoints.tablet`, etc.

### Data

- All portfolio content lives in `assets/data/*.json`. Widgets must never contain display data (names, bios, stats, URLs) that belongs in JSON or `AppStrings`.
- JSON file content must match the corresponding freezed model fields exactly. Unknown extra JSON fields are tolerated but missing required fields will throw at runtime.

## CI/CD

GitHub Actions (`.github/workflows/deploy.yml`): `flutter analyze` → `flutter test --coverage` → `flutter build web --release --web-renderer canvaskit` → Lighthouse CI (target 90+ all categories) → deploy to Firebase Hosting with custom domain.
