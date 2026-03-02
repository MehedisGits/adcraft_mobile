import 'package:flutter/material.dart';
import '../../../core/constants/platform_meta.dart';
import '../../../core/theme/app_colors.dart';

class ToneChip extends StatelessWidget {
  final ToneMeta tone;
  final bool isSelected;
  final VoidCallback onTap;

  const ToneChip({
    super.key,
    required this.tone,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? tone.accentColor.withAlpha(40) : AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? tone.accentColor : Colors.white.withAlpha(20),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(tone.emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Text(
              tone.label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? tone.accentColor : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
