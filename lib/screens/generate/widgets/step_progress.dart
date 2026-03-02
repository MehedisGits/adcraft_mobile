import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class StepProgress extends StatelessWidget {
  final int currentStep; // 0-indexed
  final int totalSteps;

  const StepProgress({
    super.key,
    required this.currentStep,
    this.totalSteps = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalSteps * 2 - 1, (i) {
            if (i.isOdd) {
              // connector line
              final stepIndex = i ~/ 2;
              final isCompleted = stepIndex < currentStep;
              return Expanded(
                child: Container(
                  height: 2,
                  color: isCompleted ? AppColors.accent : AppColors.textSecondary.withAlpha(60),
                ),
              );
            }
            final stepIndex = i ~/ 2;
            final isActive = stepIndex == currentStep;
            final isCompleted = stepIndex < currentStep;
            return Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? AppColors.accent
                    : isActive
                        ? AppColors.accent
                        : Colors.transparent,
                border: Border.all(
                  color: isCompleted || isActive
                      ? AppColors.accent
                      : AppColors.textSecondary.withAlpha(80),
                  width: 2,
                ),
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : Text(
                        '${stepIndex + 1}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isActive ? Colors.white : AppColors.textSecondary,
                        ),
                      ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          'Step ${currentStep + 1} of $totalSteps',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
