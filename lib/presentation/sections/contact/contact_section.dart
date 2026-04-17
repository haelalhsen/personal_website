import 'package:flutter/material.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/section_label.dart';
import '../../../core/widgets/section_title.dart';
import 'contact_form.dart';
import 'terminal_card.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isDesktop = Breakpoints.isDesktop(size.width);

    return Container(
      width: double.infinity,
      color: AppColors.bgPrimary,
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: AppSpacing.sectionPadding(size.width),
            child: Column(
              children: [
                const SectionLabel(number: '10', name: 'contact'),
                const SizedBox(height: AppSpacing.base),
                const SectionTitle("Let's Build Something"),
                const SizedBox(height: AppSpacing.xxl),
                isDesktop
                    ? const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: TerminalCard()),
                          SizedBox(width: AppSpacing.xxxl),
                          Expanded(child: ContactForm()),
                        ],
                      )
                    : const Column(
                        children: [
                          TerminalCard(),
                          SizedBox(height: AppSpacing.xl),
                          ContactForm(),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
