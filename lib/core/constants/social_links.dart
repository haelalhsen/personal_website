import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Social link records — icon, display label, and URL.
// Update URLs here when profiles change; no other file needs touching.
typedef SocialLink = ({FaIconData icon, String label, String url});

abstract final class SocialLinks {
  static const String linkedInUrl =
      'https://linkedin.com/in/hael-alhsen-7a6648179';
  static const String githubUrl = 'https://github.com/haelalhsen';
  static const String mediumUrl = 'https://medium.com/@hael.alhsen';

  static const List<SocialLink> all = [
    (icon: FontAwesomeIcons.github, label: 'GitHub', url: githubUrl),
    (icon: FontAwesomeIcons.linkedin, label: 'LinkedIn', url: linkedInUrl),
    (icon: FontAwesomeIcons.medium, label: 'Medium', url: mediumUrl),
  ];
}
