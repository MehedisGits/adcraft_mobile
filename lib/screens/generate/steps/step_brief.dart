import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/wizard_provider.dart';

class StepBrief extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const StepBrief({super.key, required this.onNext});

  @override
  ConsumerState<StepBrief> createState() => _StepBriefState();
}

class _StepBriefState extends ConsumerState<StepBrief> {
  final _formKey = GlobalKey<FormState>();
  final _productController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _audienceController = TextEditingController();
  bool _shake = false;

  @override
  void initState() {
    super.initState();
    final form = ref.read(wizardProvider);
    _productController.text = form.product;
    _descriptionController.text = form.description;
    _audienceController.text = form.targetAudience;
  }

  @override
  void dispose() {
    _productController.dispose();
    _descriptionController.dispose();
    _audienceController.dispose();
    super.dispose();
  }

  void _tryNext() {
    if (_formKey.currentState!.validate()) {
      widget.onNext();
    } else {
      setState(() => _shake = true);
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) setState(() => _shake = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(wizardProvider.notifier);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tell us about your product',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(6),
          const Text(
            'We\'ll use this to craft the perfect ad copy.',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
          const Gap(28),
          TextFormField(
            controller: _productController,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: const InputDecoration(
              labelText: 'Product / Brand Name',
              hintText: 'e.g. TaskFlow Pro',
            ),
            onChanged: notifier.updateProduct,
            validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
          ),
          const Gap(16),
          TextFormField(
            controller: _descriptionController,
            style: const TextStyle(color: AppColors.textPrimary),
            maxLines: 4,
            maxLength: 500,
            decoration: const InputDecoration(
              labelText: 'Product Description',
              hintText: 'What does it do? What problem does it solve?',
              alignLabelWithHint: true,
            ),
            onChanged: notifier.updateDescription,
            validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
          ),
          const Gap(4),
          TextFormField(
            controller: _audienceController,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: const InputDecoration(
              labelText: 'Target Audience',
              hintText: 'e.g. Small business owners aged 25–45',
            ),
            onChanged: notifier.updateAudience,
            validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
          ),
          const Gap(32),
          SizedBox(
            width: double.infinity,
            child: _buildNextButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    final btn = DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppColors.accentGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ElevatedButton(
        onPressed: _tryNext,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Gap(8),
            Icon(Icons.arrow_forward_rounded, size: 18),
          ],
        ),
      ),
    );

    if (_shake) {
      return btn
          .animate()
          .shake(hz: 4, offset: const Offset(6, 0), duration: 500.ms);
    }
    return btn;
  }
}
