import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/platform_meta.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/wizard_provider.dart';
import '../widgets/tone_chip.dart';

class StepTone extends ConsumerWidget {
  final VoidCallback onGenerate;
  final VoidCallback onBack;

  const StepTone({super.key, required this.onGenerate, required this.onBack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(wizardProvider);
    final notifier = ref.read(wizardProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Set the tone & options',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const Gap(6),
        const Text(
          'How should your ad sound to your audience?',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        const Gap(24),
        const Text(
          'Tone',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const Gap(12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: kTones.map((tone) {
            return ToneChip(
              tone: tone,
              isSelected: form.tone == tone.id,
              onTap: () => notifier.setTone(tone.id),
            );
          }).toList(),
        ),
        const Gap(28),
        const Text(
          'Variations',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const Gap(8),
        Row(
          children: [
            const Text('1', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.accent,
                  inactiveTrackColor: AppColors.surface,
                  thumbColor: AppColors.accent,
                  overlayColor: AppColors.accent.withAlpha(30),
                  valueIndicatorColor: AppColors.accent,
                  valueIndicatorTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Slider(
                  value: form.numVariations.toDouble(),
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: '${form.numVariations}',
                  onChanged: (v) => notifier.setVariations(v.round()),
                ),
              ),
            ),
            const Text('10', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
            const Gap(8),
            Text(
              '${form.numVariations}',
              style: const TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const Gap(20),
        const Text(
          'Language',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const Gap(8),
        SizedBox(
          width: 120,
          child: TextFormField(
            initialValue: form.language,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: const InputDecoration(
              hintText: 'e.g. en, fr, es',
            ),
            onChanged: notifier.setLanguage,
          ),
        ),
        const Gap(36),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onBack,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  side: BorderSide(color: Colors.white.withAlpha(40)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
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
                  gradient: form.isStep3Valid
                      ? AppColors.accentGradient
                      : const LinearGradient(
                          colors: [Color(0xFF3A3A50), Color(0xFF3A3A50)]),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ElevatedButton(
                  onPressed: form.isStep3Valid ? onGenerate : null,
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
                      Text('⚡ Generate',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
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
