# Implementation Plan

Track progress by checking off tasks: `[ ]` → `[x]`

---

## Phase 1 — Foundation & MVP (2 weeks)

### 1.1 Project Setup & Dependencies

- [x] Add all dependencies to `pubspec.yaml` (flutter_riverpod, go_router, freezed, json_serializable, flutter_animate, google_fonts, very_good_analysis, flutter_meta_seo)
- [x] Add dev dependencies (freezed_annotation, build_runner, json_annotation)
- [x] Replace `flutter_lints` with `very_good_analysis` in `analysis_options.yaml`
- [x] Run `flutter pub get` and verify clean `flutter analyze`
- [x] Create `assets/data/` and `assets/images/` directories
- [x] Register asset directories in `pubspec.yaml`

### 1.2 Core Theme System

- [x] `lib/core/theme/app_colors.dart` — all 13 color tokens as static `Color` constants (bg-primary `#0D1117`, bg-surface `#161B22`, bg-elevated `#1F2937`, accent-primary `#54C5F8`, accent-deep `#0288D1`, accent-dart `#FF6E40`, text-primary `#F0F6FC`, text-secondary `#8B949E`, text-muted `#484F58`, border-subtle `#21262D`, border-accent `#30363D`, success `#3FB950`)
- [x] `lib/core/theme/app_colors.dart` — gradient definitions (hero glow, blue gradient, section divider)
- [x] `lib/core/theme/app_typography.dart` — type scale using `google_fonts` (Playfair Display 700, Space Grotesk 400/500/600/700, Inter 400/500, JetBrains Mono 400)
- [x] `lib/core/theme/app_spacing.dart` — spacing scale (4/8/12/16/24/32/48/64/120) + section padding per breakpoint (120/80/60), card padding (32/24), gutter (24), border radii (cards 16, buttons 8, tags 6, images 20)
- [x] `lib/core/theme/app_theme.dart` — `ThemeData` composing colors + typography, dark-first

### 1.3 Responsive Framework

- [x] `lib/core/responsive/breakpoints.dart` — mobile <640, tablet 640–1024, desktop 1024–1280, wide >1280
- [x] `lib/core/responsive/responsive_layout.dart` — `LayoutBuilder` wrapper widget that provides current breakpoint
- [x] `lib/core/responsive/responsive_value.dart` — helper to select values per breakpoint

### 1.4 Core Shared Widgets

- [x] `lib/core/widgets/section_label.dart` — `// 0N section-name` in JetBrains Mono 13px, accent-primary
- [x] `lib/core/widgets/section_title.dart` — Space Grotesk 42px/600
- [x] `lib/core/widgets/gradient_text.dart` — shader mask for gradient name text
- [x] `lib/core/widgets/tech_chip.dart` — JetBrains Mono pill tag
- [x] `lib/core/widgets/animated_card.dart` — hover border glow (200ms) + 8px box shadow elevation
- [x] `lib/core/widgets/device_mockup.dart` — phone frame wrapping screenshots

### 1.5 State & Routing

- [x] `lib/state/providers/theme_provider.dart` — dark/light toggle (Riverpod)
- [x] `lib/state/providers/nav_provider.dart` — active section index + scroll offset
- [x] `lib/state/providers/portfolio_provider.dart` — data loading state
- [x] `lib/state/scroll_controller_provider.dart` — shared scroll controller
- [x] `lib/router/app_router.dart` — go_router with hash routes (`/#about`, `/#expertise`, `/#projects`, `/#open-source`, `/#contact`)

### 1.6 Main App Shell

- [x] `lib/main.dart` — ProviderScope + GoRouter + AppTheme setup
- [x] `lib/presentation/home_page.dart` — single `CustomScrollView` or `ListView`, scroll controller wired to nav provider, houses all sections in order

### 1.7 Navigation

- [x] `lib/presentation/sections/nav/nav_bar.dart` — fixed 64px top bar, transparent initially → bg-surface + blur(20px) + 1px border after 80px scroll
- [x] Nav logo: `{ AM }` in JetBrains Mono, brackets in accent-primary
- [x] 5 nav links: About · Expertise · Projects · Open Source · Contact — highlight active based on scroll position
- [x] "Download CV" CTA button — outlined, accent-primary border/text → solid fill on hover
- [x] `lib/presentation/sections/nav/mobile_drawer.dart` — hamburger trigger → full-screen overlay with centered large nav items
- [x] Nav link color transition 150ms, button background/border fill 200ms

### 1.8 Hero Section

- [x] `lib/presentation/sections/hero/hero_section.dart` — 100vh height, 60/40 two-column layout
- [x] `lib/presentation/sections/hero/availability_badge.dart` — pulsing green dot + "Available for Projects" pill
- [x] Hero name: Playfair Display 80px, last name in gradient or accent-primary
- [x] Title line: "Senior Mobile Architect · Flutter" with Flutter in accent
- [x] 2–3 line descriptor paragraph
- [x] Tech stack chips row: `flutter` · `dart` · `riverpod` · `bloc` · `firebase` · `clean arch` · `ci/cd`
- [x] Two CTAs: "View Projects" (solid) + "Get in Touch" (outlined)
- [x] Social icons row: GitHub · LinkedIn · Twitter/X · Medium
- [x] `lib/presentation/sections/hero/phone_mockup_composition.dart` — two overlapping phone frames with Flutter UI screenshots
- [x] Background glow: radial gradient accent-primary at 8% opacity
- [x] Page load animation sequence: nav 0ms/400ms, hero lines staggered 100–200ms/600ms, chips 350ms/500ms stagger 50ms each, CTAs 500ms/400ms, mockups 300ms/800ms spring

### 1.9 Stats Strip

- [x] `lib/presentation/sections/stats/stats_strip.dart` — full-width bg-surface band, bordered top/bottom
- [x] 5 metrics: Years (8+) · Apps Shipped (25+) · GitHub Stars (4.2k) · Countries (15+) · Team Led (30+)
- [x] Numbers: Space Grotesk 36px/600, labels: Inter 13px secondary
- [ ] Count-up animation triggered on viewport entry

### 1.10 About Section

- [x] `lib/presentation/sections/about/about_section.dart` — 60/40 two-column
- [x] Left: 2–3 paragraphs + pull quote (Playfair Display italic 24px with 3px left accent bar)
- [x] `lib/presentation/sections/about/profile_widget_card.dart` — window chrome dots, monospace key-value pairs (location, timezone, available, languages), blinking cursor

### 1.11 Contact Section

- [x] `lib/presentation/sections/contact/contact_section.dart` — 2-column layout
- [x] `lib/presentation/sections/contact/terminal_card.dart` — `contact.dart` with Dart syntax key-value pairs
- [x] `lib/presentation/sections/contact/contact_form.dart` — floating label fields (Name, Email, Project Type dropdown, Message)
- [x] Submit button: full-width solid accent with loading spinner state
- [ ] Wire up form submission to EmailJS or Firebase Functions

### 1.12 Footer

- [x] `lib/presentation/sections/footer/footer_section.dart` — ~160px, 3-column: logo + nav links + socials + "Built with Flutter" text

### 1.13 Scroll Animation Framework

- [x] `lib/presentation/shared/scroll_reveal.dart` — visibility-triggered animation wrapper (fade + slide-up at 80% viewport threshold)
- [x] `lib/core/utils/scroll_utils.dart` — smooth scroll to section, section observer
- [x] `lib/core/utils/animation_helpers.dart` — stagger helper, spring curves

### 1.14 Deploy MVP

- [ ] `flutter build web --release --web-renderer canvaskit` builds cleanly ✓ (done, canvaskit flag renamed in newer Flutter)
- [ ] Set up Firebase Hosting project
- [ ] Deploy to Firebase Hosting
- [ ] Configure custom domain

---

## Phase 2 — Content Sections (1 week)

### 2.1 Data Models & Loading

- [x] `lib/data/models/project.dart` — freezed model (title, description, tech list, metrics, image paths, case study text)
- [x] `lib/data/models/expertise.dart` — freezed model (title, icon, description, tech tags)
- [x] `lib/data/models/experience.dart` — freezed model (timeline entries)
- [x] `lib/data/models/repo.dart` — freezed model (name, description, stars, language, url)
- [x] `lib/data/models/testimonial.dart` — freezed model (quote, author, role, avatar, rating)
- [x] `lib/data/models/article.dart` — freezed model (title, excerpt, url, date, read time)
- [x] Run `build_runner` to generate freezed/json code
- [x] `lib/data/datasources/local_data_source.dart` — load and parse JSON assets
- [x] `lib/data/repositories/portfolio_repository.dart` — repository exposing typed data

### 2.2 JSON Content Files

- [x] `assets/data/projects.json` — 3 featured projects (FinTech Banking, Health & Fitness, Fleet Management)
- [x] `assets/data/expertise.json` — 6 expertise cards (Flutter Architecture, State Management, Performance, Platform Integration, Design Systems, Team Leadership & CI/CD)
- [x] `assets/data/skills.json` — 3 categories: Mobile Core, Architecture & State, Infrastructure with proficiency levels (expert/proficient/familiar)
- [x] `assets/data/experience.json` — career timeline entries
- [x] `assets/data/repos.json` — 6 repos with star counts
- [x] `assets/data/testimonials.json` — quotes + reviewer info
- [x] `assets/data/articles.json` — blog post metadata

### 2.3 Expertise Section

- [x] `lib/presentation/sections/expertise/expertise_section.dart` — 2×3 card grid
- [x] `lib/presentation/sections/expertise/expertise_card.dart` — bg-surface, 1px border-subtle, icon + title + description + tech tags
- [x] Hover: accent border glow transition 200ms + 8px box shadow
- [x] Stagger card reveal 100ms each on scroll

### 2.4 Projects Section

- [x] `lib/presentation/sections/projects/projects_section.dart` — container for alternating rows
- [x] `lib/presentation/sections/projects/project_row.dart` — 50/50 split (mockup | text), alternating sides per row
- [x] Project 1 — FinTech Mobile Banking: `flutter` · `riverpod` · `dio` · `hive` · `firebase` / 4.9★ · 120k users · 6-month delivery
- [x] Project 2 — Health & Fitness Platform: `flutter` · `bloc` · `sqlite` · `health_kit` · `lottie` / 4.7★ · 80k downloads · zero crash rate
- [x] Project 3 — Enterprise Fleet Management: `flutter` · `mapbox` · `websockets` · `ble` · `fastlane` / 200+ clients · 99.9% uptime · 14 countries
- [x] Hover: border glow + shadow 200ms

### 2.5 Tech Stack Section

- [x] `lib/presentation/sections/tech_stack/tech_stack_section.dart` — 3-column categorized chip grid
- [x] Mobile Core: Dart, Flutter, Dart FFI, Platform Channels, Widget Testing, Integration Testing
- [x] Architecture & State: Clean Architecture, BLoC, Riverpod, GetX, Redux, MobX, TDD
- [x] Infrastructure: Firebase, Supabase, REST/GraphQL, Fastlane, Codemagic, GitHub Actions, Figma
- [x] Proficiency legend: ◆ Expert · ◇ Proficient · ○ Familiar

### 2.6 SEO & Analytics

- [x] Configure OG tags, Twitter cards — wired in `web/index.html`
- [x] Add `robots.txt` to `web/`
- [ ] Generate `sitemap.xml` at build time
- [x] Add JSON-LD Person schema to `web/index.html`
- [x] Set canonical URL
- [ ] Create Open Graph image (1200×630)
- [ ] Integrate `firebase_analytics` — page views, section engagement tracking

### 2.7 CI/CD

- [x] `.github/workflows/deploy.yml` — flutter analyze → flutter test → flutter build web → deploy to Firebase Hosting
- [ ] Lighthouse CI target: 90+ all categories

---

## Phase 3 — Polish & Extended Content (1 week)

### 3.1 Testimonials Section

- [x] `lib/presentation/sections/testimonials/testimonials_section.dart` — 2-column card grid
- [x] `lib/presentation/sections/testimonials/testimonial_card.dart` — quote, stars, author, role

### 3.2 Open Source Section

- [x] `lib/presentation/sections/open_source/open_source_section.dart` — 3-column grid
- [x] `lib/presentation/sections/open_source/repo_card.dart` — GitHub-style card (name, description, stars, language)
- [x] 6 repos: `flutter_architecture_templates` (1.2k★), `riverpod_pagination` (800★), `flutter_design_system_kit` (620★), `dart_either_extensions` (410★), `flutter_offline_sync` (380★), `codemagic_ci_templates` (290★)
- [x] `lib/presentation/sections/open_source/contribution_graph.dart` — heatmap in site color palette
- [ ] `lib/data/datasources/github_data_source.dart` — optional live GitHub API via dio

### 3.3 Blog Section (optional)

- [x] `lib/presentation/sections/blog/blog_section.dart` — 3-column article cards
- [x] `lib/presentation/sections/blog/article_card.dart` — title, excerpt, date, read time, link to Medium

### 3.4 Download CV

- [ ] "Download CV" button generates or serves a hosted PDF

### 3.5 Performance Optimization

- [ ] WebP images, max 200KB each
- [ ] Deferred loading for below-fold sections
- [ ] Font preloading for Playfair Display + Space Grotesk (critical path)
- [ ] Gzip/Brotli compression on Firebase Hosting
- [ ] Lazy-load project screenshots
- [ ] `--dart2js-optimization O4` in build
- [ ] Critical CSS inlined in `web/index.html`
- [ ] Target: <3s First Contentful Paint on 3G

### 3.6 Cross-Browser & Device Testing

- [ ] Chrome
- [ ] Safari
- [ ] Firefox
- [ ] Edge
- [ ] Mobile — iOS Safari
- [ ] Mobile — Android Chrome

---

## Phase 4 — Ongoing Maintenance

- [ ] Blog content pipeline — new articles
- [ ] A/B test CTA copy
- [ ] Add new projects as shipped
- [ ] Quarterly design refresh
- [ ] Monitor analytics for section engagement
- [ ] Service worker for offline caching (optional)

---

## Progress Summary

| Phase | Total Tasks | Completed |
|-------|-------------|-----------|
| Phase 1 — Foundation & MVP | 58 | 51 |
| Phase 2 — Content Sections | 30 | 27 |
| Phase 3 — Polish | 18 | 10 |
| Phase 4 — Ongoing | 6 | 0 |
| **Total** | **112** | **58** |

> Update the counts in this table as tasks are checked off.

---

## Placeholders to fill in (awaiting user info)

Search for `PLACEHOLDER` in the codebase to find all content that needs personalizing:

- `lib/presentation/sections/hero/hero_section.dart` — `_firstName`, `_lastName`, `_bio`, social URLs
- `lib/presentation/sections/about/profile_widget_card.dart` — name, location, timezone
- `lib/presentation/sections/contact/terminal_card.dart` — email
- `lib/presentation/sections/nav/nav_bar.dart` — initials (currently `AM`)
- `lib/presentation/sections/footer/footer_section.dart` — initials + role
- `assets/data/repos.json` — GitHub username in URLs
- `assets/data/articles.json` — Medium username in URLs
- `assets/data/experience.json` — real company names
