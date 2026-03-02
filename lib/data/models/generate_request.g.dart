// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateRequestImpl _$$GenerateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateRequestImpl(
      product: json['product'] as String,
      description: json['description'] as String,
      targetAudience: json['target_audience'] as String,
      platform: json['platform'] as String,
      tone: json['tone'] as String,
      language: json['language'] as String? ?? 'en',
      numVariations: json['num_variations'] as int? ?? 5,
    );

Map<String, dynamic> _$$GenerateRequestImplToJson(
        _$GenerateRequestImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'description': instance.description,
      'target_audience': instance.targetAudience,
      'platform': instance.platform,
      'tone': instance.tone,
      'language': instance.language,
      'num_variations': instance.numVariations,
    };
