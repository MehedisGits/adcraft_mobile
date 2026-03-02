import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import '../../core/constants/platform_meta.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/generate_response.dart';
import 'widgets/copy_section_card.dart';
import 'widgets/hashtag_wrap.dart';
import 'widgets/headline_item.dart';
import 'widgets/quality_score_card.dart';

class ResultScreen extends StatelessWidget {
  final GenerateResponse response;

  const ResultScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final platform = platformById(response.platform);

    final List<Widget> cards = [
      // Headlines card
      Container(
        padding: const EdgeInsets.all(16),
        decoration: AppColors.glassSurface(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HEADLINES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
            const Gap(12),
            ...response.headlines.asMap().entries.map(
                  (e) => HeadlineItem(headline: e.value, index: e.key),
                ),
          ],
        ),
      ),
      CopySectionCard(
        title: 'BODY COPY',
        content: response.bodyCopy,
      ),
      CopySectionCard(
        title: 'CALL TO ACTION',
        content: response.cta,
        isCta: true,
      ),
      if (response.hashtags.isNotEmpty) HashtagWrap(hashtags: response.hashtags),
      QualityScoreCard(
        scores: response.qualityScores,
        compliance: response.platformCompliance,
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: AppColors.textPrimary,
                    ),
                    const Text(
                      'Your Ad Copy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Spacer(),
                    if (platform != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: platform.brandColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: platform.brandColor.withAlpha(80)),
                        ),
                        child: Text(
                          platform.abbreviation,
                          style: TextStyle(
                            color: platform.brandColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const Gap(8),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  itemCount: cards.length + 1, // +1 for footer button
                  separatorBuilder: (_, __) => const Gap(12),
                  itemBuilder: (context, index) {
                    if (index < cards.length) {
                      return cards[index]
                          .animate(delay: Duration(milliseconds: 50 * index))
                          .fadeIn(duration: 400.ms)
                          .slideY(
                              begin: 0.15,
                              end: 0,
                              duration: 400.ms,
                              curve: Curves.easeOut);
                    }
                    // Footer: Generate Again
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 52),
                          side: const BorderSide(color: AppColors.accent),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          foregroundColor: AppColors.accent,
                        ),
                        icon: const Icon(Icons.refresh_rounded, size: 18),
                        label: const Text(
                          'Generate Again',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ).animate(delay: Duration(milliseconds: 50 * cards.length))
                        .fadeIn(duration: 400.ms);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
