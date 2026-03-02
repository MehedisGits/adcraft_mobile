import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/models/generate_response.dart';

class QualityScoreCard extends StatelessWidget {
  final QualityScores scores;
  final PlatformCompliance compliance;

  const QualityScoreCard({
    super.key,
    required this.scores,
    required this.compliance,
  });

  @override
  Widget build(BuildContext context) {
    final sentimentPct = (scores.sentimentScore * 100).round();
    final safetyPct = (scores.safetyScore * 100).round();

    return Column(
      children: [
        // Quality scores
        Container(
          padding: const EdgeInsets.all(16),
          decoration: AppColors.glassSurface(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'QUALITY SCORES',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              const Gap(14),
              Row(
                children: [
                  _ScoreBadge(
                    icon: '●',
                    label: scores.sentiment.toUpperCase(),
                    value: '$sentimentPct%',
                    color: AppColors.success,
                  ),
                  const Gap(12),
                  _ScoreBadge(
                    icon: '✓',
                    label: 'SAFE',
                    value: '$safetyPct%',
                    color: AppColors.success,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(12),
        // Compliance
        Container(
          padding: const EdgeInsets.all(16),
          decoration: AppColors.glassSurface(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PLATFORM COMPLIANCE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              const Gap(14),
              Row(
                children: [
                  _CompliancePill(
                    label: 'Headline',
                    ok: compliance.headlineWithinLimit,
                  ),
                  const Gap(8),
                  _CompliancePill(
                    label: 'Body',
                    ok: compliance.bodyWithinLimit,
                  ),
                  const Gap(8),
                  _CompliancePill(
                    label: 'Hashtags',
                    ok: compliance.hashtagCountValid,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScoreBadge extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final Color color;

  const _ScoreBadge({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: TextStyle(color: color, fontSize: 12)),
          const Gap(6),
          Text(
            '$label  $value',
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _CompliancePill extends StatelessWidget {
  final String label;
  final bool ok;

  const _CompliancePill({required this.label, required this.ok});

  @override
  Widget build(BuildContext context) {
    final color = ok ? AppColors.success : AppColors.error;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            ok ? Icons.check_circle_rounded : Icons.cancel_rounded,
            size: 14,
            color: color,
          ),
          const Gap(4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
