// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QualityScores _$QualityScoresFromJson(Map<String, dynamic> json) {
  return _QualityScores.fromJson(json);
}

/// @nodoc
mixin _$QualityScores {
  String get sentiment => throw _privateConstructorUsedError;
  @JsonKey(name: 'sentiment_score')
  double get sentimentScore => throw _privateConstructorUsedError;
  String get safety => throw _privateConstructorUsedError;
  @JsonKey(name: 'safety_score')
  double get safetyScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QualityScoresCopyWith<QualityScores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualityScoresCopyWith<$Res> {
  factory $QualityScoresCopyWith(
          QualityScores value, $Res Function(QualityScores) then) =
      _$QualityScoresCopyWithImpl<$Res, QualityScores>;
  @useResult
  $Res call(
      {String sentiment,
      @JsonKey(name: 'sentiment_score') double sentimentScore,
      String safety,
      @JsonKey(name: 'safety_score') double safetyScore});
}

/// @nodoc
class _$QualityScoresCopyWithImpl<$Res, $Val extends QualityScores>
    implements $QualityScoresCopyWith<$Res> {
  _$QualityScoresCopyWithImpl(this._value, this._then);
  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentiment = null,
    Object? sentimentScore = null,
    Object? safety = null,
    Object? safetyScore = null,
  }) {
    return _then(_value.copyWith(
      sentiment: null == sentiment ? _value.sentiment : sentiment as String,
      sentimentScore: null == sentimentScore ? _value.sentimentScore : sentimentScore as double,
      safety: null == safety ? _value.safety : safety as String,
      safetyScore: null == safetyScore ? _value.safetyScore : safetyScore as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QualityScoresImplCopyWith<$Res>
    implements $QualityScoresCopyWith<$Res> {
  factory _$$QualityScoresImplCopyWith(
          _$QualityScoresImpl value, $Res Function(_$QualityScoresImpl) then) =
      __$$QualityScoresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sentiment,
      @JsonKey(name: 'sentiment_score') double sentimentScore,
      String safety,
      @JsonKey(name: 'safety_score') double safetyScore});
}

/// @nodoc
class __$$QualityScoresImplCopyWithImpl<$Res>
    extends _$QualityScoresCopyWithImpl<$Res, _$QualityScoresImpl>
    implements _$$QualityScoresImplCopyWith<$Res> {
  __$$QualityScoresImplCopyWithImpl(
      _$QualityScoresImpl _value, $Res Function(_$QualityScoresImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentiment = null,
    Object? sentimentScore = null,
    Object? safety = null,
    Object? safetyScore = null,
  }) {
    return _then(_$QualityScoresImpl(
      sentiment: null == sentiment ? _value.sentiment : sentiment as String,
      sentimentScore: null == sentimentScore ? _value.sentimentScore : sentimentScore as double,
      safety: null == safety ? _value.safety : safety as String,
      safetyScore: null == safetyScore ? _value.safetyScore : safetyScore as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QualityScoresImpl implements _QualityScores {
  const _$QualityScoresImpl(
      {required this.sentiment,
      @JsonKey(name: 'sentiment_score') required this.sentimentScore,
      required this.safety,
      @JsonKey(name: 'safety_score') required this.safetyScore});

  factory _$QualityScoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$QualityScoresImplFromJson(json);

  @override
  final String sentiment;
  @override
  @JsonKey(name: 'sentiment_score')
  final double sentimentScore;
  @override
  final String safety;
  @override
  @JsonKey(name: 'safety_score')
  final double safetyScore;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualityScoresImpl &&
            (identical(other.sentiment, sentiment) || other.sentiment == sentiment) &&
            (identical(other.sentimentScore, sentimentScore) || other.sentimentScore == sentimentScore) &&
            (identical(other.safety, safety) || other.safety == safety) &&
            (identical(other.safetyScore, safetyScore) || other.safetyScore == safetyScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sentiment, sentimentScore, safety, safetyScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QualityScoresImplCopyWith<_$QualityScoresImpl> get copyWith =>
      __$$QualityScoresImplCopyWithImpl<_$QualityScoresImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() => _$$QualityScoresImplToJson(this);
}

abstract class _QualityScores implements QualityScores {
  const factory _QualityScores(
      {required final String sentiment,
      @JsonKey(name: 'sentiment_score') required final double sentimentScore,
      required final String safety,
      @JsonKey(name: 'safety_score') required final double safetyScore}) = _$QualityScoresImpl;

  factory _QualityScores.fromJson(Map<String, dynamic> json) =
      _$QualityScoresImpl.fromJson;

  @override
  String get sentiment;
  @override
  @JsonKey(name: 'sentiment_score')
  double get sentimentScore;
  @override
  String get safety;
  @override
  @JsonKey(name: 'safety_score')
  double get safetyScore;
  @override
  @JsonKey(ignore: true)
  _$$QualityScoresImplCopyWith<_$QualityScoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// ---- PlatformCompliance ----

PlatformCompliance _$PlatformComplianceFromJson(Map<String, dynamic> json) {
  return _PlatformCompliance.fromJson(json);
}

/// @nodoc
mixin _$PlatformCompliance {
  @JsonKey(name: 'headline_within_limit')
  bool get headlineWithinLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_within_limit')
  bool get bodyWithinLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'hashtag_count_valid')
  bool get hashtagCountValid => throw _privateConstructorUsedError;
  Map<String, dynamic> get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlatformComplianceCopyWith<PlatformCompliance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformComplianceCopyWith<$Res> {
  factory $PlatformComplianceCopyWith(
          PlatformCompliance value, $Res Function(PlatformCompliance) then) =
      _$PlatformComplianceCopyWithImpl<$Res, PlatformCompliance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'headline_within_limit') bool headlineWithinLimit,
      @JsonKey(name: 'body_within_limit') bool bodyWithinLimit,
      @JsonKey(name: 'hashtag_count_valid') bool hashtagCountValid,
      Map<String, dynamic> details});
}

/// @nodoc
class _$PlatformComplianceCopyWithImpl<$Res, $Val extends PlatformCompliance>
    implements $PlatformComplianceCopyWith<$Res> {
  _$PlatformComplianceCopyWithImpl(this._value, this._then);
  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headlineWithinLimit = null,
    Object? bodyWithinLimit = null,
    Object? hashtagCountValid = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      headlineWithinLimit: null == headlineWithinLimit ? _value.headlineWithinLimit : headlineWithinLimit as bool,
      bodyWithinLimit: null == bodyWithinLimit ? _value.bodyWithinLimit : bodyWithinLimit as bool,
      hashtagCountValid: null == hashtagCountValid ? _value.hashtagCountValid : hashtagCountValid as bool,
      details: null == details ? _value.details : details as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformComplianceImplCopyWith<$Res>
    implements $PlatformComplianceCopyWith<$Res> {
  factory _$$PlatformComplianceImplCopyWith(_$PlatformComplianceImpl value,
          $Res Function(_$PlatformComplianceImpl) then) =
      __$$PlatformComplianceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'headline_within_limit') bool headlineWithinLimit,
      @JsonKey(name: 'body_within_limit') bool bodyWithinLimit,
      @JsonKey(name: 'hashtag_count_valid') bool hashtagCountValid,
      Map<String, dynamic> details});
}

/// @nodoc
class __$$PlatformComplianceImplCopyWithImpl<$Res>
    extends _$PlatformComplianceCopyWithImpl<$Res, _$PlatformComplianceImpl>
    implements _$$PlatformComplianceImplCopyWith<$Res> {
  __$$PlatformComplianceImplCopyWithImpl(_$PlatformComplianceImpl _value,
      $Res Function(_$PlatformComplianceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headlineWithinLimit = null,
    Object? bodyWithinLimit = null,
    Object? hashtagCountValid = null,
    Object? details = null,
  }) {
    return _then(_$PlatformComplianceImpl(
      headlineWithinLimit: null == headlineWithinLimit ? _value.headlineWithinLimit : headlineWithinLimit as bool,
      bodyWithinLimit: null == bodyWithinLimit ? _value.bodyWithinLimit : bodyWithinLimit as bool,
      hashtagCountValid: null == hashtagCountValid ? _value.hashtagCountValid : hashtagCountValid as bool,
      details: null == details ? _value.details : details as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformComplianceImpl implements _PlatformCompliance {
  const _$PlatformComplianceImpl(
      {@JsonKey(name: 'headline_within_limit') required this.headlineWithinLimit,
      @JsonKey(name: 'body_within_limit') required this.bodyWithinLimit,
      @JsonKey(name: 'hashtag_count_valid') required this.hashtagCountValid,
      this.details = const {}});

  factory _$PlatformComplianceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformComplianceImplFromJson(json);

  @override
  @JsonKey(name: 'headline_within_limit')
  final bool headlineWithinLimit;
  @override
  @JsonKey(name: 'body_within_limit')
  final bool bodyWithinLimit;
  @override
  @JsonKey(name: 'hashtag_count_valid')
  final bool hashtagCountValid;
  @override
  @JsonKey()
  final Map<String, dynamic> details;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformComplianceImpl &&
            (identical(other.headlineWithinLimit, headlineWithinLimit) || other.headlineWithinLimit == headlineWithinLimit) &&
            (identical(other.bodyWithinLimit, bodyWithinLimit) || other.bodyWithinLimit == bodyWithinLimit) &&
            (identical(other.hashtagCountValid, hashtagCountValid) || other.hashtagCountValid == hashtagCountValid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, headlineWithinLimit, bodyWithinLimit, hashtagCountValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformComplianceImplCopyWith<_$PlatformComplianceImpl> get copyWith =>
      __$$PlatformComplianceImplCopyWithImpl<_$PlatformComplianceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() => _$$PlatformComplianceImplToJson(this);
}

abstract class _PlatformCompliance implements PlatformCompliance {
  const factory _PlatformCompliance(
      {@JsonKey(name: 'headline_within_limit') required final bool headlineWithinLimit,
      @JsonKey(name: 'body_within_limit') required final bool bodyWithinLimit,
      @JsonKey(name: 'hashtag_count_valid') required final bool hashtagCountValid,
      final Map<String, dynamic> details}) = _$PlatformComplianceImpl;

  factory _PlatformCompliance.fromJson(Map<String, dynamic> json) =
      _$PlatformComplianceImpl.fromJson;

  @override
  @JsonKey(name: 'headline_within_limit')
  bool get headlineWithinLimit;
  @override
  @JsonKey(name: 'body_within_limit')
  bool get bodyWithinLimit;
  @override
  @JsonKey(name: 'hashtag_count_valid')
  bool get hashtagCountValid;
  @override
  Map<String, dynamic> get details;
  @override
  @JsonKey(ignore: true)
  _$$PlatformComplianceImplCopyWith<_$PlatformComplianceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// ---- GenerateResponse ----

GenerateResponse _$GenerateResponseFromJson(Map<String, dynamic> json) {
  return _GenerateResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateResponse {
  List<String> get headlines => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_copy')
  String get bodyCopy => throw _privateConstructorUsedError;
  String get cta => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_scores')
  QualityScores get qualityScores => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_compliance')
  PlatformCompliance get platformCompliance => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  @JsonKey(name: 'model_used')
  String get modelUsed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateResponseCopyWith<GenerateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateResponseCopyWith<$Res> {
  factory $GenerateResponseCopyWith(
          GenerateResponse value, $Res Function(GenerateResponse) then) =
      _$GenerateResponseCopyWithImpl<$Res, GenerateResponse>;
  @useResult
  $Res call(
      {List<String> headlines,
      @JsonKey(name: 'body_copy') String bodyCopy,
      String cta,
      List<String> hashtags,
      @JsonKey(name: 'quality_scores') QualityScores qualityScores,
      @JsonKey(name: 'platform_compliance') PlatformCompliance platformCompliance,
      String platform,
      String tone,
      @JsonKey(name: 'model_used') String modelUsed});
}

/// @nodoc
class _$GenerateResponseCopyWithImpl<$Res, $Val extends GenerateResponse>
    implements $GenerateResponseCopyWith<$Res> {
  _$GenerateResponseCopyWithImpl(this._value, this._then);
  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headlines = null,
    Object? bodyCopy = null,
    Object? cta = null,
    Object? hashtags = null,
    Object? qualityScores = null,
    Object? platformCompliance = null,
    Object? platform = null,
    Object? tone = null,
    Object? modelUsed = null,
  }) {
    return _then(_value.copyWith(
      headlines: null == headlines ? _value.headlines : headlines as List<String>,
      bodyCopy: null == bodyCopy ? _value.bodyCopy : bodyCopy as String,
      cta: null == cta ? _value.cta : cta as String,
      hashtags: null == hashtags ? _value.hashtags : hashtags as List<String>,
      qualityScores: null == qualityScores ? _value.qualityScores : qualityScores as QualityScores,
      platformCompliance: null == platformCompliance ? _value.platformCompliance : platformCompliance as PlatformCompliance,
      platform: null == platform ? _value.platform : platform as String,
      tone: null == tone ? _value.tone : tone as String,
      modelUsed: null == modelUsed ? _value.modelUsed : modelUsed as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateResponseImplCopyWith<$Res>
    implements $GenerateResponseCopyWith<$Res> {
  factory _$$GenerateResponseImplCopyWith(_$GenerateResponseImpl value,
          $Res Function(_$GenerateResponseImpl) then) =
      __$$GenerateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> headlines,
      @JsonKey(name: 'body_copy') String bodyCopy,
      String cta,
      List<String> hashtags,
      @JsonKey(name: 'quality_scores') QualityScores qualityScores,
      @JsonKey(name: 'platform_compliance') PlatformCompliance platformCompliance,
      String platform,
      String tone,
      @JsonKey(name: 'model_used') String modelUsed});
}

/// @nodoc
class __$$GenerateResponseImplCopyWithImpl<$Res>
    extends _$GenerateResponseCopyWithImpl<$Res, _$GenerateResponseImpl>
    implements _$$GenerateResponseImplCopyWith<$Res> {
  __$$GenerateResponseImplCopyWithImpl(_$GenerateResponseImpl _value,
      $Res Function(_$GenerateResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headlines = null,
    Object? bodyCopy = null,
    Object? cta = null,
    Object? hashtags = null,
    Object? qualityScores = null,
    Object? platformCompliance = null,
    Object? platform = null,
    Object? tone = null,
    Object? modelUsed = null,
  }) {
    return _then(_$GenerateResponseImpl(
      headlines: null == headlines ? _value.headlines : headlines as List<String>,
      bodyCopy: null == bodyCopy ? _value.bodyCopy : bodyCopy as String,
      cta: null == cta ? _value.cta : cta as String,
      hashtags: null == hashtags ? _value.hashtags : hashtags as List<String>,
      qualityScores: null == qualityScores ? _value.qualityScores : qualityScores as QualityScores,
      platformCompliance: null == platformCompliance ? _value.platformCompliance : platformCompliance as PlatformCompliance,
      platform: null == platform ? _value.platform : platform as String,
      tone: null == tone ? _value.tone : tone as String,
      modelUsed: null == modelUsed ? _value.modelUsed : modelUsed as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateResponseImpl implements _GenerateResponse {
  const _$GenerateResponseImpl(
      {required this.headlines,
      @JsonKey(name: 'body_copy') required this.bodyCopy,
      required this.cta,
      this.hashtags = const [],
      @JsonKey(name: 'quality_scores') required this.qualityScores,
      @JsonKey(name: 'platform_compliance') required this.platformCompliance,
      required this.platform,
      required this.tone,
      @JsonKey(name: 'model_used') this.modelUsed = ''});

  factory _$GenerateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateResponseImplFromJson(json);

  @override
  final List<String> headlines;
  @override
  @JsonKey(name: 'body_copy')
  final String bodyCopy;
  @override
  final String cta;
  @override
  @JsonKey()
  final List<String> hashtags;
  @override
  @JsonKey(name: 'quality_scores')
  final QualityScores qualityScores;
  @override
  @JsonKey(name: 'platform_compliance')
  final PlatformCompliance platformCompliance;
  @override
  final String platform;
  @override
  final String tone;
  @override
  @JsonKey(name: 'model_used')
  final String modelUsed;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateResponseImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, headlines, bodyCopy, cta, platform, tone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateResponseImplCopyWith<_$GenerateResponseImpl> get copyWith =>
      __$$GenerateResponseImplCopyWithImpl<_$GenerateResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() => _$$GenerateResponseImplToJson(this);
}

abstract class _GenerateResponse implements GenerateResponse {
  const factory _GenerateResponse(
      {required final List<String> headlines,
      @JsonKey(name: 'body_copy') required final String bodyCopy,
      required final String cta,
      final List<String> hashtags,
      @JsonKey(name: 'quality_scores') required final QualityScores qualityScores,
      @JsonKey(name: 'platform_compliance') required final PlatformCompliance platformCompliance,
      required final String platform,
      required final String tone,
      @JsonKey(name: 'model_used') final String modelUsed}) = _$GenerateResponseImpl;

  factory _GenerateResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateResponseImpl.fromJson;

  @override
  List<String> get headlines;
  @override
  @JsonKey(name: 'body_copy')
  String get bodyCopy;
  @override
  String get cta;
  @override
  List<String> get hashtags;
  @override
  @JsonKey(name: 'quality_scores')
  QualityScores get qualityScores;
  @override
  @JsonKey(name: 'platform_compliance')
  PlatformCompliance get platformCompliance;
  @override
  String get platform;
  @override
  String get tone;
  @override
  @JsonKey(name: 'model_used')
  String get modelUsed;
  @override
  @JsonKey(ignore: true)
  _$$GenerateResponseImplCopyWith<_$GenerateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
