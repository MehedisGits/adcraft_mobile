import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import '../../core/constants/platform_meta.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/generate_provider.dart';
import '../../providers/wizard_provider.dart';
import '../result/result_screen.dart';

class GeneratingScreen extends ConsumerStatefulWidget {
  const GeneratingScreen({super.key});

  @override
  ConsumerState<GeneratingScreen> createState() => _GeneratingScreenState();
}

class _GeneratingScreenState extends ConsumerState<GeneratingScreen> {
  bool _navigated = false;

  @override
  Widget build(BuildContext context) {
    final generateState = ref.watch(generateProvider);
    final form = ref.watch(wizardProvider);
    final platformMeta = platformById(form.platform);

    ref.listen(generateProvider, (previous, next) {
      if (_navigated) return;
      next.when(
        data: (response) {
          if (response != null) {
            _navigated = true;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => ResultScreen(response: response),
              ),
            );
          }
        },
        error: (error, _) {
          _showErrorDialog(context, error);
        },
        loading: () {},
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Concentric pulsing rings
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _PulsingRing(size: 180, delay: 0)
                            .animate(onPlay: (c) => c.repeat())
                            .scale(
                                begin: const Offset(0.8, 0.8),
                                end: const Offset(1.1, 1.1),
                                duration: 1500.ms,
                                curve: Curves.easeInOut)
                            .then()
                            .scale(
                                begin: const Offset(1.1, 1.1),
                                end: const Offset(0.8, 0.8),
                                duration: 1500.ms,
                                curve: Curves.easeInOut),
                        _PulsingRing(size: 130, delay: 200)
                            .animate(
                              delay: 200.ms,
                              onPlay: (c) => c.repeat(),
                            )
                            .scale(
                                begin: const Offset(0.85, 0.85),
                                end: const Offset(1.05, 1.05),
                                duration: 1500.ms,
                                curve: Curves.easeInOut)
                            .then()
                            .scale(
                                begin: const Offset(1.05, 1.05),
                                end: const Offset(0.85, 0.85),
                                duration: 1500.ms,
                                curve: Curves.easeInOut),
                        _PulsingRing(size: 80, delay: 400)
                            .animate(
                              delay: 400.ms,
                              onPlay: (c) => c.repeat(),
                            )
                            .scale(
                                begin: const Offset(0.9, 0.9),
                                end: const Offset(1.0, 1.0),
                                duration: 1500.ms,
                                curve: Curves.easeInOut)
                            .then()
                            .scale(
                                begin: const Offset(1.0, 1.0),
                                end: const Offset(0.9, 0.9),
                                duration: 1500.ms,
                                curve: Curves.easeInOut),
                        const Icon(
                          Icons.auto_awesome_rounded,
                          size: 32,
                          color: AppColors.accent,
                        ),
                      ],
                    ),
                  ),
                  const Gap(40),
                  Text(
                    'Crafting your perfect\n${platformMeta?.label ?? form.platform} ad...',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      height: 1.4,
                    ),
                  ),
                  const Gap(12),
                  const Text(
                    'GPT → Sentiment Analysis → Safety Check',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  if (generateState.isLoading) ...[
                    const Gap(32),
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, Object error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'Generation Failed',
            style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700),
          ),
          content: Text(
            error.toString().contains('ApiException')
                ? error.toString()
                : 'Could not connect to the AdCraft API. Make sure the backend is running.',
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).pop(); // back to wizard
              },
              child: const Text(
                'Try Again',
                style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _PulsingRing extends StatelessWidget {
  final double size;
  final int delay;

  const _PulsingRing({required this.size, required this.delay});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.accent.withAlpha(60),
          width: 1.5,
        ),
      ),
    );
  }
}
