// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['name'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      suspentionTag: json['suspentionTag'] as String?,
    )..isShowSuspension = json['isShowSuspension'] as bool;

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'isShowSuspension': instance.isShowSuspension,
      'name': instance.name,
      'createdDate': instance.createdDate.toIso8601String(),
      'suspentionTag': instance.suspentionTag,
    };
