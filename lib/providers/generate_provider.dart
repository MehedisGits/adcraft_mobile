import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/generate_request.dart';
import '../data/models/generate_response.dart';
import '../data/services/adcraft_service.dart';
import 'wizard_provider.dart';

final adcraftServiceProvider = Provider<AdcraftService>((ref) => AdcraftService());

class GenerateNotifier extends AsyncNotifier<GenerateResponse?> {
  @override
  Future<GenerateResponse?> build() async => null;

  Future<void> generate(WizardForm form) async {
    state = const AsyncLoading();
    final service = ref.read(adcraftServiceProvider);
    final request = GenerateRequest(
      product: form.product,
      description: form.description,
      targetAudience: form.targetAudience,
      platform: form.platform,
      tone: form.tone,
      language: form.language,
      numVariations: form.numVariations,
    );
    state = await AsyncValue.guard(() => service.generate(request));
  }

  void reset() => state = const AsyncData(null);
}

final generateProvider = AsyncNotifierProvider<GenerateNotifier, GenerateResponse?>(
  GenerateNotifier.new,
);
