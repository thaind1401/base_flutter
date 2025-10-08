// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordsListResponseImpl<T> _$$RecordsListResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$RecordsListResponseImpl<T>(
      records: (json['records'] as List<dynamic>?)?.map(fromJsonT).toList(),
      page: json['page'] as int?,
      offset: json['offset'] as int?,
      total: json['total'] as int?,
      next: json['next'] as int?,
      prev: json['prev'] as int?,
    );

Map<String, dynamic> _$$RecordsListResponseImplToJson<T>(
  _$RecordsListResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'records': instance.records?.map(toJsonT).toList(),
      'page': instance.page,
      'offset': instance.offset,
      'total': instance.total,
      'next': instance.next,
      'prev': instance.prev,
    };
