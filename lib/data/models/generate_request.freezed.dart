// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerateRequest _$GenerateRequestFromJson(Map<String, dynamic> json) {
  return _GenerateRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateRequest {
  String get product => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_audience')
  String get targetAudience => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_variations')
  int get numVariations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateRequestCopyWith<GenerateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateRequestCopyWith<$Res> {
  factory $GenerateRequestCopyWith(
          GenerateRequest value, $Res Function(GenerateRequest) then) =
      _$GenerateRequestCopyWithImpl<$Res, GenerateRequest>;
  @useResult
  $Res call(
      {String product,
      String description,
      @JsonKey(name: 'target_audience') String targetAudience,
      String platform,
      String tone,
      String language,
      @JsonKey(name: 'num_variations') int numVariations});
}

/// @nodoc
class _$GenerateRequestCopyWithImpl<$Res, $Val extends GenerateRequest>
    implements $GenerateRequestCopyWith<$Res> {
  _$GenerateRequestCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? description = null,
    Object? targetAudience = null,
    Object? platform = null,
    Object? tone = null,
    Object? language = null,
    Object? numVariations = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product as String,
      description: null == description
          ? _value.description
          : description as String,
      targetAudience: null == targetAudience
          ? _value.targetAudience
          : targetAudience as String,
      platform: null == platform
          ? _value.platform
          : platform as String,
      tone: null == tone
          ? _value.tone
          : tone as String,
      language: null == language
          ? _value.language
          : language as String,
      numVariations: null == numVariations
          ? _value.numVariations
          : numVariations as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateRequestImplCopyWith<$Res>
    implements $GenerateRequestCopyWith<$Res> {
  factory _$$GenerateRequestImplCopyWith(_$GenerateRequestImpl value,
          $Res Function(_$GenerateRequestImpl) then) =
      __$$GenerateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String product,
      String description,
      @JsonKey(name: 'target_audience') String targetAudience,
      String platform,
      String tone,
      String language,
      @JsonKey(name: 'num_variations') int numVariations});
}

/// @nodoc
class __$$GenerateRequestImplCopyWithImpl<$Res>
    extends _$GenerateRequestCopyWithImpl<$Res, _$GenerateRequestImpl>
    implements _$$GenerateRequestImplCopyWith<$Res> {
  __$$GenerateRequestImplCopyWithImpl(
      _$GenerateRequestImpl _value, $Res Function(_$GenerateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? description = null,
    Object? targetAudience = null,
    Object? platform = null,
    Object? tone = null,
    Object? language = null,
    Object? numVariations = null,
  }) {
    return _then(_$GenerateRequestImpl(
      product: null == product
          ? _value.product
          : product as String,
      description: null == description
          ? _value.description
          : description as String,
      targetAudience: null == targetAudience
          ? _value.targetAudience
          : targetAudience as String,
      platform: null == platform
          ? _value.platform
          : platform as String,
      tone: null == tone
          ? _value.tone
          : tone as String,
      language: null == language
          ? _value.language
          : language as String,
      numVariations: null == numVariations
          ? _value.numVariations
          : numVariations as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateRequestImpl implements _GenerateRequest {
  const _$GenerateRequestImpl(
      {required this.product,
      required this.description,
      @JsonKey(name: 'target_audience') required this.targetAudience,
      required this.platform,
      required this.tone,
      this.language = 'en',
      @JsonKey(name: 'num_variations') this.numVariations = 5});

  factory _$GenerateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateRequestImplFromJson(json);

  @override
  final String product;
  @override
  final String description;
  @override
  @JsonKey(name: 'target_audience')
  final String targetAudience;
  @override
  final String platform;
  @override
  final String tone;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey(name: 'num_variations')
  final int numVariations;

  @override
  String toString() {
    return 'GenerateRequest(product: $product, description: $description, targetAudience: $targetAudience, platform: $platform, tone: $tone, language: $language, numVariations: $numVariations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateRequestImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.targetAudience, targetAudience) ||
                other.targetAudience == targetAudience) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.numVariations, numVariations) ||
                other.numVariations == numVariations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product, description,
      targetAudience, platform, tone, language, numVariations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateRequestImplCopyWith<_$GenerateRequestImpl> get copyWith =>
      __$$GenerateRequestImplCopyWithImpl<_$GenerateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateRequestImplToJson(
      this,
    );
  }
}

abstract class _GenerateRequest implements GenerateRequest {
  const factory _GenerateRequest(
      {required final String product,
      required final String description,
      @JsonKey(name: 'target_audience') required final String targetAudience,
      required final String platform,
      required final String tone,
      final String language,
      @JsonKey(name: 'num_variations') final int numVariations}) = _$GenerateRequestImpl;

  factory _GenerateRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateRequestImpl.fromJson;

  @override
  String get product;
  @override
  String get description;
  @override
  @JsonKey(name: 'target_audience')
  String get targetAudience;
  @override
  String get platform;
  @override
  String get tone;
  @override
  String get language;
  @override
  @JsonKey(name: 'num_variations')
  int get numVariations;
  @override
  @JsonKey(ignore: true)
  _$$GenerateRequestImplCopyWith<_$GenerateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
