import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

const _progressStrokeWidth = 2.0;
const _progressSize = 20.0;
const _successBorderAlpha = 0.4;

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String _projectType = AppStrings.contactDefaultProjectType;
  bool _loading = false;
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    // Wire up EmailJS or Firebase Functions submission here.
    await Future<void>.delayed(AppDurations.submitDelay);
    setState(() {
      _loading = false;
      _submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_submitted) {
      return _SuccessState();
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Field(
            label: AppStrings.contactFormNameLabel,
            controller: _nameController,
            validator: (v) => v == null || v.trim().isEmpty
                ? AppStrings.contactFormNameRequired
                : null,
          ),
          const SizedBox(height: AppSpacing.base),
          _Field(
            label: AppStrings.contactFormEmailLabel,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return AppStrings.contactFormEmailRequired;
              }
              if (!v.contains('@')) return AppStrings.contactFormEmailInvalid;
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.base),
          DropdownButtonFormField<String>(
            initialValue: _projectType,
            decoration: InputDecoration(
              labelText: AppStrings.contactFormProjectTypeLabel,
              labelStyle:
                  AppTypography.caption(color: AppColors.textSecondary),
            ),
            dropdownColor: AppColors.bgSurface,
            style: AppTypography.body(color: AppColors.textPrimary),
            items: AppStrings.contactProjectTypes
                .map(
                  (t) => DropdownMenuItem(value: t, child: Text(t)),
                )
                .toList(),
            onChanged: (v) => setState(() => _projectType = v ?? _projectType),
          ),
          const SizedBox(height: AppSpacing.base),
          _Field(
            label: AppStrings.contactFormMessageLabel,
            controller: _messageController,
            maxLines: 5,
            validator: (v) => v == null || v.trim().isEmpty
                ? AppStrings.contactFormMessageRequired
                : null,
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      width: _progressSize,
                      height: _progressSize,
                      child: CircularProgressIndicator(
                        strokeWidth: _progressStrokeWidth,
                        color: AppColors.bgPrimary,
                      ),
                    )
                  : const Text(AppStrings.contactFormSubmit),
            ),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: AppTypography.body(color: AppColors.textPrimary),
      decoration: InputDecoration(labelText: label),
    );
  }
}

class _SuccessState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xxxl),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(
          color: AppColors.success.withValues(alpha: _successBorderAlpha),
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: AppColors.success,
            size: AppSpacing.iconLg,
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            AppStrings.contactFormSuccessTitle,
            style: AppTypography.cardTitle(),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            AppStrings.contactFormSuccessBody,
            style: AppTypography.body(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
