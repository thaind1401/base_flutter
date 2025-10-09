import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_refresh_token_data.freezed.dart';
part 'api_refresh_token_data.g.dart';

@freezed
abstract class ApiRefreshTokenData with _$ApiRefreshTokenData {
  const ApiRefreshTokenData._();

  const factory ApiRefreshTokenData({
    @JsonKey(name: 'access_token') String? accessToken,
  }) = _ApiRefreshTokenData;

  factory ApiRefreshTokenData.fromJson(Map<String, dynamic> json) =>
      _$ApiRefreshTokenDataFromJson(json);
}
