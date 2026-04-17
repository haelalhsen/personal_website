// All user-visible and structural string constants for the portfolio.
// No widget or presentation file may hard-code a string value that appears
// here — import and reference AppStrings instead.
abstract final class AppStrings {
  // ── Personal identity ──────────────────────────────────────────────────────
  static const String firstName = 'Hael';
  static const String lastName = 'Alhsen';
  static const String fullName = 'Hael Alhsen';
  static const String logoInitials = 'HA';
  static const String jobTitle = 'Senior Mobile Engineer';
  static const String jobTitleAccent = 'iOS & Android · Flutter';
  static const String tagline =
      'iOS & Android Leadership | Enterprise Scale Apps | Agile Delivery';
  static const String location = 'Dubai, UAE';
  static const String timezone = 'UTC+4';
  static const String email = 'hael.alhsen@gmail.com';
  static const String yearsOfExperience = '9+';
  static const String usersServed = '10M+';

  // ── Hero section ──────────────────────────────────────────────────────────
  static const String heroBio =
      'Senior Mobile Engineer with 9+ years architecting iOS, Android, and Flutter '
      'applications at scale — serving 10M+ users across enterprise, fintech, and '
      'IoT-connected platforms, from clean architecture to production CI/CD.';

  static const List<String> heroTechChips = [
    'flutter',
    'swift',
    'kotlin',
    'dart',
    'bloc',
    'clean arch',
    'iot',
    'ci/cd',
  ];

  static const String heroCtaProjects = 'View Projects';
  static const String heroCtaContact = 'Get in Touch';

  // ── Stats strip ───────────────────────────────────────────────────────────
  static const String statsYearsValue = '9+';
  static const String statsYearsLabel = 'Years Experience';
  static const String statsUsersValue = '10M+';
  static const String statsUsersLabel = 'Users Served';
  static const String statsAppsValue = '15+';
  static const String statsAppsLabel = 'Apps Delivered';
  static const String statsCountriesValue = '3';
  static const String statsCountriesLabel = 'Countries';
  static const String statsIndustriesValue = '7';
  static const String statsIndustriesLabel = 'Industries';

  // ── Navigation ────────────────────────────────────────────────────────────
  static const String navAbout = 'About';
  static const String navExperience = 'Experience';
  static const String navExpertise = 'Expertise';
  static const String navProjects = 'Projects';
  static const String navOpenSource = 'Open Source';
  static const String navContact = 'Contact';
  static const String navDownloadCv = 'Download CV';

  static const List<String> navItems = [
    navAbout,
    navExperience,
    navExpertise,
    navProjects,
    navOpenSource,
    navContact,
  ];

  // Route segments matching go_router paths — parallel to navItems by index.
  static const List<String> navSections = [
    'about',
    'experience',
    'expertise',
    'projects',
    'open-source',
    'contact',
  ];

  // ── About section ─────────────────────────────────────────────────────────
  static const String aboutTitle = 'About Me';

  static const String _about1 =
      'Senior Mobile Engineer with 9+ years of hands-on experience architecting '
      'and delivering native iOS, Android, and Flutter applications at scale, '
      'serving 10M+ users across enterprise, fintech, and IoT-connected platforms.';

  static const String _about2 =
      'Known for translating complex technical requirements into clean, maintainable '
      'systems through deep command of MVVM, MVI, and Repository patterns — paired '
      'with a strong foundation in Clean Architecture. Brings rare end-to-end '
      'ownership: from custom native SDKs and Method Channel bridges to MQTT-driven '
      'IoT integrations and PCI-DSS compliant release pipelines.';

  static const String _about3 =
      'A natural team builder — having established mobile departments from the ground up, '
      'led agile scrum teams, and mentored engineers at all levels. Equally comfortable '
      'in the weeds of a technical POC and in the room driving R&D strategy.';

  static const List<String> aboutParagraphs = [_about1, _about2, _about3];

  static const String aboutPullQuote =
      '"The best architecture is the one your team can understand, extend, '
      'and test without asking you."';

  // ── Profile widget card ───────────────────────────────────────────────────
  static const String profileName = '"Hael Alhsen"';
  static const String profileRole = '"Senior Mobile Engineer"';
  static const String profileLocation = '"Dubai, UAE"';
  static const String profileTimezone = '"UTC+4"';
  static const String profileAvailable = 'true';
  static const String profileLanguages = '["Swift", "Kotlin", "Dart"]';
  static const String profileCardFilename = 'developer.dart';

  // ── Terminal / Contact card ────────────────────────────────────────────────
  static const String contactEmail = '"hael.alhsen@gmail.com"';
  static const String contactResponse = '"Within 24 hours"';
  static const String contactPreferredProjects =
      '["Mobile Architecture", "IoT Integration", "Team Leadership"]';
  static const String contactTimezone = '"UTC+4 (flexible)"';
  static const String contactCardFilename = 'contact.dart';

  // ── Footer ────────────────────────────────────────────────────────────────
  static const String footerBuiltWith = 'Built with Flutter ♥';
  static const String footerJobTitle = 'Senior Mobile Engineer';

  // ── Availability badge ────────────────────────────────────────────────────
  static const String availableForProjects = 'Available for Projects';

  // ── Contribution graph ────────────────────────────────────────────────────
  static const String graphLegendLess = 'Less';
  static const String graphLegendMore = 'More';
  static const List<String> graphMonthLabels = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  static const List<String> graphDayLabels = ['', 'Mon', '', 'Wed', '', 'Fri', ''];

  // ── Code decorators (re-used across terminal cards) ───────────────────────
  static const String codeDeveloperOpen = 'const developer = Developer(';
  static const String codeContactOpen = 'const contact = Contact(';
  static const String codeClose = ');';
  static const String codeComma = ',';
  static const String codePrompt = '▶';

  // ── Open Source section ────────────────────────────────────────────────────
  static const String openSourceSubtitle =
      'Projects I maintain and contribute to.';
  static const String openSourceGraphTitle = 'Contribution Activity';

  // ── Contact form ──────────────────────────────────────────────────────────
  static const String contactFormNameLabel = 'Name';
  static const String contactFormEmailLabel = 'Email';
  static const String contactFormProjectTypeLabel = 'Project Type';
  static const String contactFormMessageLabel = 'Message';
  static const String contactFormNameRequired = 'Name is required';
  static const String contactFormEmailRequired = 'Email is required';
  static const String contactFormEmailInvalid = 'Enter a valid email';
  static const String contactFormMessageRequired = 'Message is required';
  static const String contactFormSubmit = 'Send Message';
  static const String contactFormSuccessTitle = 'Message sent!';
  static const String contactFormSuccessBody =
      "I'll get back to you within 24 hours.";
  static const String contactDefaultProjectType = 'Mobile Architecture';
  static const List<String> contactProjectTypes = [
    'Mobile Architecture',
    'Flutter Development',
    'Team Coaching',
    'Code Review',
    'Other',
  ];

  // ── Article card ──────────────────────────────────────────────────────────
  static const String articleReadOnMedium = 'Read on Medium';
  static const String articleReadTimeSuffix = 'min read';
  static const List<String> monthAbbreviations = [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  // ── Errors ────────────────────────────────────────────────────────────────
  static const String errorLaunchUrl = 'Could not launch URL';
  static const String errorLoadExpertise = 'Failed to load expertise data.';
  static const String errorLoadProjects = 'Failed to load projects.';
  static const String errorLoadExperience = 'Failed to load experience.';
  static const String errorLoadRepos = 'Failed to load repositories.';
  static const String errorLoadTestimonials = 'Failed to load testimonials.';
  static const String errorLoadArticles = 'Failed to load articles.';
  static const String errorLoadSkills = 'Failed to load skills.';
}
