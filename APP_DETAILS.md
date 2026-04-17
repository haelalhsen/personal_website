# Flutter Portfolio Website — Integrated Project Plan

**Role:** Senior Mobile Architect (Android, iOS, Flutter)
**Aesthetic:** "Precision Engineering Meets Elegant Craft"
**Dark-first, architectural minimalism with deliberate accent pops**

---

## 1. Page structure (scroll order)

| #     | Section      | Height | Layout                            | Key element                                  |
| ----- | ------------ | ------ | --------------------------------- | -------------------------------------------- |
| fixed | Navigation   | 64px   | Full-width, blur backdrop         | `{ AM }` logo + 5 links + "Download CV" CTA  |
| 100vh | Hero         | 100vh  | 60/40 two-column                  | Name block + floating device mockups         |
| strip | Stats        | ~120px | Full-width band, 5 metric columns | Count-up animated numbers                    |
| // 01 | About        | auto   | 60/40 two-column                  | Bio text + "ProfileWidget()" card            |
| // 02 | Expertise    | auto   | 2×3 card grid                     | 6 expertise cards with icons + tech tags     |
| // 03 | Projects     | auto   | Alternating full-width rows       | 3 featured case studies with mockups         |
| // 04 | Open Source  | auto   | 3-column card grid                | GitHub-style repo cards + contribution graph |
| // 05 | Tech Stack   | auto   | 3-column categorized groups       | Skill chips with proficiency indicators      |
| // 06 | Testimonials | auto   | 2-column card grid / carousel     | Quote cards with avatars + ratings           |
| // 07 | Writing      | auto   | 3-column article cards (optional) | Blog post previews linking to Medium         |
| // 08 | Contact      | auto   | 2-column: terminal card + form    | `contact.dart` terminal + input form         |
| end   | Footer       | ~160px | 3-column                          | Logo + nav + socials + "Built with Flutter"  |

**Section label motif:** Every section prefixed with `// 0N section-name` in JetBrains Mono 13px, colored `--accent-primary`.

---

## 2. Design system

### 2.1 Color tokens

| Role                | Token              | Value     | Usage                      |
| ------------------- | ------------------ | --------- | -------------------------- |
| Background Primary  | `--bg-primary`     | `#0D1117` | Page background            |
| Background Surface  | `--bg-surface`     | `#161B22` | Cards, panels              |
| Background Elevated | `--bg-elevated`    | `#1F2937` | Hover states, modals       |
| Flutter Blue        | `--accent-primary` | `#54C5F8` | CTAs, highlights, links    |
| Flutter Blue Deep   | `--accent-deep`    | `#0288D1` | Gradient anchor, borders   |
| Dart Orange         | `--accent-dart`    | `#FF6E40` | Tags, badges (rare accent) |
| Text Primary        | `--text-primary`   | `#F0F6FC` | Headings, main body        |
| Text Secondary      | `--text-secondary` | `#8B949E` | Subtext, captions, labels  |
| Text Muted          | `--text-muted`     | `#484F58` | Decorative, disabled       |
| Border Subtle       | `--border-subtle`  | `#21262D` | Card borders               |
| Border Accent       | `--border-accent`  | `#30363D` | Dividers                   |
| Success             | `--success`        | `#3FB950` | Status indicators          |

**Gradient accents:**

- Hero glow: `radial-gradient(rgba(84,197,248,0.08) → transparent)`
- Blue gradient: `linear-gradient(135deg, #54C5F8, #0288D1, #01579B)`
- Section dividers: `linear-gradient(90deg, transparent, #54C5F8, transparent)` — 1px tall

### 2.2 Typography

| Element       | Font             | Size | Weight | Line Height | Letter Spacing |
| ------------- | ---------------- | ---- | ------ | ----------- | -------------- |
| Hero Name     | Playfair Display | 80px | 700    | 1.0         | -2px           |
| Hero Title    | Space Grotesk    | 22px | 400    | 1.4         | 0              |
| Section Title | Space Grotesk    | 42px | 600    | 1.2         | -1px           |
| Card Title    | Space Grotesk    | 20px | 600    | 1.3         | 0              |
| Body          | Inter            | 16px | 400    | 1.7         | 0              |
| Caption       | Inter            | 13px | 400    | 1.5         | 0.2px          |
| Code / Tag    | JetBrains Mono   | 13px | 400    | 1.4         | 0              |
| Navigation    | Space Grotesk    | 14px | 500    | 1.0         | 0.5px          |

**Google Fonts import:** `Playfair+Display:wght@700`, `Space+Grotesk:wght@400;500;600;700`, `Inter:wght@400;500`, `JetBrains+Mono:wght@400`

### 2.3 Spacing & layout

- Max content width: 1200px centered
- Column grid: 12-col desktop / 4-col tablet / 1-col mobile
- Gutter: 24px
- Section vertical padding: 120px desktop / 80px tablet / 60px mobile
- Card inner padding: 32px desktop / 24px mobile
- Border radius: Cards 16px, Buttons 8px, Tags 6px, Images 20px

### 2.4 Responsive breakpoints

| Breakpoint | Width       | Key changes                                      |
| ---------- | ----------- | ------------------------------------------------ |
| Mobile     | < 640px     | Single column, hamburger nav, reduced type scale |
| Tablet     | 640–1024px  | 2-column grids, inline nav                       |
| Desktop    | 1024–1280px | Full layout, standard                            |
| Wide       | > 1280px    | 1200px max-width container centered              |

---

## 3. Section design specs

### 3.1 Navigation

- Fixed top bar, transparent initially → `--bg-surface` + `backdrop-filter: blur(20px)` + 1px bottom border after 80px scroll
- Logo: `{ AM }` in JetBrains Mono, brackets in `--accent-primary`
- 5 nav links: About · Expertise · Projects · Open Source · Contact
- CTA: "Download CV" outlined button, `--accent-primary` border/text → solid fill on hover
- Mobile: hamburger → full-screen overlay with centered large nav items

### 3.2 Hero

- Availability badge: pulsing green dot + "Available for Projects" pill
- Name: Playfair Display 80px, last name in gradient or `--accent-primary`
- Title line: "Senior Mobile Architect · Flutter" (Flutter in accent color)
- 2-3 line descriptor paragraph
- Tech stack chips row: `flutter` · `dart` · `riverpod` · `bloc` · `firebase` · `clean arch` · `ci/cd`
- Two CTAs: "View Projects" (solid) + "Get in Touch" (outlined)
- Social icons row: GitHub · LinkedIn · Twitter/X · Medium
- Right column: floating device mockups (two overlapping phone frames with Flutter UI)
- Background glow: radial gradient in `--accent-primary` at 8% opacity

### 3.3 Stats strip

- Full-width band on `--bg-surface`, bordered top/bottom
- 5 metrics: Years (8+) · Apps Shipped (25+) · GitHub Stars (4.2k) · Countries (15+) · Team Led (30+)
- Numbers: Space Grotesk 36px/600, labels: Inter 13px secondary
- Count-up animation on viewport entry

### 3.4 About

- Left 60%: 2-3 paragraphs + pull quote (Playfair Display italic 24px with 3px left accent bar)
- Right 40%: "ProfileWidget()" card with window chrome dots, monospace key-value pairs (location, timezone, available, languages), blinking cursor

### 3.5 Expertise (6 cards)

1. Flutter Architecture — widget tree icon — `clean arch` · `di` · `modular`
2. State Management — state machine icon — `riverpod` · `bloc` · `redux`
3. Performance Engineering — gauge icon — `devtools` · `shaders` · `profiling`
4. Platform Integration — connector icon — `platform channels` · `swift` · `kotlin`
5. Design Systems — atoms icon — `theming` · `tokens` · `storybook`
6. Team Leadership & CI/CD — org chart icon — `fastlane` · `codemagic` · `adr`

Card: `--bg-surface`, 1px `--border-subtle`, hover → accent border glow + 8px box shadow

### 3.6 Featured projects (3 alternating rows)

Each row: 50/50 split (mockup | text), alternating sides.

**Project 1 — FinTech Mobile Banking**
Tech: `flutter` · `riverpod` · `dio` · `hive` · `firebase`
Metrics: 4.9★ · 120k users · 6-month delivery

**Project 2 — Health & Fitness Platform**
Tech: `flutter` · `bloc` · `sqlite` · `health_kit` · `lottie`
Metrics: 4.7★ · 80k downloads · zero crash rate

**Project 3 — Enterprise Fleet Management**
Tech: `flutter` · `mapbox` · `websockets` · `ble` · `fastlane`
Metrics: 200+ clients · 99.9% uptime · 14 countries

### 3.7 Open Source

- 3-column grid of GitHub-style repo cards
- 6 repos: `flutter_architecture_templates` (1.2k★), `riverpod_pagination` (800★), `flutter_design_system_kit` (620★), `dart_either_extensions` (410★), `flutter_offline_sync` (380★), `codemagic_ci_templates` (290★)
- Below: GitHub contribution heatmap in site palette

### 3.8 Tech stack

Three columns with categorized chips:

- Mobile Core: Dart, Flutter, Dart FFI, Platform Channels, Widget Testing, Integration Testing
- Architecture & State: Clean Architecture, BLoC, Riverpod, GetX, Redux, MobX, TDD
- Infrastructure: Firebase, Supabase, REST/GraphQL, Fastlane, Codemagic, GitHub Actions, Figma

Proficiency legend: ◆ Expert · ◇ Proficient · ○ Familiar (no progress bars)

### 3.9 Contact

- Left: terminal-style card (`contact.dart`) with Dart syntax key-value pairs
- Right: form with floating labels — Name, Email, Project Type dropdown, Message
- Submit: full-width solid accent button with loading spinner state

---

## 4. Flutter architecture

### 4.1 Project structure

```
lib/
├── core/
│   ├── theme/
│   │   ├── app_theme.dart          // ThemeData with dark-first palette
│   │   ├── app_colors.dart         // All --bg, --accent, --text tokens
│   │   ├── app_typography.dart     // Type scale (Playfair, Space Grotesk, Inter, JetBrains)
│   │   └── app_spacing.dart        // 4/8/12/16/24/32/48/64/120 scale
│   ├── responsive/
│   │   ├── breakpoints.dart        // mobile <640, tablet <1024, desktop <1280, wide
│   │   ├── responsive_layout.dart  // LayoutBuilder wrapper
│   │   └── responsive_value.dart   // Helper for per-breakpoint values
│   ├── constants/
│   │   ├── app_strings.dart        // All copy text
│   │   ├── app_assets.dart         // Asset paths
│   │   └── social_links.dart       // GitHub, LinkedIn, Twitter URLs
│   ├── widgets/
│   │   ├── section_label.dart      // "// 0N section" monospace label
│   │   ├── section_title.dart      // Space Grotesk 42px title
│   │   ├── gradient_text.dart      // Gradient shader for name
│   │   ├── tech_chip.dart          // JetBrains Mono pill tag
│   │   ├── animated_card.dart      // Hover border glow + elevation
│   │   └── device_mockup.dart      // Phone frame wrapping screenshots
│   └── utils/
│       ├── scroll_utils.dart       // Smooth scroll, section observer
│       └── animation_helpers.dart  // Stagger, spring curves
│
├── data/
│   ├── models/
│   │   ├── project.dart            // Project data model (freezed)
│   │   ├── experience.dart         // Timeline entry model
│   │   ├── expertise.dart          // Expertise card model
│   │   ├── repo.dart               // GitHub repo model
│   │   ├── testimonial.dart        // Testimonial model
│   │   └── article.dart            // Blog article model
│   ├── datasources/
│   │   ├── local_data_source.dart  // Load from JSON assets
│   │   └── github_data_source.dart // GitHub API (optional)
│   └── repositories/
│       └── portfolio_repository.dart
│
├── presentation/
│   ├── home_page.dart              // Single scrollable page
│   ├── sections/
│   │   ├── nav/
│   │   │   ├── nav_bar.dart        // Fixed nav with scroll state
│   │   │   └── mobile_drawer.dart  // Full-screen overlay
│   │   ├── hero/
│   │   │   ├── hero_section.dart
│   │   │   ├── availability_badge.dart
│   │   │   └── phone_mockup_composition.dart
│   │   ├── stats/
│   │   │   └── stats_strip.dart    // Animated count-up
│   │   ├── about/
│   │   │   ├── about_section.dart
│   │   │   └── profile_widget_card.dart  // Terminal-style card
│   │   ├── expertise/
│   │   │   ├── expertise_section.dart
│   │   │   └── expertise_card.dart
│   │   ├── projects/
│   │   │   ├── projects_section.dart
│   │   │   └── project_row.dart    // Alternating layout
│   │   ├── open_source/
│   │   │   ├── open_source_section.dart
│   │   │   ├── repo_card.dart
│   │   │   └── contribution_graph.dart
│   │   ├── tech_stack/
│   │   │   └── tech_stack_section.dart
│   │   ├── testimonials/
│   │   │   ├── testimonials_section.dart
│   │   │   └── testimonial_card.dart
│   │   ├── blog/
│   │   │   ├── blog_section.dart
│   │   │   └── article_card.dart
│   │   ├── contact/
│   │   │   ├── contact_section.dart
│   │   │   ├── terminal_card.dart  // contact.dart code card
│   │   │   └── contact_form.dart
│   │   └── footer/
│   │       └── footer_section.dart
│   └── shared/
│       └── scroll_reveal.dart      // Visibility-triggered animation wrapper
│
├── state/
│   ├── providers/
│   │   ├── theme_provider.dart     // Dark/light toggle
│   │   ├── nav_provider.dart       // Active section, scroll offset
│   │   └── portfolio_provider.dart // Data loading state
│   └── scroll_controller_provider.dart
│
├── router/
│   └── app_router.dart             // go_router with hash routes
│
└── main.dart
```

### 4.2 Tech stack decisions

| Concern          | Choice                        | Rationale                                      |
| ---------------- | ----------------------------- | ---------------------------------------------- |
| State management | Riverpod 2.x                  | Lightweight, compile-safe, ideal for portfolio |
| Routing          | go_router                     | Hash routes (`/#about`), deep linking          |
| Code generation  | freezed + json_serializable   | Immutable models for project/experience data   |
| Animations       | flutter_animate               | Scroll-triggered reveals, stagger effects      |
| Hero animation   | Rive or Lottie                | Device mockup entrance animation               |
| HTTP (optional)  | dio                           | GitHub API integration                         |
| Web renderer     | CanvasKit                     | Rich animations, consistent cross-browser      |
| SEO              | flutter_meta_seo              | Meta tags, Open Graph, Twitter cards           |
| Font loading     | google_fonts                  | Playfair, Space Grotesk, Inter, JetBrains Mono |
| Analytics        | firebase_analytics            | Page views, section engagement                 |
| Form backend     | EmailJS or Firebase Functions | Contact form submission                        |
| Linting          | very_good_analysis            | Strict lint rules (shows code quality)         |

### 4.3 Data management

All content lives in JSON under `assets/data/`:

```
assets/
├── data/
│   ├── projects.json       // 3 featured projects with full case study data
│   ├── expertise.json      // 6 expertise cards
│   ├── experience.json     // Career timeline entries
│   ├── repos.json          // Open source repos
│   ├── testimonials.json   // Quotes + reviewer info
│   ├── skills.json         // Categorized tech stack
│   └── articles.json       // Blog post metadata
├── images/
│   ├── projects/           // App screenshots in WebP
│   ├── devices/            // Phone frame SVGs
│   ├── icons/              // Custom monoline SVG icons
│   └── avatar.webp         // Profile photo
└── fonts/                  // Self-hosted fallbacks
```

---

## 5. Animation spec

### 5.1 Page load sequence

| Element       | Delay | Duration | Easing   | Transform                  |
| ------------- | ----- | -------- | -------- | -------------------------- |
| Nav bar       | 0ms   | 400ms    | ease-out | opacity 0→1                |
| Hero line 1   | 100ms | 600ms    | ease-out | translateY(20)→0 + opacity |
| Hero line 2   | 200ms | 600ms    | ease-out | translateY(20)→0 + opacity |
| Tech chips    | 350ms | 500ms    | ease-out | stagger 50ms each          |
| CTAs          | 500ms | 400ms    | ease-out | opacity 0→1                |
| Phone mockups | 300ms | 800ms    | spring   | scale(0.95→1) + opacity    |

### 5.2 Scroll-triggered

- Section titles: slide-up + fade at 80% viewport threshold
- Cards: stagger 100ms each, slide-up/fade
- Stats counters: count-up animation on viewport entry
- Timeline entries: reveal sequentially on scroll

### 5.3 Hover states

- Expertise cards: border glow transition 200ms, lift with subtle shadow
- Project rows: scale(1.0→1.005) 200ms
- Nav links: color transition 150ms
- Buttons: background/border fill 200ms

---

## 6. CI/CD pipeline

```
push to main
    │
    ├─ flutter analyze (very_good_analysis)
    ├─ flutter test --coverage
    ├─ flutter build web --release --web-renderer canvaskit
    ├─ Generate sitemap.xml + robots.txt
    ├─ Lighthouse CI (target: 90+ all categories)
    │
    └─ Deploy to Firebase Hosting
        ├─ Custom domain: yourname.dev
        └─ Cloudflare CDN (optional layer)
```

**GitHub Actions workflow:** `.github/workflows/deploy.yml`

---

## 7. SEO checklist

- [ ] `flutter_meta_seo` configured with title, description, OG tags
- [ ] `robots.txt` in `web/` directory
- [ ] `sitemap.xml` generated at build time
- [ ] JSON-LD Person schema in `web/index.html`
- [ ] Canonical URL set
- [ ] Open Graph image (1200×630) — hero section screenshot
- [ ] Twitter Card meta tags
- [ ] Semantic HTML structure (headings hierarchy)
- [ ] Alt text on all images
- [ ] Lighthouse accessibility score ≥ 90

---

## 8. Performance checklist

- [ ] CanvasKit renderer with tree-shaking
- [ ] WebP images (max 200KB per image)
- [ ] Deferred loading for below-fold sections
- [ ] Font preloading for Playfair + Space Grotesk (critical path)
- [ ] Gzip/Brotli compression on hosting
- [ ] Service worker for offline caching (optional)
- [ ] Lazy-load project screenshots
- [ ] Minimize main.dart.js bundle with `--dart2js-optimization O4`
- [ ] Critical CSS inlined in index.html
- [ ] Target: <3s First Contentful Paint on 3G

---

## 9. Phased delivery

### Phase 1 — MVP (2 weeks)

- [x] Project scaffolding + architecture setup
- [ ] Theme system (colors, typography, spacing tokens)
- [ ] Responsive layout framework
- [ ] Navigation bar (fixed, scroll-aware, mobile drawer)
- [ ] Hero section (full implementation with animations)
- [ ] Stats strip with count-up
- [ ] About section with ProfileWidget card
- [ ] Contact section (terminal card + form with EmailJS)
- [ ] Footer
- [ ] Deploy to Firebase Hosting with custom domain

### Phase 2 — Content (1 week)

- [ ] Expertise section (6 cards with hover effects)
- [ ] Projects section (3 alternating case study rows)
- [ ] Tech Stack section (categorized chip grid)
- [ ] All scroll-triggered animations
- [ ] SEO meta tags + sitemap
- [ ] Firebase Analytics integration

### Phase 3 — Polish (1 week)

- [ ] Testimonials section
- [ ] Open Source section with GitHub API integration
- [ ] Contribution heatmap widget
- [ ] Blog section (if writing exists)
- [ ] "Download CV" PDF generation or hosted link
- [ ] Lighthouse optimization pass
- [ ] Cross-browser testing (Chrome, Safari, Firefox, Edge)
- [ ] Mobile device testing

### Phase 4 — Ongoing

- [ ] Blog content pipeline
- [ ] A/B test CTA copy
- [ ] Add new projects as shipped
- [ ] Quarterly design refresh
- [ ] Monitor analytics for section engagement

---

## 10. Figma component structure

Organize the Figma file into these pages:

1. **Design Tokens** — Color styles, text styles, spacing scale, shadow tokens
2. **Components** — Nav, Hero, Stats, Section Header, Expertise Card, Project Row, Repo Card, Skill Chip, Testimonial Card, Article Card, Contact Form, Footer
3. **Mobile Components** — All above in mobile variants
4. **Desktop Page** — Full assembled scrollable desktop frame
5. **Mobile Page** — Full assembled mobile frame

All components should use Auto Layout with proper resizing constraints.

---

## 11. Key files to create first

| Priority | File                               | Purpose                                 |
| -------- | ---------------------------------- | --------------------------------------- |
| 1        | `core/theme/app_colors.dart`       | All 13 color tokens as static constants |
| 2        | `core/theme/app_typography.dart`   | 4 font families + full type scale       |
| 3        | `core/theme/app_theme.dart`        | ThemeData composing colors + typography |
| 4        | `core/responsive/breakpoints.dart` | Breakpoint constants + helper           |
| 5        | `presentation/home_page.dart`      | Main scroll controller + section layout |
| 6        | `presentation/sections/nav/`       | Navigation (most visible, most reused)  |
| 7        | `presentation/sections/hero/`      | First impression, highest design effort |
| 8        | `state/providers/`                 | Theme toggle + nav active state         |

---

_This plan integrates design specification with technical architecture. The design spec serves as the source of truth for Figma and the Flutter implementation simultaneously — every token, every spacing value, every animation curve is defined once and used everywhere._
