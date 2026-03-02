// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QualityScoresImpl _$$QualityScoresImplFromJson(Map<String, dynamic> json) =>
    _$QualityScoresImpl(
      sentiment: json['sentiment'] as String,
      sentimentScore: (json['sentiment_score'] as num).toDouble(),
      safety: json['safety'] as String,
      safetyScore: (json['safety_score'] as num).toDouble(),
    );

Map<String, dynamic> _$$QualityScoresImplToJson(_$QualityScoresImpl instance) =>
    <String, dynamic>{
      'sentiment': instance.sentiment,
      'sentiment_score': instance.sentimentScore,
      'safety': instance.safety,
      'safety_score': instance.safetyScore,
    };

_$PlatformComplianceImpl _$$PlatformComplianceImplFromJson(
        Map<String, dynamic> json) =>
    _$PlatformComplianceImpl(
      headlineWithinLimit: json['headline_within_limit'] as bool,
      bodyWithinLimit: json['body_within_limit'] as bool,
      hashtagCountValid: json['hashtag_count_valid'] as bool,
      details: json['details'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$PlatformComplianceImplToJson(
        _$PlatformComplianceImpl instance) =>
    <String, dynamic>{
      'headline_within_limit': instance.headlineWithinLimit,
      'body_within_limit': instance.bodyWithinLimit,
      'hashtag_count_valid': instance.hashtagCountValid,
      'details': instance.details,
    };

_$GenerateResponseImpl _$$GenerateResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateResponseImpl(
      headlines: (json['headlines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bodyCopy: json['body_copy'] as String,
      cta: json['cta'] as String,
      hashtags: (json['hashtags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      qualityScores:
          QualityScores.fromJson(json['quality_scores'] as Map<String, dynamic>),
      platformCompliance: PlatformCompliance.fromJson(
          json['platform_compliance'] as Map<String, dynamic>),
      platform: json['platform'] as String,
      tone: json['tone'] as String,
      modelUsed: json['model_used'] as String? ?? '',
    );

Map<String, dynamic> _$$GenerateResponseImplToJson(
        _$GenerateResponseImpl instance) =>
    <String, dynamic>{
      'headlines': instance.headlines,
      'body_copy': instance.bodyCopy,
      'cta': instance.cta,
      'hashtags': instance.hashtags,
      'quality_scores': instance.qualityScores,
      'platform_compliance': instance.platformCompliance,
      'platform': instance.platform,
      'tone': instance.tone,
      'model_used': instance.modelUsed,
    };
