import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_response.freezed.dart';
part 'generate_response.g.dart';

@freezed
class QualityScores with _$QualityScores {
  const factory QualityScores({
    required String sentiment,
    @JsonKey(name: 'sentiment_score') required double sentimentScore,
    required String safety,
    @JsonKey(name: 'safety_score') required double safetyScore,
  }) = _QualityScores;

  factory QualityScores.fromJson(Map<String, dynamic> json) =>
      _$QualityScoresFromJson(json);
}

@freezed
class PlatformCompliance with _$PlatformCompliance {
  const factory PlatformCompliance({
    @JsonKey(name: 'headline_within_limit') required bool headlineWithinLimit,
    @JsonKey(name: 'body_within_limit') required bool bodyWithinLimit,
    @JsonKey(name: 'hashtag_count_valid') required bool hashtagCountValid,
    @Default({}) Map<String, dynamic> details,
  }) = _PlatformCompliance;

  factory PlatformCompliance.fromJson(Map<String, dynamic> json) =>
      _$PlatformComplianceFromJson(json);
}

@freezed
class GenerateResponse with _$GenerateResponse {
  const factory GenerateResponse({
    required List<String> headlines,
    @JsonKey(name: 'body_copy') required String bodyCopy,
    required String cta,
    @Default([]) List<String> hashtags,
    @JsonKey(name: 'quality_scores') required QualityScores qualityScores,
    @JsonKey(name: 'platform_compliance') required PlatformCompliance platformCompliance,
    required String platform,
    required String tone,
    @JsonKey(name: 'model_used') @Default('') String modelUsed,
  }) = _GenerateResponse;

  factory GenerateResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateResponseFromJson(json);
}
