import 'package:json_annotation/json_annotation.dart';
import 'package:linkear/apis/models/entities/profile.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  ProfileResponse({
    this.success,
    this.user,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);

  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'user')
  Profile? user;
}
