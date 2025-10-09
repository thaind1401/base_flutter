import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_response.freezed.dart';
part 'data_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class DataResponse<T> with _$DataResponse<T> {
  const DataResponse._();
  
  const factory DataResponse({
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'meta') Meta? meta,
  }) = _DataResponse;

  factory DataResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$DataResponseFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
abstract class DataListResponse<T> with _$DataListResponse<T> {
  const DataListResponse._();
  
  const factory DataListResponse({
    @JsonKey(name: 'data') List<T>? data,
    @JsonKey(name: 'meta') Meta? meta,
  }) = _DataListResponse;

  factory DataListResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$DataListResponseFromJson(json, fromJsonT);
}

@freezed
abstract class Meta with _$Meta {
  const Meta._();
  
  const factory Meta({
    @JsonKey(name: 'pagy_info') PageInfo? pageInfo,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
abstract class PageInfo with _$PageInfo {
  const PageInfo._();
  
  const factory PageInfo({
    @JsonKey(name: 'next') int? next,
  }) = _PageInfo;

  factory PageInfo.fromJson(Map<String, dynamic> json) => _$PageInfoFromJson(json);
}
