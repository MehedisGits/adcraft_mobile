import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/platform_meta.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/wizard_provider.dart';
import '../widgets/platform_card.dart';

class StepPlatform extends ConsumerWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const StepPlatform({super.key, required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(wizardProvider);
    final notifier = ref.read(wizardProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose your platform',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const Gap(6),
        const Text(
          'Each platform gets copy optimized for its format.',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        const Gap(24),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
          children: kPlatforms.map((platform) {
            return PlatformCard(
              platform: platform,
              isSelected: form.platform == platform.id,
              onTap: () => notifier.setPlatform(platform.id),
            );
          }).toList(),
        ),
        const Gap(32),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onBack,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  side: BorderSide(color: Colors.white.withAlpha(40)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  foregroundColor: AppColors.textSecondary,
                ),
                child: const Text('Back', style: TextStyle(fontSize: 16)),
              ),
            ),
            const Gap(12),
            Expanded(
              flex: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: form.isStep2Valid
                      ? AppColors.accentGradient
                      : const LinearGradient(
                          colors: [Color(0xFF3A3A50), Color(0xFF3A3A50)]),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ElevatedButton(
                  onPressed: form.isStep2Valid ? onNext : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      Gap(8),
                      Icon(Icons.arrow_forward_rounded, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
