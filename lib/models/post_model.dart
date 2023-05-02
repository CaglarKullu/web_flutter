import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  @JsonKey(name: "user_email")
  String email;
  @JsonKey(name: "user_message")
  String message;
  @JsonKey(name: "user_subject")
  String subject;
  PostModel(
      {required this.email, required this.message, required this.subject});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
