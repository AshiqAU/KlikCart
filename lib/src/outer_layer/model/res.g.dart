// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Res _$ResFromJson(Map<String, dynamic> json) => Res(
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'response': instance.response,
    };
