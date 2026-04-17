import 'package:flutter/material.dart';

abstract final class AppSpacing {
  // ── Base scale ─────────────────────────────────────────────────────────────
  static const double xxxs = 2;
  static const double xxs = 3;
  static const double xs = 4;
  static const double xsPlus = 5;
  static const double xsMed = 6;
  static const double sm = 8;
  static const double smPlus = 10;
  static const double md = 12;
  static const double base = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;
  static const double section = 120;

  // ── Section vertical padding per breakpoint ───────────────────────────────
  static const double sectionPaddingDesktop = 120;
  static const double sectionPaddingTablet = 80;
  static const double sectionPaddingMobile = 60;

  // ── Card padding ──────────────────────────────────────────────────────────
  static const double cardPaddingDesktop = 32;
  static const double cardPaddingMobile = 24;

  // Gutter between columns
  static const double gutter = 24;

  // Max content width
  static const double maxContentWidth = 1200;

  // Nav height
  static const double navHeight = 64;

  // ── Border radii ──────────────────────────────────────────────────────────
  static const double radiusPill = 100;
  static const double radiusCard = 16;
  static const double radiusButton = 8;
  static const double radiusTag = 6;
  static const double radiusImage = 20;
  static const double radiusCellTiny = 2;

  // ── Divider / border thickness ────────────────────────────────────────────
  static const double dividerHeight = 1;
  static const double borderThin = 1;
  static const double borderMedium = 2;
  static const double borderThick = 3;
  static const double borderFocus = 1.5;

  // ── Typography override sizes ─────────────────────────────────────────────
  static const double fontMicro = 9;
  static const double fontTiny = 10;
  static const double fontChipSmall = 11;
  static const double fontBadge = 12;
  static const double fontMono = 13;
  static const double fontIconInline = 14;

  // ── Icon sizes ────────────────────────────────────────────────────────────
  static const double iconXs = 14;
  static const double iconSm = 20;
  static const double iconMd = 22;
  static const double iconLg = 48;
  static const double iconXl = 64;

  // ── Component dimensions ──────────────────────────────────────────────────
  // Chrome dots (window traffic lights)
  static const double dotChrome = 12;
  static const double dotGap = 6;

  // Pulse / status indicators
  static const double pulseIndicator = 8;

  // Language indicator dot (open source cards)
  static const double languageDot = 10;

  // Avatar (profile card)
  static const double avatarRadius = 48;

  // Cursor (blinking terminal cursor)
  static const double cursorWidth = 2;
  static const double cursorHeight = 16;

  // Expertise card icon box
  static const double iconBox = 48;

  // Hero social icon button box
  static const double socialIconBox = 40;
  static const double socialIconSize = 18;

  // Hero phone mockup composition
  static const double heroPhoneStackWidth = 380;
  static const double heroPhoneStackHeight = 560;
  static const double heroPhoneBackWidth = 240;
  static const double heroPhoneFrontWidth = 260;
  static const double heroPhoneBackTop = 40;

  // Device mockup frame
  static const double deviceBezel = 12;
  static const double deviceCornerRadius = 40;
  static const double deviceNotchWidth = 100;
  static const double deviceNotchHeight = 28;
  static const double deviceShadowBlur = 24;
  static const double deviceShadowOffsetY = 16;

  // Card shadows
  static const double cardShadowBlur = 20;
  static const double cardShadowOffsetY = 4;
  static const double expertiseCardShadowBlur = 16;

  // Expertise card fixed heights
  static const double expertiseCardHeight = 405;
  static const double expertiseCardHeightMobile = 360;

  // Projects / experience skeleton card heights
  static const double projectSkeletonHeight = 300;
  static const double experienceSkeletonHeight = 160;

  // Contribution graph
  static const double graphCellSize = 12;
  static const double graphCellGap = 3;
  static const double graphMonthRowLeft = 20;

  // Tech chip padding
  static const double chipPaddingH = 12;
  static const double chipPaddingV = 5;
  static const double chipPaddingHSmall = 8;
  static const double chipPaddingVSmall = 3;

  // Tech stack skill row padding
  static const double skillRowPadding = 5;

  // Availability badge padding
  static const double badgePaddingH = 12;
  static const double badgePaddingV = 6;

  // Terminal header padding
  static const double terminalHeaderPadV = 10;

  // Button padding (theme)
  static const double buttonPaddingH = 24;
  static const double buttonPaddingV = 14;

  // Code indent
  static const double codeIndent = 16;

  // Active nav threshold offset
  static const double navActiveThreshold = 100;

  // Helper: section padding based on screen width
  static EdgeInsets sectionPadding(double screenWidth) {
    if (screenWidth < 640) {
      return const EdgeInsets.symmetric(
        horizontal: base,
        vertical: sectionPaddingMobile,
      );
    } else if (screenWidth < 1024) {
      return const EdgeInsets.symmetric(
        horizontal: xl,
        vertical: sectionPaddingTablet,
      );
    } else {
      return const EdgeInsets.symmetric(
        horizontal: xxxl,
        vertical: sectionPaddingDesktop,
      );
    }
  }
}
