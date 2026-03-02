import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_request.freezed.dart';
part 'generate_request.g.dart';

@freezed
class GenerateRequest with _$GenerateRequest {
  const factory GenerateRequest({
    required String product,
    required String description,
    @JsonKey(name: 'target_audience') required String targetAudience,
    required String platform,
    required String tone,
    @Default('en') String language,
    @JsonKey(name: 'num_variations') @Default(5) int numVariations,
  }) = _GenerateRequest;

  factory GenerateRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateRequestFromJson(json);
}
