import 'package:json_annotation/json_annotation.dart';
import 'package:wc_demo/src/outer_layer/model/user_response.dart';

part 'res.g.dart';

@JsonSerializable()
class Res{
  Res({this.response});
  final List<UserResponse> ?response;
  factory Res.fromJson(Map<String, dynamic> json) => _$ResFromJson(json);

  Map<String, dynamic> toJson() => _$ResToJson(this);
}