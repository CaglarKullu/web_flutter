// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      email: json['user_email'] as String,
      message: json['user_message'] as String,
      subject: json['user_subject'] as String,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'user_email': instance.email,
      'user_message': instance.message,
      'user_subject': instance.subject,
    };
