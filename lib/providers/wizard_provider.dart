import 'package:flutter_riverpod/flutter_riverpod.dart';

class WizardForm {
  final String product;
  final String description;
  final String targetAudience;
  final String platform;
  final String tone;
  final String language;
  final int numVariations;

  const WizardForm({
    this.product = '',
    this.description = '',
    this.targetAudience = '',
    this.platform = '',
    this.tone = '',
    this.language = 'en',
    this.numVariations = 5,
  });

  WizardForm copyWith({
    String? product,
    String? description,
    String? targetAudience,
    String? platform,
    String? tone,
    String? language,
    int? numVariations,
  }) {
    return WizardForm(
      product: product ?? this.product,
      description: description ?? this.description,
      targetAudience: targetAudience ?? this.targetAudience,
      platform: platform ?? this.platform,
      tone: tone ?? this.tone,
      language: language ?? this.language,
      numVariations: numVariations ?? this.numVariations,
    );
  }

  bool get isStep1Valid =>
      product.trim().isNotEmpty &&
      description.trim().isNotEmpty &&
      targetAudience.trim().isNotEmpty;

  bool get isStep2Valid => platform.isNotEmpty;

  bool get isStep3Valid => tone.isNotEmpty;

  bool get isComplete => isStep1Valid && isStep2Valid && isStep3Valid;
}

class WizardFormNotifier extends Notifier<WizardForm> {
  @override
  WizardForm build() => const WizardForm();

  void updateProduct(String value) => state = state.copyWith(product: value);
  void updateDescription(String value) => state = state.copyWith(description: value);
  void updateAudience(String value) => state = state.copyWith(targetAudience: value);
  void setPlatform(String value) => state = state.copyWith(platform: value);
  void setTone(String value) => state = state.copyWith(tone: value);
  void setLanguage(String value) => state = state.copyWith(language: value);
  void setVariations(int value) => state = state.copyWith(numVariations: value);
  void reset() => state = const WizardForm();
}

final wizardProvider = NotifierProvider<WizardFormNotifier, WizardForm>(
  WizardFormNotifier.new,
);
