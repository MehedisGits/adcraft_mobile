import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import '../../../core/theme/app_colors.dart';

class HashtagWrap extends StatefulWidget {
  final List<String> hashtags;

  const HashtagWrap({super.key, required this.hashtags});

  @override
  State<HashtagWrap> createState() => _HashtagWrapState();
}

class _HashtagWrapState extends State<HashtagWrap> {
  bool _allCopied = false;

  Future<void> _copyAll() async {
    final text = widget.hashtags.join(' ');
    await Clipboard.setData(ClipboardData(text: text));
    setState(() => _allCopied = true);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All hashtags copied!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _allCopied = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppColors.glassSurface(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'HASHTAGS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _copyAll,
                child: Row(
                  children: [
                    Icon(
                      _allCopied ? Icons.check_rounded : Icons.copy_all_rounded,
                      size: 16,
                      color: _allCopied ? AppColors.success : AppColors.accent,
                    ),
                    const Gap(4),
                    Text(
                      'Copy All',
                      style: TextStyle(
                        fontSize: 12,
                        color: _allCopied ? AppColors.success : AppColors.accent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.hashtags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.accent.withAlpha(20),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.accent.withAlpha(60)),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.accent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
